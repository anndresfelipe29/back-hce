// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

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
    string private entidadId;

    struct MedicoVOStruct {
        PersonaStruct persona;
        uint256 especialidadId;
        uint256 estadoId;
        // EstadoVO.EstadoVOStruct estado;
    }

    function getMedicoVOValue() public view returns (MedicoVOStruct memory) {
        return
            MedicoVOStruct(
                getPersonaStructValue(),
                especialidadId,
                estado.getId()
            );
    }

    function setValuesOfMedicoVOStruct(
        MedicoVOStruct memory _medicoVOStruct,
        EstadoVO _estadoVO,
        TipoIdentificacionVO _tipoIdentificacionVO,
        string memory _usuario,
        string memory _contrasena
    ) public {
        setValuesOfPersonaStruct(
            _medicoVOStruct.persona,
            _tipoIdentificacionVO
        );        
        estado = _estadoVO;
        usuario = _usuario;
        contrasena = _contrasena;
    }

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
