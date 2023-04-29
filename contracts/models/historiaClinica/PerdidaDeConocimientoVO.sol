// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

import "./RegistroMedico.sol";

contract PerdidaDeConocimientoVO is RegistroMedico (TipoRegistroMedico.PERDIDADECONOCIMIENTOVO) {
    struct PerdidaDeConocimientoStruct {
        string descripcion;
        uint256 fechaAproximada;
    }

    PerdidaDeConocimientoStruct private perdidaDeConocimientoStruct;

    function getDescripcion() public view returns (string memory) {
        return perdidaDeConocimientoStruct.descripcion;
    }

    function getFechaAproximada() public view returns (uint256) {
        return perdidaDeConocimientoStruct.fechaAproximada;
    }

    function getPerdidaDeConocimientoStruct()
        public
        view
        returns (PerdidaDeConocimientoStruct memory)
    {
        return perdidaDeConocimientoStruct;
    }

    function setPerdidaDeConocimientoStruct(
        PerdidaDeConocimientoStruct memory _perdidaDeConocimientoStruct
    ) public {
        perdidaDeConocimientoStruct = _perdidaDeConocimientoStruct;
    }

    function setDescripcion(string memory _descripcion) public {
        perdidaDeConocimientoStruct.descripcion = _descripcion;
    }

    function setFechaAproximada(uint256 _fechaAproximada) public {
        perdidaDeConocimientoStruct.fechaAproximada = _fechaAproximada;
    }
}
