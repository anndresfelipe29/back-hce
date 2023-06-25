// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

import "./RegistroMedico.sol";
import "../structsGenerales/IncapacidadStruct.sol";
import "../structsGenerales/ExploracionPorRegionesStruct.sol";
import "../structsGenerales/ExploracionPorSistemasStruct.sol";

//import "./structsGenerales/DatosPersonalesStruct.sol";

contract AnticonceptivoVO is RegistroMedico (TipoRegistroMedico.ANTICONCEPTIVO) {
    struct AnticonceptivoStruct {
        string descripcion;
        string efectividad;
        string nombre;
    }

    AnticonceptivoStruct private anticonceptivoStruct;

    constructor() {
        creador = msg.sender;
    }

    function getAnticonceptivoStruct()
        public
        view
        returns (AnticonceptivoStruct memory)
    {
        return anticonceptivoStruct;
    }

    function setAnticonceptivoStruct(
        AnticonceptivoStruct memory _anticonceptivoStruct
    ) public {
        anticonceptivoStruct = _anticonceptivoStruct;
    }

    function getDescripcion() public view returns (string memory) {
        return anticonceptivoStruct.descripcion;
    }

    function getEfectividad() public view returns (string memory) {
        return anticonceptivoStruct.efectividad;
    }

    function getNombre() public view returns (string memory) {
        return anticonceptivoStruct.nombre;
    }

    function setDescripcion(string memory _descripcion) public {
        anticonceptivoStruct.descripcion = _descripcion;
    }

    function setEfectividad(string memory _efectividad) public {
        anticonceptivoStruct.efectividad = _efectividad;
    }

    function setNombre(string memory _nombre) public {
        anticonceptivoStruct.nombre = _nombre;
    }
}