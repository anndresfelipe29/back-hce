// SPDX-License-Identifier: MIT
pragma solidity ^0.8.10; 

import "./Persona.sol";
import "../models/PacienteStruct.sol";

// TODO: cambiar el diagrama, no puede heredar pero si puede usar o componerse de persona
contract Paciente {
    event Log(string data);
    address public creador;
    address public ContratoPersonaAddress;

    Persona private contratoPersona;

    struct PersonaPacienteStruct {
        PersonaStruct persona;
        PacienteStruct paciente;
    }

    // EstadoStruct private estado;

    // DatosPersonales private datosPersonales;

    constructor() {
        creador = msg.sender; // creador del contrato
    }

    function consultar(address direccion)
        public
        returns (PersonaStruct memory)
    {
        emit Log("entro a consultar");
        try contratoPersona.consultar(direccion) returns (
            PersonaStruct memory response
        ) {
            emit Log("encontro la persona");
            return response;
        } catch Error(string memory e) {
            /*reason*/
            emit Log("se rompio por un revert o require");
            emit Log(e);
            revert("No existe ese paciente");
        }
    }

    function setPersonaAddress(address direccion) public esPropietario {
        ContratoPersonaAddress = direccion;
        contratoPersona = Persona(ContratoPersonaAddress);
    }

    modifier esPropietario() {
        require(
            msg.sender == creador,
            "Esta funcion solo puede ser ejecutada por el creador del contrato"
        );
        _; // acá se ejecuta la función
    }
}
