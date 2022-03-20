// SPDX-License-Identifier: MIT
pragma solidity ^0.8.10;

import "../../logica/RegistroMedico.sol";
import "../structsGenerales/IncapacidadStruct.sol";

contract HospitalizacionVO is RegistroMedico {
    struct HospitalizacionStruct {
        uint256 causaExterna;
        string diagnosticoIngreso;
        uint256 viaDeIngreso;
        uint256 fechaIngreso;
        bool estadoSalida; // TODO quizá deba ser salidaVivo;
        string diagnosticoEgreso; // TODO quizá deba ser diagnostico salida
        uint256 fechaEgreso;
        string complicacion;
        IncapacidadStruct incapacidad;
    }

    HospitalizacionStruct private hospitalizacionStruct;

    function getCausaExterna() public view returns (uint256) {
        return hospitalizacionStruct.causaExterna;
    }

    function getDiagnosticoIngreso() public view returns (string memory) {
        return hospitalizacionStruct.diagnosticoIngreso;
    }

    function getViaDeIngreso() public view returns (uint256) {
        return hospitalizacionStruct.viaDeIngreso;
    }

    function getFechaIngreso() public view returns (uint256) {
        return hospitalizacionStruct.fechaIngreso;
    }

    function getEstadoSalida() public view returns (bool) {
        return hospitalizacionStruct.estadoSalida;
    }

    function getDiagnosticoEgreso() public view returns (string memory) {
        return hospitalizacionStruct.diagnosticoEgreso;
    }

    function getFechaEgreso() public view returns (uint256) {
        return hospitalizacionStruct.fechaEgreso;
    }

    function getComplicacion() public view returns (string memory) {
        return hospitalizacionStruct.complicacion;
    }

    function getIncapacidad() public view returns (IncapacidadStruct memory) {
        return hospitalizacionStruct.incapacidad;
    }

    function getHospitalizacionStruct()
        public
        view
        returns (HospitalizacionStruct memory)
    {
        return hospitalizacionStruct;
    }

    function setAtencionUrgenciasStruct(
        HospitalizacionStruct memory _hospitalizacionStruct
    ) public {
        hospitalizacionStruct = _hospitalizacionStruct;
    }

    function setCausaExterna(uint256 _causaExterna) public {
        hospitalizacionStruct.causaExterna = _causaExterna;
    }

    function setDiagnosticoIngreso(string memory _diagnosticoIngreso) public {
        hospitalizacionStruct.diagnosticoIngreso = _diagnosticoIngreso;
    }

    function setViaDeIngreso(uint256 _viaDeIngreso) public {
        hospitalizacionStruct.viaDeIngreso = _viaDeIngreso;
    }

    function setFechaIngreso(uint256 _fechaIngreso) public {
        hospitalizacionStruct.fechaIngreso = _fechaIngreso;
    }

    function setEstadoSalida(bool _estadoSalida) public {
        hospitalizacionStruct.estadoSalida = _estadoSalida;
    }

    function setDiagnosticoEgreso(string memory _diagnosticoEgreso) public {
        hospitalizacionStruct.diagnosticoEgreso = _diagnosticoEgreso;
    }

    function setFechaEgreso(uint256 _fechaEgreso) public {
        hospitalizacionStruct.fechaEgreso = _fechaEgreso;
    }

    function setComplicacion(string memory _complicacion) public {
        hospitalizacionStruct.complicacion = _complicacion;
    }

    function setIncapacidad(IncapacidadStruct memory _incapacidad) public {
        hospitalizacionStruct.incapacidad = _incapacidad;
    }
}
