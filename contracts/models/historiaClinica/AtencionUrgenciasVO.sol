// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

import "./RegistroMedico.sol";
import "../structsGenerales/IncapacidadStruct.sol";

contract AtencionUrgenciasVO is RegistroMedico(TipoRegistroMedico.ATENCIONURGENCIASVO) {
    struct AtencionUrgenciasStruct {
        uint256 fechaIngreso;
        uint256 fechaSalida;
        string condicion;
        uint256 horasDeObservacion;
        bool salidaVivo;
        IncapacidadStruct incapacidad;
        string motivo;
        string diagnosticoIngreso;
        string diagnosticoSalida;
    }

    AtencionUrgenciasStruct private atencionUrgenciasStruct;

    function getFechaIngreso() public view returns (uint256) {
        return atencionUrgenciasStruct.fechaIngreso;
    }

    function getFechaSalida() public view returns (uint256) {
        return atencionUrgenciasStruct.fechaSalida;
    }

    function getCondicion() public view returns (string memory) {
        return atencionUrgenciasStruct.condicion;
    }

    function getHorasDeObservacion() public view returns (uint256) {
        return atencionUrgenciasStruct.horasDeObservacion;
    }

    function getSalidaVivo() public view returns (bool) {
        return atencionUrgenciasStruct.salidaVivo;
    }

    function getIncapacidad() public view returns (IncapacidadStruct memory) {
        return atencionUrgenciasStruct.incapacidad;
    }

    function getMotivo() public view returns (string memory) {
        return atencionUrgenciasStruct.motivo;
    }

    function getDiagnosticoIngreso() public view returns (string memory) {
        return atencionUrgenciasStruct.diagnosticoIngreso;
    }

    function getDiagnosticoSalida() public view returns (string memory) {
        return atencionUrgenciasStruct.diagnosticoSalida;
    }

    function getAtencionUrgenciasStruct()
        public
        view
        returns (AtencionUrgenciasStruct memory)
    {
        return atencionUrgenciasStruct;
    }

    function setAtencionUrgenciasStruct(
        AtencionUrgenciasStruct memory _atencionUrgenciasStruct
    ) public {
        atencionUrgenciasStruct = _atencionUrgenciasStruct;
    }

    function setFechaIngreso(uint256 _fechaIngreso) public {
        atencionUrgenciasStruct.fechaIngreso = _fechaIngreso;
    }

    function setFechaSalida(uint256 _fechaSalida) public {
        atencionUrgenciasStruct.fechaSalida = _fechaSalida;
    }

    function setCondicion(string memory _condicion) public {
        atencionUrgenciasStruct.condicion = _condicion;
    }

    function setHorasDeObservacion(uint256 _horasDeObservacion) public {
        atencionUrgenciasStruct.horasDeObservacion = _horasDeObservacion;
    }

    function setSalidaVivo(bool _salidaVivo) public {
        atencionUrgenciasStruct.salidaVivo = _salidaVivo;
    }

    function setIncapacidad(IncapacidadStruct memory _incapacidad) public {
        atencionUrgenciasStruct.incapacidad = _incapacidad;
    }

    function setMotivo(string memory _motivo) public {
        atencionUrgenciasStruct.motivo = _motivo;
    }

    function setDiagnosticoIngreso(string memory _diagnosticoIngreso) public {
        atencionUrgenciasStruct.diagnosticoIngreso = _diagnosticoIngreso;
    }

    function setDiagnosticoSalida(string memory _diagnosticoSalida) public {
        atencionUrgenciasStruct.diagnosticoSalida = _diagnosticoSalida;
    }
}
