// SPDX-License-Identifier: MIT
pragma solidity ^0.8.10;

import "./Persona.sol";

// NOTE: se deja el abstrac contract justo con sus hijos por cuestiones de ordenamiento de código solidity, antes decia "Definition of base has to precede definition of derived contract"
// TODO: verificar si se puede dejar como abstract
contract MedicoVO is Persona {
    //
    uint256 private estadoId;
    uint256 private especialidadId;
    string private usuario;
    string private contrasena;

    function getEstadoId() public view returns (uint256) {
        return estadoId;
    }

    function getEspecialidadId() public view returns (uint256) {
        return especialidadId;
    }

    function getUsuario() public view returns (string memory) {
        return usuario;
    }

    function getContrasena() public view returns (string memory) {
        return contrasena;
    }

    function setEstadoId(uint256 _estadoId) public {
        estadoId = _estadoId;
    }

    function setEspecialidadId(uint256 _especialidadId) public {
        especialidadId = _especialidadId;
    }

    function setUsuario(string memory _usuario) public {
        usuario = _usuario;
    }

    function setContrasena(string memory _contrasena) public {
        contrasena = _contrasena;
    }
}
