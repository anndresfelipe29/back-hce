pragma solidity ^0.8.17;

import "../models/MedicoVO.sol";
import "../persistence/AccesoHistoriaClinicaMapper.sol";

contract AccesoHistoriaClinica {
    address public creador;

    AccesoHistoriaClinicaMapperInterface private accesoHistoriaClinicaMapper;

    // TODO: Actualizar en enterprise
    // Lo hace el paciente
    function responderSolicitudDeAcceso(address direccionMedico, bool acepta)
        external
    {
        PermisoDeAccesoVO[] memory permisos = accesoHistoriaClinicaMapper.getPermisos(
            msg.sender,
            direccionMedico
        );
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
                    permiso.setFechaExpiracion(fechaActual + 3 minutes);
                } else {
                    permiso.setFueRespondido(true);
                    permiso.setFechaSolicitud(fechaActual);
                    permiso.setFechaExpiracion(0);                    
                }
            }
        }
        revert("No existe una solicitud de permiso en proceso");
    }

    // TODO: Actualizar en enterprise architech
    // Lo hace el médico
    function solicitarAccesoHistoriaClinica(address direccionPaciente)
        external
        returns (uint256)
    {
        PermisoDeAccesoVO permiso = new PermisoDeAccesoVO();
        permiso.setFueRespondido(false);
        return
            accesoHistoriaClinicaMapper.setPermiso(
                direccionPaciente,
                msg.sender,
                permiso
            );
    }

    // TODO: Actualizar en enterprise architect
    function esSolicitudVigente(
        address direccionPaciente,
        address direccionMedico
    ) external view returns (bool) {
        return
            accesoHistoriaClinicaMapper.esPermisoVigente(
                direccionPaciente,
                direccionMedico
            );
    }

    function setaccesoHistoriaClinicaMapper(
        AccesoHistoriaClinicaMapper _accesoHistoriaClinicaMapper
    ) public esPropietario {
        accesoHistoriaClinicaMapper = _accesoHistoriaClinicaMapper;
    }

    modifier esPropietario() {
        require(
            msg.sender == creador,
            "Esta funcion solo puede ser ejecutada por el creador del contrato"
        );
        _; // acá se ejecuta la función
    }

    function selfDestruct() public esPropietario {
        selfdestruct(payable(creador));
    }

    /*modifier tieneAcceso(uint256 permisoId) {
        bool esAccesible = acceso.validarPermisoDeRol(msg.sender, permisoId);
        require(esAccesible, "El usuario no tiene acceso");
        _; // acá se ejecuta la función
    }*/
}
