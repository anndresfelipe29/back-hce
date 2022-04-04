// SPDX-License-Identifier: MIT
pragma solidity ^0.8.10;

contract RolVO {
    struct IdValue {
        uint256 id;
        bool value;
    }

    event Log(string data);

    uint256 private id;
    string private nombre;
    string private descripcion;
    mapping(uint256 => bool) private permisos; // TODO: Hacer mapper de permisos, para la info de estos
    uint256[] private idsList; // NOTE Mapped Structs with Index
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

    function getPermisos() public view returns (IdValue[] memory) {
        IdValue[] memory lista = new IdValue[](idsList.length);
        for (uint256 i = 0; i < idsList.length; i++) {
            lista[i] = IdValue(idsList[i], permisos[idsList[i]]);
        }
        return lista;
    }

    function getPermiso(uint256 _id) public view returns (bool) {
        return permisos[id];
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

    function setPermiso(uint256 _id, bool _estado) public {
        permisos[_id] = _estado;
    }

    function setPermisos(IdValue[] memory _permisos) public {
        for (uint256 i = 0; i < _permisos.length; i++) {
            permisos[_permisos[i].id] = _permisos[i].value;
        }        
    }

    function setEstaActivo(bool _estaActivo) public {
        estaActivo = _estaActivo;
    }
}
