// SPDX-License-Identifier: MIT
pragma solidity ^0.8.10;
// import "../logica/Persona.sol";
import "../models/PersonaStruct.sol";

contract PacienteDAO {
    event Log(string data);

    address public creador;

    mapping(address => PersonaStruct) public pacientes; // TODO: Dejar como private

    // TODO: convertir en singleton
    constructor() {
        creador = msg.sender; // creador del contrato
    }

    function consultar(address direccion)
        public
        returns (PersonaStruct memory)
    {
        emit Log("entro a consultar");
        PersonaStruct memory paciente = pacientes[direccion];
        if (!paciente.isValue) {
            emit Log("no existe el paciente");
            revert("No existe ese paciente");
        }
        emit Log("Paciente valido");
        return paciente;
    }

    function guardar(address direccion, PersonaStruct memory paciente) public {
        // TODO: quitar return en clase de enterprise architect
        // TODO: Validar, si falla poner excepción
        if (pacientes[direccion].isValue) {
            emit Log("Ya existe un paciente registrado con ese address");
            revert("Ya existe uan paciente registrado con ese address");
        }
        pacientes[direccion] = paciente;
    }
}
