// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

import "../persistence/AccesoHistoriaClinicaMapper.sol";
import "../persistence/MedicoMapper.sol";
import "../utils/Modifiers.sol";

contract AccesoHistoriaClinica is Modifiers {

    AccesoHistoriaClinicaMapperInterface private accesoHistoriaClinicaMapper;
    MedicoMapperInterface private medicoMapper;
    int256 private tiempoPermisoEnMinutos;

    event Respuesta(string data, address indexed generador, address indexed notificado);
    event Solicitud(string data, address indexed generador, address indexed notificado);

    constructor() {
        creador = msg.sender;
        tiempoPermisoEnMinutos = 30;
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
        int256 fechaActual = int256(block.timestamp);
        for (uint256 i = permisos.length; i > 0; i--) {
            permiso = permisos[i - 1];
            if (!permiso.getFueRespondido()) {  
                permiso.setFueRespondido(true);              
                if (acepta) {
                    permiso.setFueAceptado(true);
                    permiso.setFechaSolicitud(fechaActual);
                    // TODO Descomentar
                    // permiso.setFechaExpiracion(fechaActual + 3 hours);
                    int256 duracionPermiso = tiempoPermisoEnMinutos * 1 minutes;
                    permiso.setFechaExpiracion(fechaActual + duracionPermiso);                    
                } else {
                    permiso.setFueAceptado(false);
                    permiso.setFechaSolicitud(fechaActual);
                    permiso.setFechaExpiracion(0);                    
                }
                emit Respuesta("La solicitud fue respondida", msg.sender, direccionMedico);
                return;
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
        bool esMedicoActivo = esMedicoActivo(msg.sender);
        if(!esMedicoActivo) {
            revert("Medico no valido para solicitar accesos (validelo con el sistema externo)");
        }
        PermisoDeAccesoVO permiso = new PermisoDeAccesoVO();
        permiso.setFueRespondido(false); // TODO: agregar aqui fecha de daolicitud en permiso
        emit Solicitud("Se solicito un acceso", msg.sender, direccionPaciente);
        return
            accesoHistoriaClinicaMapper.setPermiso(
                direccionPaciente,
                msg.sender,
                permiso
            );
    }

    // TODO: agregar a enterprise architect
    function esMedicoActivo(address direccionMedico) public returns (bool) {
        MedicoVO informacionMedico = medicoMapper.consultar(direccionMedico);

        if(informacionMedico.getEstado().getId() == 1) {            
            // TODO: 1 es cuando un usuario esta activo
            return true;
        }
        return false;
    }

    function setTiempoPermisoEnMinutos(int256 _tiempoPermisoEnMinutos) public {
        if(_tiempoPermisoEnMinutos <= 0) {
            revert("El tiempo debe ser mayor a cero");
        }
        tiempoPermisoEnMinutos = _tiempoPermisoEnMinutos;
    }

    function getTiempoPermisoEnMinutos() public view returns (int256){
        return tiempoPermisoEnMinutos;
    }

    // TODO: hacer función que traiga permisos por aprobar

    // TODO: Actualizar en enterprise architect
    function esSolicitudVigente(
        address direccionPaciente,
        address direccionMedico
    ) external returns (bool) {
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

    function setMedicoMapper(MedicoMapperInterface _medicoMapper)
        public esPropietario
    {
        medicoMapper = _medicoMapper;
    }

    function selfDestruct() public esPropietario {
        selfdestruct(payable(creador));
    }

}
