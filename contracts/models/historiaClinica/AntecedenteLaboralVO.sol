// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

import "./RegistroMedico.sol";

//import "./structsGenerales/DatosPersonalesStruct.sol";

contract AntecedenteLaboralVO is RegistroMedico {
    struct AntecedenteLaboralStruct {
        string descripcionLabor;
        string actividadRealizada;
        uint256 fechaInicio;
        uint256 fechaRetiro;
    }

    AntecedenteLaboralStruct private antecedenteLaboralStruct;

    function getDescripcionLabor() public view returns (string memory) {
        return antecedenteLaboralStruct.descripcionLabor;
    }

    function getActividadRealizada() public view returns (string memory) {
        return antecedenteLaboralStruct.actividadRealizada;
    }

    function getFechaInicio() public view returns (uint256) {
        return antecedenteLaboralStruct.fechaInicio;
    }

    function getFechaRetiro() public view returns (uint256) {
        return antecedenteLaboralStruct.fechaRetiro;
    }

    function getAntecedenteLaboralStruct()
        public
        view
        returns (AntecedenteLaboralStruct memory)
    {
        return antecedenteLaboralStruct;
    }

    function setAntecedenteLaboralStruct(
        AntecedenteLaboralStruct memory _antecedenteLaboralStruct
    ) public {
        antecedenteLaboralStruct = _antecedenteLaboralStruct;
    }

    function setDescripcionLabor(string memory _descripcionLabor) public {
        antecedenteLaboralStruct.descripcionLabor = _descripcionLabor;
    }

    function setActividadRealizada(string memory _actividadRealizada) public {
        antecedenteLaboralStruct.actividadRealizada = _actividadRealizada;
    }

    function setFechaInicio(uint256 _fechaInicio) public {
        antecedenteLaboralStruct.fechaInicio = _fechaInicio;
    }

    function setFechaRetiro(uint256 _fechaRetiro) public {
        antecedenteLaboralStruct.fechaRetiro = _fechaRetiro;
    }
}
