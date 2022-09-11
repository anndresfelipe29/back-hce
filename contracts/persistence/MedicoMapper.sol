// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

import "../models/MedicoVO.sol";
import "./MedicoMapperInterface.sol";

contract MedicoMapper is MedicoMapperInterface {
    address public creador;

    mapping(address => MedicoVO) private medicos;
    address[] private addressList; // NOTE Mapped Structs with Index

    constructor() {
        creador = msg.sender;
    }

    function consultar(address direccion) public returns (MedicoVO) {
        MedicoVO medico = medicos[direccion];
        if (address(medico) == address(0)) {
            revert("No existe ese medico");
        }
        emit Log("Medico valido");
        return medico;
    }

    function guardar(address direccion, MedicoVO medico) public returns (uint256){
        if (address(medicos[direccion]) != address(0)) {
            revert("Ya existe un medico registrado con ese address");
        }        
        uint256 id = addressList.length;
        medico.setId(id);
        addressList.push(direccion);
        medicos[direccion] = medico;
        return id;        
    }

    function actualizar(address direccion, MedicoVO medico) public {
        if (address(medicos[direccion]) == address(0)) {
            revert("No existe un medico registrado con ese address");
        }
        medicos[direccion] = medico;
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
