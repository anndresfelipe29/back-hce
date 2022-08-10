// SPDX-License-Identifier: MIT
pragma solidity ^0.8.10;

import "./RegistroMedico.sol";

contract HabitosPersonalesVO is RegistroMedico {
    struct HabitosPersonalesStruct {
        string toxicomanias;
        uint256 lavadoDientes;
        string defecacion;
        string habitacion;
        string alcoholismo;
        string tabaquismo;
        string bano;
        string alimentacion;
        string deportes;
        string escolaridad;
        string pasatiempos;
        string trabajo;
    }

    HabitosPersonalesStruct private habitosPersonalesStruct;

    function getToxicomanias() public view returns (string memory) {
        return habitosPersonalesStruct.toxicomanias;
    }

    function getLavadoDientes() public view returns (uint256) {
        return habitosPersonalesStruct.lavadoDientes;
    }

    function getDefecacion() public view returns (string memory) {
        return habitosPersonalesStruct.defecacion;
    }

    function getHabitacion() public view returns (string memory) {
        return habitosPersonalesStruct.habitacion;
    }

    function getAlcoholismo() public view returns (string memory) {
        return habitosPersonalesStruct.alcoholismo;
    }

    function getTabaquismo() public view returns (string memory) {
        return habitosPersonalesStruct.tabaquismo;
    }

    function getBano() public view returns (string memory) {
        return habitosPersonalesStruct.bano;
    }

    function getAlimentacion() public view returns (string memory) {
        return habitosPersonalesStruct.alimentacion;
    }

    function getDeportes() public view returns (string memory) {
        return habitosPersonalesStruct.deportes;
    }

    function getEscolaridad() public view returns (string memory) {
        return habitosPersonalesStruct.escolaridad;
    }

    function getPasatiempos() public view returns (string memory) {
        return habitosPersonalesStruct.pasatiempos;
    }

    function getTrabajo() public view returns (string memory) {
        return habitosPersonalesStruct.trabajo;
    }

    function getHabitosPersonalesStruct()
        public
        view
        returns (HabitosPersonalesStruct memory)
    {
        return habitosPersonalesStruct;
    }

    function setHabitosPersonalesStruct(
        HabitosPersonalesStruct memory _habitosPersonalesStruct
    ) public {
        habitosPersonalesStruct = _habitosPersonalesStruct;
    }

    function setToxicomanias(string memory _toxicomanias) public {
        habitosPersonalesStruct.toxicomanias = _toxicomanias;
    }

    function setLavadoDientes(uint256 _lavadoDientes) public {
        habitosPersonalesStruct.lavadoDientes = _lavadoDientes;
    }

    function setDefecacion(string memory _defecacion) public {
        habitosPersonalesStruct.defecacion = _defecacion;
    }

    function setHabitacion(string memory _habitacion) public {
        habitosPersonalesStruct.habitacion = _habitacion;
    }

    function setAlcoholismo(string memory _alcoholismo) public {
        habitosPersonalesStruct.alcoholismo = _alcoholismo;
    }

    function setTabaquismo(string memory _tabaquismo) public {
        habitosPersonalesStruct.tabaquismo = _tabaquismo;
    }

    function setbano(string memory _bano) public {
        habitosPersonalesStruct.bano = _bano;
    }

    function setAlimentacion(string memory _alimentacion) public {
        habitosPersonalesStruct.alimentacion = _alimentacion;
    }

    function setDeportes(string memory _deportes) public {
        habitosPersonalesStruct.deportes = _deportes;
    }

    function setEscolaridad(string memory _escolaridad) public {
        habitosPersonalesStruct.escolaridad = _escolaridad;
    }

    function setPasatiempos(string memory _pasatiempos) public {
        habitosPersonalesStruct.pasatiempos = _pasatiempos;
    }

    function settrabajo(string memory _trabajo) public {
        habitosPersonalesStruct.trabajo = _trabajo;
    }
}
