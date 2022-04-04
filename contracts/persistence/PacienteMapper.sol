// SPDX-License-Identifier: MIT
pragma solidity ^0.8.10;
// import "../logica/Persona.sol";
import "../models/PacienteVO.sol";
import "./PacienteMapperInterface.sol";

contract PacienteMapper is PacienteMapperInterface {
    address public creador;

    mapping(address => PacienteVO) private pacientes;
    address[] private addressList; // NOTE Mapped Structs with Index

    constructor() {
        creador = msg.sender;
    }

    function consultar(address direccion) external view returns (PacienteVO) {
        PacienteVO paciente = pacientes[direccion];
        if (address(paciente) == address(0)) {
            revert("No existe ese paciente");
        }
        return paciente;
    }

    function guardar(address direccion, PacienteVO _paciente) public {
        if (address(pacientes[direccion]) != address(0)) {
            emit Log("Ya existe un paciente registrado con ese address");
            revert("Ya existe un paciente registrado con ese address");
        }
        pacientes[direccion] = _paciente;
        addressList.push(direccion);
    }

    function actualizar(address direccion, PacienteVO paciente) public {
        if (address(pacientes[direccion]) == address(0)) {
            revert("No existe un paciente registrado con ese address");
        }
        pacientes[direccion] = paciente;
    }

    function size() external view returns(uint){
        return addressList.length;
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
