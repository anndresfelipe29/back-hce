// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

import "./RegistroMedico.sol";
import "../structsGenerales/IncapacidadStruct.sol";
import "../structsGenerales/ExploracionPorRegionesStruct.sol";
import "../structsGenerales/ExploracionPorSistemasStruct.sol";

//import "./structsGenerales/DatosPersonalesStruct.sol";

contract GinecobstetriciaVO is RegistroMedico (TipoRegistroMedico.GINECOBSTETRICIA) {
    struct GinecobstetriciaStruct {
        RegistroMedicoStruct registroMedico;
        uint256 cantidadAbortos;
        uint256 cantidadPartos;
        bool cesareas;
        bool climaterio;
        string desarrolloSexual;
        int256 fechaProbableParto;
        string flujoPlasmaticoRenal;
        int256 menarca;
        bool menopausia;
        string ritmoMenstrual;
        string vidaSexual;
    }

    GinecobstetriciaStruct private ginecobstetriciaStruct;

    constructor() {
        creador = msg.sender;
        ginecobstetriciaStruct.registroMedico = getRegistroMedico();
    }

    function getGinecobstetriciaStruct()
        public
        view
        returns (GinecobstetriciaStruct memory)
    {
        return ginecobstetriciaStruct;
    }

    function setGinecobstetriciaStruct(
        GinecobstetriciaStruct memory _ginecobstetriciaStruct
    ) public {
        _ginecobstetriciaStruct.registroMedico = ginecobstetriciaStruct.registroMedico;
        ginecobstetriciaStruct = _ginecobstetriciaStruct;
    }

    function getCantidadAbortos() public view returns (uint256) {
        return ginecobstetriciaStruct.cantidadAbortos;
    }

    function getCesareas() public view returns (bool) {
        return ginecobstetriciaStruct.cesareas;
    }

    function getClimaterio() public view returns (bool) {
        return ginecobstetriciaStruct.climaterio;
    }

    function getDesarrolloSexual() public view returns (string memory) {
        return ginecobstetriciaStruct.desarrolloSexual;
    }

    function getFechaProbableParto() public view returns (int256) {
        return ginecobstetriciaStruct.fechaProbableParto;
    }

    function getFlujoPlasmaticoRenal() public view returns (string memory) {
        return ginecobstetriciaStruct.flujoPlasmaticoRenal;
    }

    function getMenarca() public view returns (int256) {
        return ginecobstetriciaStruct.menarca;
    }

    function getMenopausia() public view returns (bool) {
        return ginecobstetriciaStruct.menopausia;
    }

    function getRitmoMenstrual() public view returns (string memory) {
        return ginecobstetriciaStruct.ritmoMenstrual;
    }

    function getVidaSexual() public view returns (string memory) {
        return ginecobstetriciaStruct.vidaSexual;
    }

    function setCantidadAbortos(uint256 _cantidadAbortos) public {
        ginecobstetriciaStruct.cantidadAbortos = _cantidadAbortos;
    }

    function setCantidadPartos(uint256 _cantidadPartos) public {
        ginecobstetriciaStruct.cantidadPartos = _cantidadPartos;
    }

    function setCesareas(bool _cesareas) public {
        ginecobstetriciaStruct.cesareas = _cesareas;
    }

    function setClimaterio(bool _climaterio) public {
        ginecobstetriciaStruct.climaterio = _climaterio;
    }

    function setDesarrolloSexual(string memory _desarrolloSexual) public {
        ginecobstetriciaStruct.desarrolloSexual = _desarrolloSexual;
    }

    function setFechaProbableParto(string memory _flujoPlasmaticoRenal) public {
        ginecobstetriciaStruct.flujoPlasmaticoRenal = _flujoPlasmaticoRenal;
    }

    function setMenarca(int256 _menarca) public {
        ginecobstetriciaStruct.menarca = _menarca;
    }

    function setMenopausia(bool _menopausia) public {
        ginecobstetriciaStruct.menopausia = _menopausia;
    }

    function setRitmoMenstrual(string memory _ritmoMenstrual) public {
        ginecobstetriciaStruct.ritmoMenstrual = _ritmoMenstrual;
    }

    function setVidaSexual(string memory _vidaSexual) public {
        ginecobstetriciaStruct.vidaSexual = _vidaSexual;
    }
}