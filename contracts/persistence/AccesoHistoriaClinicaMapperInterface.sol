// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

import "../models/accesoHistoriaClinica/PermisoDeAccesoVO.sol";

interface AccesoHistoriaClinicaMapperInterface {
    event Log(string data);

    // TODO: Actualizar clase en enterprise architect

    function getPermisosDeAccesoActivosPorHistoriaClinica(address direccion)
        external
        view
        returns (PermisoDeAccesoVO[] memory response);

    function getPermisosDeAccesoPorHistoriaClinica(address direccion)
        external
        view
        returns (PermisoDeAccesoVO[] memory);

    function getPermisosDeAccesoActivoPorMedico(address direccion)
        external
        view
        returns (PermisoDeAccesoVO[] memory response);

    function getPermisosDeAccesoPorMedico(address direccion)
        external
        view
        returns (PermisoDeAccesoVO[] memory);

    function esPermisoVigente(
        address direccionPaciente,
        address direccionMedico
    ) external view returns (bool);

    function getPermisos(address direccionPaciente, address direccionMedico)
        external
        view
        returns (PermisoDeAccesoVO[] memory);

    function setPermiso(
        address direccionPaciente,
        address direccionMedico,
        PermisoDeAccesoVO permiso
    ) external returns (uint256);

    function selfDestruct() external;
}
