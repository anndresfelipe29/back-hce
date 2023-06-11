// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

import "./RegistroMedico.sol";
import "../structsGenerales/ProcedimientosStruct.sol";

contract ProcedimientoQuirurgicoVO is RegistroMedico (TipoRegistroMedico.PROCEDIMIENTOQUIRURGICOVO) {
    struct ProcedimientoQuirurgicoStruct {
        RegistroMedicoStruct registroMedico;
        uint ambitoProcedimiento;
        string complicacion;
        ClaseProcedimientoStruct procedimiento;
        string formaRealizacionProcedimientoQuirurgico;
        string diagnosticoPrincipal;
        string diagnosticoRelacionado;        
        int256 fechaProcedimiento;
        TipoProcedimientoStruct finalidadProcedimiento;
    }

    ProcedimientoQuirurgicoStruct private procedimientoQuirurgicoStruct;

    constructor() {
        creador = msg.sender;
        procedimientoQuirurgicoStruct.registroMedico = getRegistroMedico();
    }

    function getAmbitoProcedimiento() public view returns (uint256) {
        return procedimientoQuirurgicoStruct.ambitoProcedimiento;
    }

    function getComplicacion() public view returns (string memory) {
        return procedimientoQuirurgicoStruct.complicacion;
    }

    function getProcedimiento() public view returns (ClaseProcedimientoStruct memory) {
        return procedimientoQuirurgicoStruct.procedimiento;
    }

    function getFormaRealizacionProcedimientoQuirurgico() public view returns (string memory) {
        return procedimientoQuirurgicoStruct.formaRealizacionProcedimientoQuirurgico;
    }

    function getDiagnosticoPrincipal() public view returns (string memory) {
        return procedimientoQuirurgicoStruct.diagnosticoPrincipal;
    }

    function getDiagnosticoRelacionado() public view returns (string memory) {
        return procedimientoQuirurgicoStruct.diagnosticoRelacionado;
    }

    function getFechaProcedimiento() public view returns (int256) {
        return procedimientoQuirurgicoStruct.fechaProcedimiento;
    }

    function getFinalidadProcedimiento() public view returns (TipoProcedimientoStruct memory) {
        return procedimientoQuirurgicoStruct.finalidadProcedimiento;
    }

    function getProcedimientoQuirurgicoStruct()
        public
        view
        returns (ProcedimientoQuirurgicoStruct memory)
    {
        return procedimientoQuirurgicoStruct;
    }

    function setProcedimientoQuirurgicoStruct(
        ProcedimientoQuirurgicoStruct memory _procedimientoQuirurgicoStruct
    ) public {
        _procedimientoQuirurgicoStruct.registroMedico = procedimientoQuirurgicoStruct.registroMedico;
        procedimientoQuirurgicoStruct = _procedimientoQuirurgicoStruct;
    }

    function setAmbitoProcedimiento(uint256 _ambitoProcedimiento) public {
        procedimientoQuirurgicoStruct.ambitoProcedimiento = _ambitoProcedimiento;
    }

    function setComplicacion(string memory _complicacion) public {
        procedimientoQuirurgicoStruct.complicacion = _complicacion;
    }

    function setProcedimiento(ClaseProcedimientoStruct memory _procedimiento) public {
        procedimientoQuirurgicoStruct.procedimiento = _procedimiento;
    }    

    function setFormaRealizacionProcedimientoQuirurgico(string memory _formaRealizacionProcedimientoQuirurgico) public {
        procedimientoQuirurgicoStruct.formaRealizacionProcedimientoQuirurgico = _formaRealizacionProcedimientoQuirurgico;
    }

    function setDiagnosticoPrincipal(string memory _diagnosticoPrincipal) public {
        procedimientoQuirurgicoStruct.diagnosticoPrincipal = _diagnosticoPrincipal;
    }

    function setDiagnosticoRelacionado(string memory _diagnosticoRelacionado) public {
        procedimientoQuirurgicoStruct.diagnosticoRelacionado = _diagnosticoRelacionado;
    }

    function setFechaProcedimiento(int256 _fechaProcedimiento) public {
        procedimientoQuirurgicoStruct.fechaProcedimiento = _fechaProcedimiento;
    }
}
