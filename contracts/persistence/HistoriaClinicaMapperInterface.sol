// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

import "../models/historiaClinica/HistoriaClinicaVO.sol";

interface HistoriaClinicaMapperInterface {

    function consultar(address direccion) external returns (HistoriaClinicaVO);

    function guardar(address direccion, HistoriaClinicaVO historiaClinicaVO) external;

    function actualizar(address direccion, HistoriaClinicaVO historiaClinicaVO) external;

    // TODO: Actualizar en diagrama de clases
    function getPropietarioHistoriaClinica(uint256 id)
        external
        returns (address);

    function getHistoriaClinicaId(address direccion) external returns (uint256);
    
    function selfDestruct() external;
}
