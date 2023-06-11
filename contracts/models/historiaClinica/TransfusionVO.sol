// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

import "./RegistroMedico.sol";


contract TransfusionVO is RegistroMedico (TipoRegistroMedico.TRANSFUSIONVO) {
    struct TransfusionStruct {
        RegistroMedicoStruct registroMedico;
        uint cantidad;
        string reacciones;
        int256 fechaTransfusion;        
    }

    TransfusionStruct private transfusionStruct;

    constructor() {
        creador = msg.sender;
        transfusionStruct.registroMedico = getRegistroMedico();
    }

    function getCantidad() public view returns (uint256) {
        return transfusionStruct.cantidad;
    }

    function getReacciones() public view returns (string memory) {
        return transfusionStruct.reacciones;
    }

    function getFechaTransfusion() public view returns (int256) {
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
        _transfusionStruct.registroMedico = transfusionStruct.registroMedico;
        transfusionStruct = _transfusionStruct;
    }

    function setCantidad(uint256 _cantidad) public {
        transfusionStruct.cantidad = _cantidad;
    }

    function setReacciones(string memory _reacciones) public {
        transfusionStruct.reacciones = _reacciones;
    }

    function setFechaTransfusion(int256 _fechaTransfusion) public {
        transfusionStruct.fechaTransfusion = _fechaTransfusion;
    }
}
