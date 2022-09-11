// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

import "./RegistroMedico.sol";
import "../structsGenerales/IncapacidadStruct.sol";
import "../structsGenerales/ExploracionPorRegionesStruct.sol";
import "../structsGenerales/ExploracionPorSistemasStruct.sol";

//import "./structsGenerales/DatosPersonalesStruct.sol";

contract ConsultaIndividualVO is RegistroMedico {
    struct ConsultaIndividualStruct {
        uint256 fechaAtencion;
        bool consultaPrioritaria;
        uint256 especialidadId;
        string padecimiento;
        string sintomas;
        uint256 causaExternaId;
        ExploracionPorRegionesStruct exploracionPorRegiones;
        ExploracionPorSistemasStruct exploracionPorSistemas;
        uint256 codigoDiagnostico;
        uint256 conducta;
        uint256 tipoDiagnostico;
        uint256 numeroConsultaDelAno;
        IncapacidadStruct incapacidad;
    }

    ConsultaIndividualStruct private consultaIndividualStruct;

    function getConsultaIndividualStruct()
        public
        view
        returns (ConsultaIndividualStruct memory)
    {
        return consultaIndividualStruct;
    }

    function setConsultaIndividualStruct(
        ConsultaIndividualStruct memory _consultaIndividualStruct
    ) public {
        consultaIndividualStruct = _consultaIndividualStruct;
    }



    function getFechaAtencion() public view returns (uint256) {
        return consultaIndividualStruct.fechaAtencion;
    }

    function getConsultaPrioritaria() public view returns (bool) {
        return consultaIndividualStruct.consultaPrioritaria;
    }

    function getEspecialidadId() public view returns (uint256) {
        return consultaIndividualStruct.especialidadId;
    }

    function getPadecimiento() public view returns (string memory) {
        return consultaIndividualStruct.padecimiento;
    }

    function getSintomas() public view returns (string memory) {
        return consultaIndividualStruct.sintomas;
    }

    function getCausaExternaId() public view returns (uint256) {
        return consultaIndividualStruct.causaExternaId;
    }

    function getExploracionPorRegionesStruct()
        public
        view
        returns (ExploracionPorRegionesStruct memory)
    {
        return consultaIndividualStruct.exploracionPorRegiones;
    }

    function getExploracionPorSistemasStruct()
        public
        view
        returns (ExploracionPorSistemasStruct memory)
    {
        return consultaIndividualStruct.exploracionPorSistemas;
    }

    function getCodigoDiagnostico() public view returns (uint256) {
        return consultaIndividualStruct.codigoDiagnostico;
    }

    function getConducta() public view returns (uint256) {
        return consultaIndividualStruct.conducta;
    }

    function getTipoDiagnostico() public view returns (uint256) {
        return consultaIndividualStruct.tipoDiagnostico;
    }

    function getNumeroConsultaDelAno() public view returns (uint256) {
        return consultaIndividualStruct.numeroConsultaDelAno;
    }

    function getIncapacidad() public view returns (IncapacidadStruct memory) {
        return consultaIndividualStruct.incapacidad;
    }


    function setFechaAtencion(uint256 _fechaAtencion) public {
        consultaIndividualStruct.fechaAtencion = _fechaAtencion;
    }

    function setConsultaPrioritaria(bool _consultaPrioritaria) public {
        consultaIndividualStruct.consultaPrioritaria = _consultaPrioritaria;
    }

    function setEspecialidadId(uint256 _especialidadId) public {
        consultaIndividualStruct.especialidadId = _especialidadId;
    }

    function setPadecimiento(string memory _padecimiento) public {
        consultaIndividualStruct.padecimiento = _padecimiento;
    }

    function setSintomas(string memory _sintomas) public {
        consultaIndividualStruct.sintomas = _sintomas;
    }

    function setCausaExternaId(uint256 _causaExternaId) public {
        consultaIndividualStruct.causaExternaId = _causaExternaId;
    }

    function setExploracionPorRegionesStruct(
        ExploracionPorRegionesStruct memory _exploracionPorRegiones
    ) public {
        consultaIndividualStruct
            .exploracionPorRegiones = _exploracionPorRegiones;
    }

    function setExploracionPorSistemasStruct(
        ExploracionPorSistemasStruct memory _exploracionPorSistemas
    ) public {
        consultaIndividualStruct
            .exploracionPorSistemas = _exploracionPorSistemas;
    }

    function setCodigoDiagnostico(uint256 _codigoDiagnostico) public {
        consultaIndividualStruct.codigoDiagnostico = _codigoDiagnostico;
    }

    function setConducta(uint256 _tipoDiagnostico) public {
        consultaIndividualStruct.tipoDiagnostico = _tipoDiagnostico;
    }

    function setTipoDiagnostico(uint256 _conducta) public {
        consultaIndividualStruct.conducta = _conducta;
    }

    function setNumeroConsultaDelAno(uint256 _numeroConsultaDelAno) public {
        consultaIndividualStruct.numeroConsultaDelAno = _numeroConsultaDelAno;
    }

    function setIncapacidad(IncapacidadStruct memory _incapacidad) public {
        consultaIndividualStruct.incapacidad = _incapacidad;
    }
}
