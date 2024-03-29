// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

import "./RegistroMedico.sol";
import "../structsGenerales/SexoStruct.sol";

contract PartoVO is RegistroMedico (TipoRegistroMedico.PARTOVO) {
    struct PartoStruct {
        uint256 periodoGestacion;
        bool controlPrenatal;
        string causaMuerteMadre;
        int256 fechaMuerteMadre;
        ActaNacimientoStruct actaNacimiento;
        string tipoParto;
    }

    struct ActaNacimientoStruct {
        int256 fechaNacimiento;
        SexoStruct sexo;
        uint256 peso;
        uint256 talla;
        string diagnosticoRecienNacido;
        ApgarStruct apgar5Min;
        string causaMuerte;
        int256 fechaMuerte;
        uint256 codPrestadorServicioDeSalud;
        int256 fechaRegistro;
    }

    struct ApgarStruct {
        uint256 frecuenciaCardiaca;
        uint256 respiracion;
        uint256 tonoMuscular;
        uint256 reflejo;
        uint256 color;
    }

    PartoStruct private partoStruct;

    constructor() {
        creador = msg.sender;
    }

    function getPeriodoGestacion() public view returns (uint256) {
        return partoStruct.periodoGestacion;
    }

    function getControlPrenatal() public view returns (bool) {
        return partoStruct.controlPrenatal;
    }

    function getCausaMuerteMadre() public view returns (string memory) {
        return partoStruct.causaMuerteMadre;
    }

    function getFechaMuerteMadre() public view returns (int256) {
        return partoStruct.fechaMuerteMadre;
    }

    function getActaNacimiento()
        public
        view
        returns (ActaNacimientoStruct memory)
    {
        return partoStruct.actaNacimiento;
    }

    function getTipoParto() public view returns (string memory) {
        return partoStruct.tipoParto;
    }

    function getPartoStruct() public view returns (PartoStruct memory) {
        return partoStruct;
    }

    function setPartoStruct(PartoStruct memory _partoStruct) public {
        partoStruct = _partoStruct;
    }

    function setPeriodoGestacion(uint256 _periodoGestacion) public {
        partoStruct.periodoGestacion = _periodoGestacion;
    }

    function setControlPrenatal(bool _controlPrenatal) public {
        partoStruct.controlPrenatal = _controlPrenatal;
    }

    function setCausaMuerteMadre(string memory _causaMuerteMadre) public {
        partoStruct.causaMuerteMadre = _causaMuerteMadre;
    }

    function setFechaMuerteMadre(int256 _fechaMuerteMadre) public {
        partoStruct.fechaMuerteMadre = _fechaMuerteMadre;
    }

    function setActaNacimiento(ActaNacimientoStruct memory _actaNacimiento)
        public
    {
        partoStruct.actaNacimiento = _actaNacimiento;
    }

    function setTipoParto(string memory _tipoParto) public {
        partoStruct.tipoParto = _tipoParto;
    }
}
