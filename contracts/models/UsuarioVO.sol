// SPDX-License-Identifier: MIT
pragma solidity ^0.8.10;

import "./RolVO.sol";

// NOTE: se deja el abstrac contract justo con sus hijos por cuestiones de ordenamiento de código solidity, antes decia "Definition of base has to precede definition of derived contract"
contract UsuarioVO {
    event Log(string data);

    address private direccion;
    RolVO private rol;
    bool private estaActivo;

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
