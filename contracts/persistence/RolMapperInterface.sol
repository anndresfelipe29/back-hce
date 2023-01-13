// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

import "../models/RolVO.sol";
import "../models/VOGenerales/enums/RolDeAccesoEnum.sol";

interface RolMapperInterface {
    event Log(string data);

    function consultar(RolDeAccesoEnum _id) external returns (RolVO);

    function guardar(RolVO paciente) external returns (uint256);

    function actualizar(RolDeAccesoEnum _id, RolVO paciente) external;

    function selfDestruct() external;
}
