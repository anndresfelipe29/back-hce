// SPDX-License-Identifier: MIT
pragma solidity ^0.8.10;
// import "../logica/Persona.sol";
import "../models/PermisoVO.sol";
import "./PermisoMapperInterface.sol";

// TODO Deuda tecnica, agregar al diagrama de clases
contract PermisoMapper is PermisoMapperInterface {
    address public creador;
    mapping(uint256 => PermisoVO) private permisos;
    uint256[] private idsList; // NOTE Mapped Structs with Index

    constructor() {
        creador = msg.sender;
    }

    function consultar(uint256 _id) external view returns (PermisoVO) {
        //emit Log("entro a consultar");
        PermisoVO permisoVO = permisos[_id];
        if (address(permisoVO) == address(0)) {
            revert("No existe ese permiso");
        }
        return permisoVO;
    }

    function getPermisosSize() public view returns (uint256) {
        return idsList.length;
    }

    function getPermisos() public view returns (PermisoVO[] memory) {
        PermisoVO[] memory lista = new PermisoVO[](idsList.length);
        for (uint256 i = 0; i < idsList.length; i++) {
            lista[i] = permisos[idsList[i]];
        }
        return lista;
    }

    function guardar(uint256 _id, PermisoVO _permiso) public {
        if (address(permisos[_id]) != address(0)) {
            emit Log("Ya existe un permiso registrado con ese address");
            revert("Ya existe un permiso registrado con ese address");
        }
        permisos[_id] = _permiso;
        idsList.push(_id);
    }

    function actualizar(uint256 _id, PermisoVO _permiso) public {
        if (address(permisos[_id]) == address(0)) {
            revert("No existe un permiso registrado con ese address");
        }
        permisos[_id] = _permiso;
    }

    modifier esPropietario() {
        require(
            msg.sender == creador,
            "Esta funcion solo puede ser ejecutada por el creador del contrato"
        );
        _; // acá se ejecuta la función
    }

    function selfDestruct() public esPropietario {
        selfdestruct(payable(creador));
    }
}
