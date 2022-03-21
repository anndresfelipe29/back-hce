// SPDX-License-Identifier: MIT
pragma solidity ^0.8.10;

// NOTE: se deja el abstrac contract justo con sus hijos por cuestiones de ordenamiento de código solidity, antes decia "Definition of base has to precede definition of derived contract"
contract UsuarioVO {
    event Log(string data);

    address private direccion;
    uint256 private rolId;
    bool private estaActivo;

    function getDireccion() public view returns (address) {
        return direccion;
    }

    /**
    * 0. paciente
    * 1. médico
     */
    function getRolId() public view returns (uint256) {
        return rolId;
    }

    function getEstaActivo() public view returns (bool) {
        return estaActivo;
    }

    function setDireccion(address _direccion) public {
        direccion = _direccion;
    }

    function setRolId(uint256 _rolId) public {
        rolId = _rolId;
    }

    function setEstaActivo(bool _estaActivo) public {
        estaActivo = _estaActivo;
    }
}
