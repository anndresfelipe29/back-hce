// SPDX-License-Identifier: MIT
pragma solidity ^0.8.10;

import "../models/historiaClinica/HistoriaClinicaVO.sol";

interface HistoriaClinicaMapperInterface {
    event Log(string data);

    function consultar(address direccion) external returns (HistoriaClinicaVO);

    function guardar(address direccion, HistoriaClinicaVO historiaClinicaVO) external;

    function actualizar(address direccion, HistoriaClinicaVO historiaClinicaVO) external;

    function selfDestruct() external;
}
