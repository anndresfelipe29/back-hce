pragma solidity ^0.8.17;

import "../persistence/AccesoHistoriaClinicaMapper.sol";
import "../utils/Modifiers.sol";

contract AccesoHistoriaClinica is Modifiers {

    AccesoHistoriaClinicaMapperInterface private accesoHistoriaClinicaMapper;

    constructor() {
        creador = msg.sender;
    }

    // TODO: Actualizar en enterprise
    // Lo hace el paciente
    function responderSolicitudDeAcceso(address direccionMedico, bool acepta)
        external
        tieneAcceso(19)
    {
        PermisoDeAccesoVO[] memory permisos = accesoHistoriaClinicaMapper
            .getPermisos(msg.sender, direccionMedico);
        PermisoDeAccesoVO permiso;
        uint256 fechaActual = block.timestamp;
        for (uint256 i = permisos.length; i > 0; i--) {
            permiso = permisos[i - 1];
            if (!permiso.getFueRespondido()) {
                if (acepta) {
                    permiso.setFueRespondido(true);
                    permiso.setFechaSolicitud(fechaActual);
                    // TODO Descomentar
                    // permiso.setFechaExpiracion(fechaActual + 3 hours);
                    permiso.setFechaExpiracion(fechaActual + 30 minutes);
                    return;
                } else {
                    permiso.setFueRespondido(true);
                    permiso.setFechaSolicitud(fechaActual);
                    permiso.setFechaExpiracion(0);
                    return;
                }
            }
        }
        revert("No existe una solicitud de permiso en proceso");
    }

    // TODO: Actualizar en enterprise architech
    // Lo hace el médico
    function solicitarAccesoHistoriaClinica(address direccionPaciente)
        external
        tieneAcceso(20)
        returns (uint256)
    {
        PermisoDeAccesoVO permiso = new PermisoDeAccesoVO();
        permiso.setFueRespondido(false); // TODO: agregar aqui fecha de daolicitud en permiso
        return
            accesoHistoriaClinicaMapper.setPermiso(
                direccionPaciente,
                msg.sender,
                permiso
            );
    }

    // TODO: hacer función que traiga permisos por aprobar

    // TODO: Actualizar en enterprise architect
    function esSolicitudVigente(
        address direccionPaciente,
        address direccionMedico
    ) external tieneAcceso(21) returns (bool) {
        return
            accesoHistoriaClinicaMapper.esPermisoVigente(
                direccionPaciente,
                direccionMedico
            );
    }

    function getPermisosDeAccesoActivosPorHistoriaClinica(
        address direccionPaciente
    ) public tieneAcceso(22) returns(PermisoDeAccesoVO[] memory) {
        return accesoHistoriaClinicaMapper.getPermisosDeAccesoActivosPorHistoriaClinica(direccionPaciente);
    }

    function getPermisosDeAccesoPorHistoriaClinica(
        address direccionPaciente
    ) public tieneAcceso(23) returns(PermisoDeAccesoVO[] memory) {
        return accesoHistoriaClinicaMapper.getPermisosDeAccesoPorHistoriaClinica(direccionPaciente);
    }

    function getPermisosDeAccesoActivosPorMedico(
        address direccionMedico
    ) public tieneAcceso(24) returns(PermisoDeAccesoVO[] memory) {        
        return accesoHistoriaClinicaMapper.getPermisosDeAccesoActivosPorMedico(direccionMedico);
    }

    function getPermisosDeAccesoPorMedico(
        address direccionMedico
    ) public tieneAcceso(25) returns(PermisoDeAccesoVO[] memory) {
        return accesoHistoriaClinicaMapper.getPermisosDeAccesoPorMedico(direccionMedico);
    }

    function setAccesoHistoriaClinicaMapper(
        AccesoHistoriaClinicaMapper _accesoHistoriaClinicaMapper
    ) public esPropietario {
        accesoHistoriaClinicaMapper = _accesoHistoriaClinicaMapper;
    }

    function selfDestruct() public esPropietario {
        selfdestruct(payable(creador));
    }

}
