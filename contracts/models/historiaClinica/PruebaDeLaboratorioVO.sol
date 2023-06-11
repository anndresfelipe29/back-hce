// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

import "./RegistroMedico.sol";
import "../structsGenerales/ProcedimientosStruct.sol";

contract PruebaDeLaboratorioVO is RegistroMedico (TipoRegistroMedico.PRUEBADELABORATORIOVO) {
    struct PruebaDeLaboratorioStruct {
        RegistroMedicoStruct registroMedico;
        uint256 ambitoProcedimiento;
        int256 fecha;
        ClaseProcedimientoStruct procedimiento;
        string anexo;
    }

    PruebaDeLaboratorioStruct private pruebaDeLaboratorioStruct;

    constructor() {
        creador = msg.sender;
        pruebaDeLaboratorioStruct.registroMedico = getRegistroMedico();
    }

    function getAmbitoProcedimiento() public view returns (uint256) {
        return pruebaDeLaboratorioStruct.ambitoProcedimiento;
    }

    function getFecha() public view returns (int256) {
        return pruebaDeLaboratorioStruct.fecha;
    }

    function getProcedimiento()
        public
        view
        returns (ClaseProcedimientoStruct memory)
    {
        return pruebaDeLaboratorioStruct.procedimiento;
    }

    function getAnexo() public view returns (string memory) {
        return pruebaDeLaboratorioStruct.anexo;
    }

    function getPruebaDeLaboratorioStruct()
        public
        view
        returns (PruebaDeLaboratorioStruct memory)
    {
        return pruebaDeLaboratorioStruct;
    }

    function setPruebaDeLaboratorioStruct(
        PruebaDeLaboratorioStruct memory _pruebaDeLaboratorioStruct
    ) public {
        _pruebaDeLaboratorioStruct.registroMedico = pruebaDeLaboratorioStruct.registroMedico;
        pruebaDeLaboratorioStruct = _pruebaDeLaboratorioStruct;
    }

    function setAmbitoProcedimiento(uint256 _ambitoProcedimiento) public {
        pruebaDeLaboratorioStruct.ambitoProcedimiento = _ambitoProcedimiento;
    }

    function setFecha(int256 _fecha) public {
        pruebaDeLaboratorioStruct.fecha = _fecha;
    }

    function setProcedimiento(ClaseProcedimientoStruct memory _procedimiento)
        public
    {
        pruebaDeLaboratorioStruct.procedimiento = _procedimiento;
    }

    function setAnexo(string memory _anexo) public {
        pruebaDeLaboratorioStruct.anexo = _anexo;
    }
}
