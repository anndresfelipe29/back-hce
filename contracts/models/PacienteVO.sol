// SPDX-License-Identifier: MIT
pragma solidity ^0.8.10;

import "./Persona.sol";
import "./structsGenerales/DatosPersonalesStruct.sol";
import "./VOGenerales/EstadoVO.sol";

contract PacienteVO is Persona {
    //
    EstadoVO private estado;
    DatosPersonalesStruct private datosPersonales;

    //uint256 private historiaClinicaId;  // TODO: sobra ya que hay un mapping que asocia una dirección con una historia clinica

    struct PacienteVOStruct {
        PersonaStruct persona;        
        DatosPersonalesStruct datosPersonales;
        EstadoVO.EstadoVOStruct estado;
        
    }

    function getPacienteVOValue() public view returns (PacienteVOStruct memory) {
        return PacienteVOStruct(
            getPersonaStructValue(),            
            datosPersonales,
            estado.getEstadoVOValue()
        );
    }

    function getEstado() public view returns (EstadoVO) {
        return estado;
    }

    function getDatosPersonales()
        public
        view
        returns (DatosPersonalesStruct memory)
    {
        return datosPersonales;
    }

    function setDatosPersonales(DatosPersonalesStruct memory _datosPersonales)
        public
    {
        datosPersonales = _datosPersonales;
    }

    function setEstado(EstadoVO _estado) public {
        estado = _estado;
    }
}
