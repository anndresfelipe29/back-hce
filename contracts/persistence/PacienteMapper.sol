// SPDX-License-Identifier: MIT
pragma solidity ^0.8.10;
// import "../logica/Persona.sol";
import "../models/PacienteVO.sol";
import "./PacienteMapperInterface.sol";

contract PacienteMapper is PacienteMapperInterface {
    address public creador;

    mapping(address => PacienteVO) private pacientes;

    constructor() {
        creador = msg.sender;
    }

    function consultar(address direccion) public returns (PacienteVO) {
        emit Log("entro a consultar");
        PacienteVO paciente = pacientes[direccion];
        if (address(paciente) == address(0)) {
            revert("No existe ese paciente");
        }
        emit Log("Paciente valido");
        return paciente;
    }

    function guardar(address direccion, PacienteVO _paciente) public {
        if (address(pacientes[direccion]) != address(0)) {
            emit Log("Ya existe un paciente registrado con ese address");
            revert("Ya existe un paciente registrado con ese address");
        }
        pacientes[direccion] = _paciente;
    }

    function actualizar(address direccion, PacienteVO paciente) public {
        if (address(pacientes[direccion]) == address(0)) {
            revert("No existe un paciente registrado con ese address");
        }
        pacientes[direccion] = paciente;
    }

    modifier esPropietario() {
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
