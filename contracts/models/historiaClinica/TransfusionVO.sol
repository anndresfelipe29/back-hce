// SPDX-License-Identifier: MIT
pragma solidity ^0.8.10;

import "../../logica/RegistroMedico.sol";


contract TransfusionVO is RegistroMedico {
    struct TransfusionStruct {
        uint cantidad;
        string reacciones;
        uint256 fechaTransfusion;        
    }

    TransfusionStruct private transfusionStruct;

    function getCantidad() public view returns (uint256) {
        return transfusionStruct.cantidad;
    }

    function getReacciones() public view returns (string memory) {
        return transfusionStruct.reacciones;
    }

    function getFechaTransfusion() public view returns (uint256) {
        return transfusionStruct.fechaTransfusion;
    }

    function getTransfusionStruct()
        public
        view
        returns (TransfusionStruct memory)
    {
        return transfusionStruct;
    }

    function setTransfusionStruct(
        TransfusionStruct memory _transfusionStruct
    ) public {
        transfusionStruct = _transfusionStruct;
    }

    function setCantidad(uint256 _cantidad) public {
        transfusionStruct.cantidad = _cantidad;
    }

    function setReacciones(string memory _reacciones) public {
        transfusionStruct.reacciones = _reacciones;
    }

    function setFechaTransfusion(uint256 _fechaTransfusion) public {
        transfusionStruct.fechaTransfusion = _fechaTransfusion;
    }
}
