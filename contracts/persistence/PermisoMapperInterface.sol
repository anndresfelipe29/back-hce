// SPDX-License-Identifier: MIT
pragma solidity ^0.8.10;

import "../models/RolVO.sol";

interface RolMapperInterface {
    event Log(string data);

    function consultar(uint256 _id) external returns (RolVO);

    function guardar(uint256 _id, RolVO paciente) external;

    function actualizar(uint256 _id, RolVO paciente) external;

    function selfDestruct() external;
}
