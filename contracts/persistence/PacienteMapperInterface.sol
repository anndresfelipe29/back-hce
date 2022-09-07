// SPDX-License-Identifier: MIT
pragma solidity ^0.8.10;

import "../models/PacienteVO.sol";

interface PacienteMapperInterface {
    event Log(string data);

    function consultar(address direccion) external returns (PacienteVO);

    function consultarPorId(uint256 id) external returns (PacienteVO);

    function guardar(address direccion, PacienteVO paciente) external;

    function actualizar(address direccion, PacienteVO paciente) external;

    function selfDestruct() external;
}
