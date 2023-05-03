// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

import "./RegistroMedico.sol";

//import "./structsGenerales/DatosPersonalesStruct.sol";

contract AntecedenteLaboralVO is RegistroMedico (TipoRegistroMedico.ANTECEDENTELABORALVO){
    struct AntecedenteLaboralStruct {
        string descripcionLabor;
        string actividadRealizada;
        int256 fechaInicio;
        int256 fechaRetiro;
    }

    AntecedenteLaboralStruct private antecedenteLaboralStruct;

    function getDescripcionLabor() public view returns (string memory) {
        return antecedenteLaboralStruct.descripcionLabor;
    }

    function getActividadRealizada() public view returns (string memory) {
        return antecedenteLaboralStruct.actividadRealizada;
    }

    function getFechaInicio() public view returns (int256) {
        return antecedenteLaboralStruct.fechaInicio;
    }

    function getFechaRetiro() public view returns (int256) {
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

    function setFechaInicio(int256 _fechaInicio) public {
        antecedenteLaboralStruct.fechaInicio = _fechaInicio;
    }

    function setFechaRetiro(int256 _fechaRetiro) public {
        antecedenteLaboralStruct.fechaRetiro = _fechaRetiro;
    }
}
