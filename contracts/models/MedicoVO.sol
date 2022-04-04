// SPDX-License-Identifier: MIT
pragma solidity ^0.8.10;

import "./Persona.sol";
import "./VOGenerales/EstadoVO.sol";

// NOTE: se deja el abstrac contract justo con sus hijos por cuestiones de ordenamiento de código solidity, antes decia "Definition of base has to precede definition of derived contract"
// TODO: verificar si se puede dejar como abstract
contract MedicoVO is Persona {
    //
    EstadoVO private estado;
    uint256 private especialidadId;
    string private usuario;
    string private contrasena;

    function getEstado() public view returns (EstadoVO) {
        return estado;
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

    function setEstado(EstadoVO _estado) public {
        estado = _estado;
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
