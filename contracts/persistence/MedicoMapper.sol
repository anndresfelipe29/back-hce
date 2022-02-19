// SPDX-License-Identifier: MIT
pragma solidity ^0.8.10;

import "../models/MedicoVO.sol";
import "./MedicoMapperInterface.sol";

contract MedicoMapper is MedicoMapperInterface {
    address public creador;

    mapping(address => MedicoVO) private medicos;

    constructor() {
        creador = msg.sender;
    }

    function consultar(address direccion) public returns (MedicoVO) {
        emit Log("entro a consultar");
        MedicoVO medico = medicos[direccion];
        if (address(medico) == address(0)) {
            revert("No existe ese medico");
        }
        emit Log("Medico valido");
        return medico;
    }

    function guardar(address direccion, MedicoVO medico) public {
        if (address(medicos[direccion]) != address(0)) {
            revert("Ya existe un medico registrado con ese address");
        }
        medicos[direccion] = medico;
    }

    function actualizar(address direccion, MedicoVO medico) public {
        if (address(medicos[direccion]) == address(0)) {
            revert("No existe un medico registrado con ese address");
        }
        medicos[direccion] = medico;
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
