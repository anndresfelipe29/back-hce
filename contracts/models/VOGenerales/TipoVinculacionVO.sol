// SPDX-License-Identifier: MIT
pragma solidity ^0.8.10;

contract TipoVinculacionVO{
    uint256 private id;
    string private nombre;
    string private beneficios;
    bool private estaActivo;

    struct TipoVinculacionVOStruct {
        uint256  id;
        string  nombre;
        string  beneficios; // Convertir a arreglo
        bool  estaActivo;
    }

    function getTipoVinculacionVOValue() public view returns (TipoVinculacionVOStruct memory) {
        return TipoVinculacionVOStruct(
            id,
            nombre,
            beneficios,
            estaActivo
        );
    }

    function setValueOfTipoVinculacionVOStruct(TipoVinculacionVOStruct memory tipoVinculacionVOStruct) public {
        id = tipoVinculacionVOStruct.id;
        nombre = tipoVinculacionVOStruct.nombre;
        beneficios = tipoVinculacionVOStruct.beneficios;
        estaActivo = tipoVinculacionVOStruct.estaActivo;
    }

    function getId() public view returns (uint256) {
        return id;
    }

    function getNombre() public view returns (string memory) {
        return nombre;
    }

    function getBeneficios() public view returns (string memory) {
        return beneficios;
    }

    function getEstaActivo() public view returns (bool) {
        return estaActivo;
    }

    function setNombre(string memory _nombre) public {
        nombre = _nombre;
    }

    function setBeneficios(string memory _beneficios) public {
        beneficios = _beneficios;
    }

    function setId(uint256 _id) public {
        id = _id;
    }
}