// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

import "../models/RolVO.sol";

interface PermisoMapperInterface {
    event Log(string data);

    function consultar(uint256 _id) external returns (PermisoVO);

    function guardar(uint256 _id, PermisoVO paciente) external;

    function actualizar(uint256 _id, PermisoVO paciente) external;

    function selfDestruct() external;
}
