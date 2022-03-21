// SPDX-License-Identifier: MIT
pragma solidity ^0.8.10;

contract PermisoVO {
    event Log(string data);
    uint256 id;
    string private nombre;
    string private descripcion;
    // mapping(uint256 => bool) private accesoPorRol;
    uint256 rolesRegistrados;
    bool private estaActivo;

    function getNombre() public view returns (string memory) {
        return nombre;
    }

    function getDescripcion() public view returns (string memory) {
        return descripcion;
    }

    /*function getAccesoPorRol(uint256 _rolId) public view returns (bool) {
        return accesoPorRol[_rolId];
    }

    function getAllAccesoPorRol() public view returns (bool) {
        return accesoPorRol[_rolId];
    }*/

    function getEstaActivo() public view returns (bool) {
        return estaActivo;
    }

    function setNombre(string memory _nombre) public {
        nombre = _nombre;
    }

    function setDescripcion(string memory _descripcion) public {
        descripcion = _descripcion;
    }

    /*function setAccesoPorRol(uint256 _rolId) public {
        accesoPorRol = _accesoPorRol;
    }*/

    function setEstaActivo(bool _estaActivo) public {
        estaActivo = _estaActivo;
    }
}
