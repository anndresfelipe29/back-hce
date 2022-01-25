pragma solidity ^0.8.10; 

import "./Usuario.sol";
import "../models/PersonaStruct.sol";
import "../persistence/PersonaDAO.sol";

// NOTE: se deja el abstrac contract justo con sus hijos por cuestiones de ordenamiento de código solidity, antes decia "Definition of base has to precede definition of derived contract"
// TODO: verificar si se puede dejar como abstract
contract Persona {
    event Log(string data);

    // TODO: registrar la direccion del contrato personaDAO
    PersonaDAO private personaDao;

    constructor() public {
        // TODO: fijar valor en nulo y cargar el objeto desde un método nuevo con la dirección del contrato desplegado
        personaDao = new PersonaDAO(); //TODO: verificar si queda guardado el objeto o si hay mejor manera
    }

   
    function registrar(PersonaStruct memory persona) public {}

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
}


