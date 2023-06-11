// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

import "./RegistroMedico.sol";

//import "./structsGenerales/DatosPersonalesStruct.sol";

contract AntecedentePatologicoFamiliarVO is RegistroMedico(TipoRegistroMedico.ANTECEDENTEPATOLOGICOFAMILIARVO) {
    struct AntecedentePatologicoFamiliarStruct {
        RegistroMedicoStruct registroMedico;
        string parentesco;
        string enfermedad; // Quizá deba existir una lista de enfermedades en una nueva tabla
        int256 fechaAproximada;        
    }

    AntecedentePatologicoFamiliarStruct private antecedentePatologicoFamiliarStruct;

    constructor() {
        creador = msg.sender;
        antecedentePatologicoFamiliarStruct.registroMedico = getRegistroMedico();
    }

    function getParentesco() public view returns (string memory) {
        return antecedentePatologicoFamiliarStruct.parentesco;
    }

    function getEnfermedad() public view returns (string memory) {
        return antecedentePatologicoFamiliarStruct.enfermedad;
    }

    function getFechaAproximada() public view returns (int256) {
        return antecedentePatologicoFamiliarStruct.fechaAproximada;
    }

    function getAntecedentePatologicoFamiliarStruct()
        public
        view
        returns (AntecedentePatologicoFamiliarStruct memory)
    {
        return antecedentePatologicoFamiliarStruct;
    }

    function setAntecedentePatologicoFamiliarStruct(
        AntecedentePatologicoFamiliarStruct memory _antecedentePatologicoFamiliarStruct
    ) public {
        _antecedentePatologicoFamiliarStruct.registroMedico = antecedentePatologicoFamiliarStruct.registroMedico;
        antecedentePatologicoFamiliarStruct = _antecedentePatologicoFamiliarStruct;
    }

    function setParentesco(string memory _parentesco) public {
        antecedentePatologicoFamiliarStruct.parentesco = _parentesco;
    }

    function setEnfermedad(string memory _enfermedad) public {
        antecedentePatologicoFamiliarStruct.enfermedad = _enfermedad;
    }

    function setFechaAproximada(int256 _fechaAproximada) public {
        antecedentePatologicoFamiliarStruct.fechaAproximada = _fechaAproximada;
    }
}
