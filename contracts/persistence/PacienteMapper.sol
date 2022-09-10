// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;
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

    
    function consultarPorId(uint256 id) external view returns (PacienteVO) {
        address direccion = addressList[id];
        if (direccion == address(0)) {
            revert("No existe ese paciente");
        }
        PacienteVO paciente = pacientes[direccion];
        return paciente;
    }

    function consultar(address direccion) external view returns (PacienteVO) {
        PacienteVO paciente = pacientes[direccion];
        if (address(paciente) == address(0)) {
            revert("No existe ese paciente");
        }
        return paciente;
    }

    function guardar(address direccion, PacienteVO _paciente) public returns (uint256){
        if (address(pacientes[direccion]) != address(0)) {
            emit Log("Ya existe un paciente registrado con ese address");
            revert("Ya existe un paciente registrado con ese address");
        }
        uint256 id = addressList.length;
        _paciente.setId(id);
        addressList.push(direccion);
        pacientes[direccion] = _paciente;
        return id; 
    }

    function actualizar(address direccion, PacienteVO paciente) public {
        if (address(pacientes[direccion]) == address(0)) {
            revert("No existe un paciente registrado con ese address");
        }
        pacientes[direccion] = paciente;
    }

    function size() external view returns (uint256) {
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
