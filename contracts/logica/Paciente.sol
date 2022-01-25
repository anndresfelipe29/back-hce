pragma solidity ^0.8.10; // TODO: Ajustar la versión por consenso con José

import "./Persona.sol";
import "../models/PersonaStruct.sol";
import "../persistence/PersonaDAO.sol";

contract Paciente is Persona {
    // address public creador;
    struct PacienteStruct {
        PersonaStruct persona;
        uint256 historiaClinicaId;
    }

    // EstadoStruct private estado;

    // DatosPersonales private datosPersonales;

    constructor() public {
        // creador = msg.sender; // creador del contrato
    }
}
