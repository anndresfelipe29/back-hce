// SPDX-License-Identifier: MIT
pragma solidity ^0.8.10;

contract RolVO {
    
    event Log(string data);
    string private nombre;
    string private descripcion;
    uint256[] private permisos;
    bool private estaActivo;

    function getNombre() public view returns (string memory) {
        return nombre;
    }

    function getDescripcion() public view returns (string memory) {
        return descripcion;
    }

    function getPermisos() public view returns (uint256[] memory) {
        return permisos;
    }

    function getEstaActivo() public view returns (bool) {
        return estaActivo;
    }

    function setNombre(string memory _nombre) public {
        nombre = _nombre;
    }

     function setDescripcion(string memory _descripcion) public {
        descripcion = _descripcion;
    }

    function setPermisos(uint256[] memory _permisos) public {
        permisos = _permisos;
    }

    function setEstaActivo(bool _estaActivo) public {
        estaActivo = _estaActivo;
    }
}
