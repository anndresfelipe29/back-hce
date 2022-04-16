// SPDX-License-Identifier: MIT
pragma solidity ^0.8.10;

import "../persistence/RolMapperInterface.sol";
import "../persistence/UsuarioMapperInterface.sol";
import "../persistence/RolMapper.sol";
import "../persistence/UsuarioMapper.sol";

contract Acceso {
    address public creador;
    //address public usuarioMapperAddress;

    UsuarioMapperInterface private usuarioMapper;

    // TODO Mejorar estos id's quemados
    /*uint256 rolPaciente = 1;
    uint256 rolMedico = 2;
    */
    constructor() {
        creador = msg.sender;
    }

    function login() public returns (UsuarioVO) {
        address direccion = msg.sender;
        return buscarUsuarioActivo(direccion);
    }

    // TODO Actualizar nombre y atributos de clase (eliminar registrar de deagrama de clases en la clase acceso)
    function buscarUsuarioActivo(address _direccion) public returns (UsuarioVO) {
        UsuarioVO usuario = usuarioMapper.consultar(_direccion);
        if (!usuario.getEstaActivo()) {
            revert("Usuario inactivo");
        }
        return usuario;
    }

    /*function usuarioEsMedico(address _direccion) public returns (bool) {
        UsuarioVO usuario = traerUsuarioActivo(_direccion);
        if (usuario.getRol().getId() == rolMedico) {
            return true;
        }
        return false;
    }

    function usuarioEsPaciente(address _direccion) public returns (bool) {
        UsuarioVO usuario = traerUsuarioActivo(_direccion);
        if (usuario.getRol().getId() == rolPaciente) {
            return true;
        }
        return false;
    }*/

    // TODO: Quizá cambiar el nombre por otro que describa mejor que valida que un usuario tenga un permiso especifico
    function validarPermisoDeRol(address _direccion, uint256 permisoId)
        public
        returns (bool)
    {
        try usuarioMapper.consultar(_direccion) returns (UsuarioVO usuario) {
            if (!usuario.getEstaActivo()) {
                return false;
            }
            RolVO rol = usuario.getRol();
            // RolVO rol= rolMapper.consultar(rolId);
            // rol.getPermiso(permisoId);
            return rol.getPermiso(permisoId).accesoPermitido;
        } catch Error(string memory e) {
            return false;
        }
    }

    /*function setPermisoRolMapper(address _permisoRolMapperAddress)
        public
        esPropietario
    {
        permisoRolMapperAddress = _permisoRolMapperAddress;
        permisoRolMapper = PermisoRolMapper(_permisoRolMapperAddress);
    }*/

    /*function setRolMapper(address _rolMapperAddress) public esPropietario {
        rolMapperAddress = _rolMapperAddress;
        rolMapper = RolMapper(_rolMapperAddress);
    }*/

    function setUsuarioMapper(UsuarioMapperInterface _usuarioMapperAddress)
        public
        esPropietario
    {
        // usuarioMapperAddress = _usuarioMapperAddress;
        // usuarioMapper = UsuarioMapper(_usuarioMapperAddress);
        usuarioMapper = _usuarioMapperAddress;
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
