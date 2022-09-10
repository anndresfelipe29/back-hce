// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

import "../models/RolVO.sol";

interface RolMapperInterface {
    event Log(string data);

    function consultar(uint256 _id) external returns (RolVO);

    function guardar(RolVO paciente) external returns (uint256);

    function actualizar(uint256 _id, RolVO paciente) external;

    function selfDestruct() external;
}
