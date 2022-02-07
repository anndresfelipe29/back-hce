// SPDX-License-Identifier: MIT
pragma solidity ^0.8.10;
// import "../logica/Persona.sol";
import "../models/PacienteStruct.sol";

contract PacienteDAO {
    event Log(string data);
    address public creador;

    mapping(address => PacienteStruct) private pacientes;

    constructor() {
        creador = msg.sender;
    }

    function consultar(address direccion)
        public
        returns (PacienteStruct memory)
    {
        emit Log("entro a consultar");
        PacienteStruct memory paciente = pacientes[direccion];
        if (!paciente.isValue) {
            emit Log("no existe el paciente");
            revert("No existe ese paciente");
        }
        emit Log("Paciente valido");
        return paciente;
    }

    function guardar(address direccion, PacienteStruct memory paciente) public {
        if (pacientes[direccion].isValue) {
            emit Log("Ya existe un paciente registrado con ese address");
            revert("Ya existe uan paciente registrado con ese address");
        }
        pacientes[direccion] = paciente;
    }

    function actualizar(address direccion, PacienteStruct memory paciente) public {
        if (!pacientes[direccion].isValue) {
            emit Log("No existe un paciente registrado con ese address");
            revert("No existe una paciente registrado con ese address");
        }
        pacientes[direccion] = paciente;
    }

    modifier esPropietario() {
        // NOTE: Los string no pueden llevar acentos, encontrar una forma de usarlos
        require(
            msg.sender == creador,
            "Esta funcion solo puede ser ejecutada por el creador del contrato"
        );
        _; // acá se ejecuta la función
    }

    function selfDestruct() public esPropietario {
        selfdestruct(payable(creador));
    }
}
