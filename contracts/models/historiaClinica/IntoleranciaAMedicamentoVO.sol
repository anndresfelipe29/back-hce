// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

import "./RegistroMedico.sol";


contract IntoleranciaAMedicamentoVO is RegistroMedico (TipoRegistroMedico.INTOLERACIAAMEDICAMENTOVO) {
    struct IntoleranciaAMedicamentoStruct {
        RegistroMedicoStruct registroMedico;
        string descripcionMedicamento; // Quizá deba existir una lista de enfermedades en una nueva tabla
        string comentarios;        
    }

    IntoleranciaAMedicamentoStruct private intoleranciaAMedicamentoStruct;

    constructor() {
        creador = msg.sender;
        intoleranciaAMedicamentoStruct.registroMedico = getRegistroMedico();
    }

    function getDescripcionMedicamento() public view returns (string memory) {
        return intoleranciaAMedicamentoStruct.descripcionMedicamento;
    }

    function getComentarios() public view returns (string memory) {
        return intoleranciaAMedicamentoStruct.comentarios;
    }

    
    function getIntoleranciaAMedicamentoStruct()
        public
        view
        returns (IntoleranciaAMedicamentoStruct memory)
    {
        return intoleranciaAMedicamentoStruct;
    }

    function setIntoleranciaAMedicamentoStruct(
        IntoleranciaAMedicamentoStruct memory _intoleranciaAMedicamentoStruct
    ) public {
        _intoleranciaAMedicamentoStruct.registroMedico = intoleranciaAMedicamentoStruct.registroMedico;
        intoleranciaAMedicamentoStruct = _intoleranciaAMedicamentoStruct;
    }

    function setDescripcionMedicamento(string memory _descripcionMedicamento) public {
        intoleranciaAMedicamentoStruct.descripcionMedicamento = _descripcionMedicamento;
    }

    function setComentarios(string memory _comentarios) public {
        intoleranciaAMedicamentoStruct.comentarios = _comentarios;
    }
}
