// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

import "./RegistroMedico.sol";

//import "./structsGenerales/DatosPersonalesStruct.sol";

contract AntecedentePatologicoPersonalVO is RegistroMedico(TipoRegistroMedico.ANTECEDENTEPATOLOGICOPERSONALVO) {
    struct AntecedentePatologicoPersonalStruct {
        string enfermedad; // Quizá deba existir una lista de enfermedades en una nueva tabla
        uint256 fechaAproximada;
    }

    AntecedentePatologicoPersonalStruct
        private antecedentePatologicoPersonalStruct;

    function getEnfermedad() public view returns (string memory) {
        return antecedentePatologicoPersonalStruct.enfermedad;
    }

    function getFechaAproximada() public view returns (uint256) {
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
            memory _antecedentePatologicoFamiliarStruct
    ) public {
        antecedentePatologicoPersonalStruct = _antecedentePatologicoFamiliarStruct;
    }

    function setEnfermedad(string memory _enfermedad) public {
        antecedentePatologicoPersonalStruct.enfermedad = _enfermedad;
    }

    function setFechaAproximada(uint256 _fechaAproximada) public {
        antecedentePatologicoPersonalStruct.fechaAproximada = _fechaAproximada;
    }
}
