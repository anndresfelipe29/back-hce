// SPDX-License-Identifier: MIT
pragma solidity ^0.8.10;

import "./Usuario.sol";
import "../models/PersonaStruct.sol";
import "../persistence/PersonaDAO.sol";

// NOTE: se deja el abstrac contract justo con sus hijos por cuestiones de ordenamiento de código solidity, antes decia "Definition of base has to precede definition of derived contract"
// TODO: verificar si se puede dejar como abstract
contract Persona {
    event Log(string data);
    address public creador;
    address public PersonaDAOAddress;

    // TODO: registrar la direccion del contrato personaDAO
    PersonaDAO private personaDao;

    constructor() {
        creador = msg.sender;
    }

    // TODO: agregar modifier para retornar un revert más bonito, para cuando la direccion del dao sea invalida
    function consultar(address direccion)
        external
        returns (PersonaStruct memory)
    {
        emit Log("entro a consultar");
        try personaDao.consultar(direccion) returns (
            PersonaStruct memory persona
        ) {
            emit Log("encontro la persona");
            // TODO: validar si esta activa
            return persona;
        } catch Error(string memory e) {
            emit Log(e);
            emit Log("se rompio por un revert o require"); // TODO: ver si puedo obtener info de e y reusarla
            revert("No existe ese paciente");
        }
    }

    function registrar(address direccion, PersonaStruct memory persona) public {
        try personaDao.guardar(direccion, persona) {
            emit Log("Se guarda la persona correctamente");
        } catch Error(string memory data) {
            /*reason*/
            emit Log("se rompio por un revert o require");
            emit Log(data);
        }
    }

    function setPersonaDAOAddress(address direccion) public esPropietario {
        PersonaDAOAddress = direccion;
        personaDao = PersonaDAO(PersonaDAOAddress);
    }

    modifier esPropietario() {
        // NOTE: Los string no pueden llevar acentos, encontrar una forma de usarlos
        require(
            msg.sender == creador,
            "Esta funcion solo puede ser ejecutada por el creador del contrato"
        );
        _; // acá se ejecuta la función
    }
}
