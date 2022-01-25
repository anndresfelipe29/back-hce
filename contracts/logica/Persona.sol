pragma solidity ^0.8.10;

import "./Usuario.sol";
import "../models/PersonaStruct.sol";
import "../persistence/PersonaDAO.sol";

// NOTE: se deja el abstrac contract justo con sus hijos por cuestiones de ordenamiento de código solidity, antes decia "Definition of base has to precede definition of derived contract"
// TODO: verificar si se puede dejar como abstract
contract Persona {
    event Log(string data);
    address public propietario;
    address public PersonaDAOAddress;

    // TODO: registrar la direccion del contrato personaDAO
    PersonaDAO private personaDao;

    constructor() public {
        propietario = msg.sender;
    }

    function registrar(PersonaStruct memory persona) public {}

    // TODO: agregar modifier para retornar un revert más bonito, para cuando la direccion del dao sea invalida
    function consultar(address direccion)
        public
        returns (PersonaStruct memory)
    {
        emit Log("entro a consultar");
        try personaDao.consultar(direccion) returns (
            PersonaStruct memory persona
        ) {
            emit Log("encontro la persona");
            return persona;
        } catch Error(string memory e) {
            /*reason*/
            emit Log("se rompio por un revert o require");
            emit Log(e);
        }
    }

    function guardar(address direccion, PersonaStruct memory persona) public {
        // TODO: Validar, si falla poner excepción
        try personaDao.guardar(direccion, persona) {
            emit Log("Se guarda la persona coreectamente");
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
            msg.sender == propietario,
            "Esta funcion solo puede ser ejecutada por el creador del contrato"
        );
        _; // acá se ejecuta la función
    }

    modifier daoNoEsNulo() {
        require(
            msg.sender == propietario,
            "Esta funcion solo puede ser ejecutada por el creador del contrato"
        );
        _; // acá se ejecuta la función
    }
}
