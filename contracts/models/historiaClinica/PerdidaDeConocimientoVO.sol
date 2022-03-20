// SPDX-License-Identifier: MIT
pragma solidity ^0.8.10;

import "../../logica/RegistroMedico.sol";

contract PerdidaDeConocimientoVO is RegistroMedico {
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

    function getAntecedentePatologicoPersonalStruct()
        public
        view
        returns (PerdidaDeConocimientoStruct memory)
    {
        return perdidaDeConocimientoStruct;
    }

    function setAntecedentePatologicoPersonalStruct(
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
