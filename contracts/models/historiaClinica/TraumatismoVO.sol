// SPDX-License-Identifier: MIT
pragma solidity ^0.8.10;

import "../../logica/RegistroMedico.sol";

contract TraumatismoVO is RegistroMedico {
    struct TraumatismoStruct {
        string descripcion;
        uint256 fechaAproximada;
    }

    TraumatismoStruct private traumatismoStruct;

    function getDescripcion() public view returns (string memory) {
        return traumatismoStruct.descripcion;
    }

    function getFechaAproximada() public view returns (uint256) {
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
        traumatismoStruct = _traumatismoStruct;
    }

    function setDescripcion(string memory _descripcion) public {
        traumatismoStruct.descripcion = _descripcion;
    }

    function setFechaAproximada(uint256 _fechaAproximada) public {
        traumatismoStruct.fechaAproximada = _fechaAproximada;
    }
}
