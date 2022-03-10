// SPDX-License-Identifier: MIT
pragma solidity ^0.8.10;

import "../models/RolVO.sol";

interface RolMapperInterface {
    event Log(string data);

    function consultar(address direccion) external returns (RolVO);

    function guardar(address direccion, RolVO paciente) external;

    function actualizar(address direccion, RolVO paciente) external;

    function selfDestruct() external;
}
