// SPDX-License-Identifier: MIT
pragma solidity ^0.8.10;

import "../models/MedicoVO.sol";

interface MedicoMapperInterface {
    event Log(string data);

    function consultar(address direccion) external returns (MedicoVO);

    function guardar(address direccion, MedicoVO medico) external;

    function actualizar(address direccion, MedicoVO medico) external;

    function selfDestruct() external;
}
