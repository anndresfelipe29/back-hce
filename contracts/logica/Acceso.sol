// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

import "../persistence/RolMapperInterface.sol";
import "../persistence/UsuarioMapperInterface.sol";
import "../persistence/RolMapper.sol";
import "../persistence/UsuarioMapper.sol";


contract Acceso {
    address public creador;

    UsuarioMapperInterface private usuarioMapper;



    constructor() {
        creador = msg.sender;
    }

    function login() public returns (UsuarioVO.UsuarioVoStruct memory) {
        address direccion = msg.sender;
        return buscarUsuarioActivo(direccion).getUsuarioVOValue();
    }

    // TODO Actualizar nombre y atributos de clase (eliminar registrar de deagrama de clases en la clase acceso)
    function buscarUsuarioActivo(address _direccion)
        public
        returns (UsuarioVO)
    {
        UsuarioVO usuario = usuarioMapper.consultar(_direccion);
        if (!usuario.getEstaActivo()) {
            revert("Usuario inactivo");
        }
        return usuario;
    }

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
            return rol.getPermiso(permisoId).accesoPermitido;
        } catch Error(string memory e) {
            return false;
        }
    }

    function setUsuarioMapper(UsuarioMapperInterface _usuarioMapperAddress)
        public
        esPropietario
    {
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
