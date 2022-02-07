// SPDX-License-Identifier: MIT
pragma solidity ^0.8.10;

import "../models/MedicoStruct.sol";

contract MedicoDAO {
    event Log(string data);
    address public creador;
    
    mapping(address => MedicoStruct) private medicos;

    constructor() {
        creador = msg.sender;
    }

    function consultar(address direccion) public returns (MedicoStruct memory) {
        emit Log("entro a consultar");
        MedicoStruct memory medico = medicos[direccion];
        if (!medico.isValue) {
            emit Log("no existe el medico");
            revert("No existe ese medico");
        }
        emit Log("Medico valido");
        return medico;
    }

    function guardar(address direccion, MedicoStruct memory medico) public {
        if (medicos[direccion].isValue) {
            emit Log("Ya existe un medico registrado con ese address");
            revert("Ya existe un medico registrado con ese address");
        }
        medicos[direccion] = medico;
    }

    function actualizar(address direccion, MedicoStruct memory medico) public {
        if (!medicos[direccion].isValue) {
            emit Log("No existe un medico registrado con ese address");
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
