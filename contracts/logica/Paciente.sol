// SPDX-License-Identifier: MIT
pragma solidity ^0.8.10;

import "./Persona.sol";
import "../models/PacienteStruct.sol";
import "../persistence/PacienteDAO.sol";

// TODO: cambiar el diagrama, no puede heredar pero si puede usar o componerse de persona
contract Paciente {
    event Log(string data);
    address public creador;
    address public ContratoPacienteDAOAddress;
    address public ContratoPersonaAddress;

    PacienteDAO private contratoPacienteDAO;
    Persona private contratoPersona;

    struct PersonaPacienteStruct {
        PersonaStruct persona;
        PacienteStruct paciente;
    }

    constructor() {
        creador = msg.sender; // creador del contrato
    }

    function consultar(address direccion)
        public
        returns (PersonaPacienteStruct memory pacienteInfo)
    {
        emit Log("entro a consultar");
        pacienteInfo.paciente = consultarPaciente(direccion);
        pacienteInfo.persona = consultarPersona(direccion);
    }

    function consultarPaciente(address direccion)
        public
        returns (PacienteStruct memory)
    {
        emit Log("entro a consultar Paciente");
        try contratoPacienteDAO.consultar(direccion) returns (
            PacienteStruct memory response
        ) {
            emit Log("encontro la Paciente");
            return response;
        } catch Error(string memory e) {
            /*reason*/
            emit Log("se rompio por un revert o require");
            emit Log(e);
            revert("No existe ese Paciente");
        }
    }

    function consultarPersona(address direccion)
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

    function setContratoPersonaAddress(address direccion) public esPropietario {
        ContratoPersonaAddress = direccion;
        contratoPersona = Persona(ContratoPersonaAddress);
    }
    function setContratoPacienteDAOAddress(address direccion) public esPropietario {
        ContratoPacienteDAOAddress = direccion;
        contratoPacienteDAO = PacienteDAO(ContratoPacienteDAOAddress);
    }

    modifier esPropietario() {
        require(
            msg.sender == creador,
            "Esta funcion solo puede ser ejecutada por el creador del contrato"
        );
        _; // acá se ejecuta la función
    }
}
