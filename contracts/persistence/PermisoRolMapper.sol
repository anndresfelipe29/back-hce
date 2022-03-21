// SPDX-License-Identifier: MIT
pragma solidity ^0.8.10;
// import "../logica/Persona.sol";
import "../models/RolVO.sol";
import "./PermisoRolMapperInterface.sol";

contract PermisoRolMapper is PermisoRolMapperInterface {
    address public creador;
    /**
     * llave permisoId+RolId -> nool
     */
    mapping(uint256 => mapping(uint256 => bool)) private permisoRol;

    constructor() {
        creador = msg.sender;
    }

    function consultar(uint256 _permiso, uint256 _rol) external view returns (bool) {
        //emit Log("entro a consultar");
        return permisoRol[_permiso][_rol];
    }

    function guardar(uint256 _permiso, uint256 _rol, bool valor) public {
        permisoRol[_permiso][_rol] = valor;     
    }

    function actualizar(uint256 _permiso, uint256 _rol, bool valor) public {
        permisoRol[_permiso][_rol] = valor; 
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
