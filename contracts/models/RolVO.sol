// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

import "./PermisoVO.sol";

contract RolVO {
    struct PermisoRol {
        uint256 id;
        PermisoVO permiso;
        bool accesoPermitido;
    }

    struct RolVoStruct {
        uint256 id;
        string nombre;
        string descripcion;
    }

    event Log(string data);

    uint256 private id;
    string private nombre;
    string private descripcion;
    bool private estaActivo;


    mapping(uint256 => PermisoRol) private permisos; // TODO: Hacer mapper de permisos, para la info de estos
    uint256[] private idsList; // NOTE Mapped Structs with Index

    function getRolVoValue() public view returns (RolVoStruct memory) {
        return RolVoStruct(id, nombre, descripcion);
    }

    function getId() public view returns (uint256) {
        return id;
    }

    function getNombre() public view returns (string memory) {
        return nombre;
    }

    function getDescripcion() public view returns (string memory) {
        return descripcion;
    }

    function getPermisos() public view returns (PermisoRol[] memory) {
        PermisoRol[] memory lista = new PermisoRol[](idsList.length);
        for (uint256 i = 0; i < idsList.length; i++) {
            lista[i] = permisos[idsList[i]];
        }
        return lista;
    }

    function getPermisosSize() public view returns (uint256) {
        return idsList.length;
    }

    /*function getPermisos() public view returns (IdValue[] memory) {
        IdValue[] memory lista = new IdValue[](idsList.length);
        for (uint256 i = 0; i < idsList.length; i++) {
            lista[i] = IdValue(idsList[i], permisos[idsList[i]]);
        }
        return lista;
    }*/

    function getPermiso(uint256 _id) public view returns (PermisoRol memory) {
        return permisos[_id];
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

    function setPermiso(
        uint256 _id,
        PermisoVO _permiso,
        bool _accesoPermitido
    ) public {
        if (permisos[_id].id == 0) {
            idsList.push(_id);
            permisos[_id] = PermisoRol(_id, _permiso, _accesoPermitido);
        }
        revert("Ya existe un permiso registrado para ese ID de metodo");
        
    }

    // TODO: Revisar lógica
    function setPermisos(PermisoRol[] memory _permisos) public {
        for (uint256 i = 0; i < _permisos.length; i++) {
            if (permisos[_permisos[i].id].id == 0) {
                idsList.push(_permisos[i].id);
            }
            permisos[_permisos[i].id] = _permisos[i];
        }
    }

    function setEstaActivo(bool _estaActivo) public {
        estaActivo = _estaActivo;
    }
}
