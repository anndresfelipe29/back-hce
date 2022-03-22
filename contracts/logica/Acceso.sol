// SPDX-License-Identifier: MIT
pragma solidity ^0.8.10;

import "../persistence/PermisoRolMapperInterface.sol";
import "../persistence/RolMapperInterface.sol";
import "../persistence/UsuarioMapperInterface.sol";
import "../persistence/PermisoRolMapper.sol";
import "../persistence/RolMapper.sol";
import "../persistence/UsuarioMapper.sol";

contract Acceso {
    address public creador;
    address public usuarioMapperAddress;
    address public permisoRolMapperAddress;
    // address public rolMapperAddress;

    UsuarioMapperInterface private usuarioMapper;
    PermisoRolMapperInterface private permisoRolMapper;
    // RolMapperInterface private rolMapper;

    uint256 rolPaciente = 0;
    uint256 rolMedico = 1;

    constructor() {
        creador = msg.sender;
    }

    function login() public returns (UsuarioVO) {
        address direccion = msg.sender;
        return traerUsuarioActivo(direccion);
    }

    function traerUsuarioActivo(address _direccion) public returns (UsuarioVO) {
        UsuarioVO usuario = usuarioMapper.consultar(_direccion);
        if (!usuario.getEstaActivo()) {
            revert("Usuario inactivo");
        }
        return usuario;
    }

    function usuarioEsMedico(address _direccion) public returns (bool) {
        UsuarioVO usuario = traerUsuarioActivo(_direccion);
        if (usuario.getRolId() == rolMedico) {
            return true;
        }
        return false;
    }

    function usuarioEsPaciente(address _direccion) public returns (bool) {
        UsuarioVO usuario = traerUsuarioActivo(_direccion);
        if (usuario.getRolId() == rolPaciente) {
            return true;
        }
        return false;
    }

    // TODO: Quizá cambiar el nombre por otro que describa mejor que valida que un usuario tenga un permiso especifico
    function buscarPermisoDeRol(address _direccion, uint256 permisoId)
        public
        returns (bool)
    {
        try usuarioMapper.consultar(_direccion) returns (UsuarioVO usuario) {
            if (!usuario.getEstaActivo()) {
                return false;
            }
            uint256 rolId = usuario.getRolId();
            // RolVO rol= rolMapper.consultar(rolId);
            return permisoRolMapper.consultar(permisoId, rolId);
        } catch Error(string memory e) {
            return false;
        }
    }

    function setPermisoRolMapper(address _permisoRolMapperAddress)
        public
        esPropietario
    {
        permisoRolMapperAddress = _permisoRolMapperAddress;
        permisoRolMapper = PermisoRolMapper(_permisoRolMapperAddress);
    }

    /*function setRolMapper(address _rolMapperAddress) public esPropietario {
        rolMapperAddress = _rolMapperAddress;
        rolMapper = RolMapper(_rolMapperAddress);
    }*/

    function setUsuarioMapper(address _usuarioMapperAddress)
        public
        esPropietario
    {
        usuarioMapperAddress = _usuarioMapperAddress;
        usuarioMapper = UsuarioMapper(_usuarioMapperAddress);
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
