// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

import "../models/accesoHistoriaClinica/PermisoDeAccesoVO.sol";

interface AccesoHistoriaClinicaMapperInterface {
    event Log(string data);

    // TODO: Actualizar clase en enterprise architect

    function getPermisosDeAccesoPorHistoriaClinica(address direccion)
        external
        returns (PermisoDeAccesoVO[] memory);

    function getPermisosDeAccesoPorMedico(address direccion)
        external
        returns (PermisoDeAccesoVO[] memory);

    
    function esPermisoVigente(
        address direccionPaciente,
        address direccionMedico
    ) external returns (bool);

    function getPermisos(address direccionPaciente, address direccionMedico)
        external
        returns (PermisoDeAccesoVO[] memory);

    function setPermiso(
        address direccionPaciente,
        address direccionMedico,
        PermisoDeAccesoVO permiso
    ) external returns (uint256);


    function selfDestruct() external;
}
