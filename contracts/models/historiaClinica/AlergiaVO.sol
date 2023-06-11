// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

import "./RegistroMedico.sol";

//import "./structsGenerales/DatosPersonalesStruct.sol";

contract AlergiaVO is RegistroMedico (TipoRegistroMedico.ALERGIAVO) {
    struct AlergiaStruct {
        RegistroMedicoStruct registroMedico;
        string descripcionSustancia;
    }

    AlergiaStruct private alergiaStruct;

    constructor() {
        creador = msg.sender;
        alergiaStruct.registroMedico = getRegistroMedico();
    }

    function getDescripcionSustancia() public view returns (string memory) {
        return alergiaStruct.descripcionSustancia;
    }

    function getAlergiaStruct() public view returns (AlergiaStruct memory) {
        return alergiaStruct;
    }

    function setAlergiaStruct(AlergiaStruct memory _alergiaStruct) public {
        _alergiaStruct.registroMedico = alergiaStruct.registroMedico;
        alergiaStruct = _alergiaStruct;
    }

    function setDescripcionSustancia(string memory _descripcionSustancia) public{
        alergiaStruct.descripcionSustancia = _descripcionSustancia;
    }
    
}
