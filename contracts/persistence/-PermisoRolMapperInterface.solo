// SPDX-License-Identifier: MIT
pragma solidity ^0.8.10;

import "../models/RolVO.sol";

interface PermisoRolMapperInterface {
    event Log(string data);

    function consultar(uint256 _permiso, uint256 _rol) external returns (bool);

    function guardar(uint256 _permiso, uint256 _rol, bool valor) external;

    function actualizar(uint256 _permiso, uint256 _rol, bool valor) external;

    function selfDestruct() external;
}
