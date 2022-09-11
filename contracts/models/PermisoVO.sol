// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

contract PermisoVO {
    event Log(string data);
    uint256 id;
    string private nombre;
    string private descripcion;
    bool private estaActivo;

    function getId() public view returns (uint256) {
        return id;
    }

    function getNombre() public view returns (string memory) {
        return nombre;
    }

    function getDescripcion() public view returns (string memory) {
        return descripcion;
    }

    function getEstaActivo() public view returns (bool) {
        return estaActivo;
    }

    function setId(uint256 _id) public {
        id = _id;
    }

    function setNombre(string memory _nombre) public {
        nombre = _nombre;
    }

    function setDescripcion(string memory _descripcion) public {
        descripcion = _descripcion;
    }

    function setEstaActivo(bool _estaActivo) public {
        estaActivo = _estaActivo;
    }
}
