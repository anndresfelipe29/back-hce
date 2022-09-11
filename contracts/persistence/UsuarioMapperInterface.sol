// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

import "../models/UsuarioVO.sol";

interface UsuarioMapperInterface {
    event Log(string data);

    function consultar(address direccion) external returns (UsuarioVO);

    function guardar(address direccion, UsuarioVO paciente) external;

    function actualizar(address direccion, UsuarioVO paciente) external;

    function selfDestruct() external;
}
