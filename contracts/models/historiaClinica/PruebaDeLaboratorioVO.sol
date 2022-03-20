// SPDX-License-Identifier: MIT
pragma solidity ^0.8.10;

import "../../logica/RegistroMedico.sol";
import "../structsGenerales/ProcedimientosStruct.sol";

contract PruebaDeLaboratorioVO is RegistroMedico {
    struct PruebaDeLaboratorioStruct {
        uint256 ambitoProcedimiento;
        uint256 fecha;
        ClaseProcedimientoStruct procedimiento;
        string anexo;
    }

    PruebaDeLaboratorioStruct private pruebaDeLaboratorioStruct;

    function getAmbitoProcedimiento() public view returns (uint256) {
        return pruebaDeLaboratorioStruct.ambitoProcedimiento;
    }

    function getFecha() public view returns (uint256) {
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
        pruebaDeLaboratorioStruct = _pruebaDeLaboratorioStruct;
    }

    function setAmbitoProcedimiento(uint256 _ambitoProcedimiento) public {
        pruebaDeLaboratorioStruct.ambitoProcedimiento = _ambitoProcedimiento;
    }

    function setFecha(uint256 _fecha) public {
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
