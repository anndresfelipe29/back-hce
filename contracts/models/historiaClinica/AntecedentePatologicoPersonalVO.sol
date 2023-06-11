// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

import "./RegistroMedico.sol";

//import "./structsGenerales/DatosPersonalesStruct.sol";

contract AntecedentePatologicoPersonalVO is RegistroMedico(TipoRegistroMedico.ANTECEDENTEPATOLOGICOPERSONALVO) {
    struct AntecedentePatologicoPersonalStruct {
        RegistroMedicoStruct registroMedico;
        string enfermedad; // Quizá deba existir una lista de enfermedades en una nueva tabla
        int256 fechaAproximada;
    }

    AntecedentePatologicoPersonalStruct
        private antecedentePatologicoPersonalStruct;

    constructor() {
        creador = msg.sender;
        antecedentePatologicoPersonalStruct.registroMedico = getRegistroMedico();
    }

    function getEnfermedad() public view returns (string memory) {
        return antecedentePatologicoPersonalStruct.enfermedad;
    }

    function getFechaAproximada() public view returns (int256) {
        return antecedentePatologicoPersonalStruct.fechaAproximada;
    }

    function getAntecedentePatologicoPersonalStruct()
        public
        view
        returns (AntecedentePatologicoPersonalStruct memory)
    {
        return antecedentePatologicoPersonalStruct;
    }

    function setAntecedentePatologicoPersonalStruct(
        AntecedentePatologicoPersonalStruct
            memory _antecedentePatologicoPersonalStruct
    ) public {
        _antecedentePatologicoPersonalStruct.registroMedico = antecedentePatologicoPersonalStruct.registroMedico;
        antecedentePatologicoPersonalStruct = _antecedentePatologicoPersonalStruct;
    }

    function setEnfermedad(string memory _enfermedad) public {
        antecedentePatologicoPersonalStruct.enfermedad = _enfermedad;
    }

    function setFechaAproximada(int256 _fechaAproximada) public {
        antecedentePatologicoPersonalStruct.fechaAproximada = _fechaAproximada;
    }
}
