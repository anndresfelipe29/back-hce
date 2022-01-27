pragma solidity ^0.8.10; // TODO: Ajustar la versión por consenso con José

import "./Persona.sol";
import "../models/PacienteStruct.sol";
// import "../models/PersonaStruct.sol";
import "../persistence/PersonaDAO.sol";

contract Paciente is Persona {
    // address public creador;
    struct PersonaPacienteStruct {
        PersonaStruct persona;
        PacienteStruct paciente;
    }

    // EstadoStruct private estado;

    // DatosPersonales private datosPersonales;

    constructor() public {
        // creador = msg.sender; // creador del contrato
    }

    function consultar2(address direccion)
        public
        returns (PersonaStruct memory)
    {
        emit Log("entro a consultar");
        try Persona.consultar(direccion) returns (
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

}
