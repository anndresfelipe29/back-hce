// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

import "./RolVO.sol";

contract UsuarioVO {
    event Log(string data);

    address private direccion;
    RolVO private rol; // TODO dejar esto como array para que un usuario pueda ser médico y paciente al tiempo
    bool private estaActivo;

    struct UsuarioVoStruct {
        address direccion;
        RolVO.RolVoStruct rol;
        bool estaActivo;
    }

    function getUsuarioVOValue() public view returns (UsuarioVoStruct memory) {
        return UsuarioVoStruct(
            direccion,
            rol.getRolVoValue(),
            estaActivo
        );
    }

    function getDireccion() public view returns (address) {
        return direccion;
    }

    function getRol() public view returns (RolVO) {
        return rol;
    }

    function getEstaActivo() public view returns (bool) {
        return estaActivo;
    }

    function setDireccion(address _direccion) public {
        direccion = _direccion;
    }

    function setRol(RolVO _rol) public {
        rol = _rol;
    }

    function setEstaActivo(bool _estaActivo) public {
        estaActivo = _estaActivo;
    }
}
