// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

import "./RegistroMedico.sol";

contract TraumatismoVO is RegistroMedico (TipoRegistroMedico.TRAUMATISMOVO) {
    struct TraumatismoStruct {
        RegistroMedicoStruct registroMedico;
        string descripcion;
        int256 fechaAproximada;
    }

    TraumatismoStruct private traumatismoStruct;

    constructor() {
        creador = msg.sender;
        traumatismoStruct.registroMedico = getRegistroMedico();
    }

    function getDescripcion() public view returns (string memory) {
        return traumatismoStruct.descripcion;
    }

    function getFechaAproximada() public view returns (int256) {
        return traumatismoStruct.fechaAproximada;
    }

    function getTraumatismoStruct()
        public
        view
        returns (TraumatismoStruct memory)
    {
        return traumatismoStruct;
    }

    function setTraumatismoStruct(
        TraumatismoStruct memory _traumatismoStruct
    ) public {
        _traumatismoStruct.registroMedico = traumatismoStruct.registroMedico;
        traumatismoStruct = _traumatismoStruct;
    }

    function setDescripcion(string memory _descripcion) public {
        traumatismoStruct.descripcion = _descripcion;
    }

    function setFechaAproximada(int256 _fechaAproximada) public {
        traumatismoStruct.fechaAproximada = _fechaAproximada;
    }
}
