const { open } = require('fs/promises');

const PermisoMapper = artifacts.require('PermisoMapper')
const PermisoVO = artifacts.require("PermisoVO")

const RolMapper = artifacts.require('RolMapper')
const RolVO = artifacts.require('RolVO')

const UsuarioMapper = artifacts.require('UsuarioMapper')
const UsuarioVO = artifacts.require('UsuarioVO')

const PacienteMapper = artifacts.require('PacienteMapper')
const Paciente = artifacts.require('Paciente')
const PacienteVO = artifacts.require('PacienteVO')

const Medico = artifacts.require('Medico')
const MedicoMapper = artifacts.require('MedicoMapper')
// const MedicoOraculo = artifacts.require('MedicoOraculo')

const Acceso = artifacts.require('Acceso')

const AccesoHistoriaClinica = artifacts.require('AccesoHistoriaClinica')
const AccesoHistoriaClinicaMapper = artifacts.require('AccesoHistoriaClinicaMapper')

const EstadoVO = artifacts.require('EstadoVO')
const EstadoCivilVO = artifacts.require('EstadoCivilVO')
const AseguradoraVO = artifacts.require('AseguradoraVO')
const TipoVinculacionVO = artifacts.require('TipoVinculacionVO')
const EstadoHCEVO = artifacts.require('EstadoHCEVO')
const TipoIdentificacionVO = artifacts.require('TipoIdentificacionVO')

const DatosParametricosMapper = artifacts.require('DatosParametricosMapper')
const HistoriaClinica = artifacts.require('HistoriaClinica')
const HistoriaClinicaMapper = artifacts.require('HistoriaClinicaMapper')

const Oracle = artifacts.require('Oracle')

module.exports = async function (callback) {
    let direcciones = []
    let usuarioVO
    let estado
    let acceso
    let paciente
    let pacienteMapper
    let medico
    let medicoMapper
    let datosParametricosMapper
    let historiaClinicaMapper
    let rolMapper
    let accesoHistoriaClinica
    let accesoHistoriaClinicaMapper

    try {

        console.log("================1==================")
        // Carga de mappers 
        rolMapper = await RolMapper.deployed()
        console.log("================2==================")
        pacienteMapper = await PacienteMapper.deployed()
        console.log("================3==================")
        medicoMapper = await MedicoMapper.deployed()
        console.log("================4==================")
        //medicoOraculo = await MedicoOraculo.deployed()
        //direcciones.push({contrato:'medicoOraculo',direccion: medicoOraculo.address})
        datosParametricosMapper = await DatosParametricosMapper.deployed()
        console.log("================5==================")
        usuarioMapper = await UsuarioMapper.deployed()
        console.log("================6==================")
        historiaClinicaMapper = await HistoriaClinicaMapper.deployed()
        console.log("================7==================")
        accesoHistoriaClinicaMapper = await AccesoHistoriaClinicaMapper.deployed()

        /********************************************Carga de datos inicial********************************************/
        console.log("================Carga de datos ==================")
        // Permisos
        /******Paciente*******/
        paciente_consultar = await PermisoVO.new()
        await paciente_consultar.setId(1)
        await paciente_consultar.setNombre("Consultar Paciente")
        await paciente_consultar.setDescripcion("Paciente.consultar: Permiso para consultar información de pacientes como medico, desde la clase paciente.")

        paciente_consultar2 = await PermisoVO.new()
        await paciente_consultar2.setId(2)
        await paciente_consultar2.setNombre("Consultar Paciente")
        await paciente_consultar2.setDescripcion("Paciente.consultar: Permiso para que el paciente consulte su información.")

        paciente_consultarPorId = await PermisoVO.new()
        await paciente_consultarPorId.setId(3)
        await paciente_consultarPorId.setNombre("Consultar por Id")
        await paciente_consultarPorId.setDescripcion("Paciente.consultarPorId: Permiso para que el medico busque a un usuario por id")

        paciente_registrar = await PermisoVO.new()
        await paciente_registrar.setId(4)
        await paciente_registrar.setNombre("Registrar")
        await paciente_registrar.setDescripcion("Paciente.registrar: Permiso para que un usuario nuevo se registre en la dapp")

        paciente_cambiarEstado = await PermisoVO.new()
        await paciente_consultarPorId.setId(5)
        await paciente_consultarPorId.setNombre("Cambiar estado")
        await paciente_consultarPorId.setDescripcion("Paciente.cambiarEstado: Permiso para que el medico o administrador cambie el estado de un paciente en el sistema")

        /*****Médico*******/
        medico_consultar = await PermisoVO.new()
        await medico_consultar.setId(7)
        await medico_consultar.setNombre("Consultar")
        await medico_consultar.setDescripcion("Medico.consultar: Permiso para que un usuario registrado valide la información del medico")

        medico_registrar = await PermisoVO.new()
        await medico_registrar.setId(8)
        await medico_registrar.setNombre("Registrar medico")
        await medico_registrar.setDescripcion("Medico.registrar: Permiso para que un usuario nuevo se registre como medico")

        medico_actualizar = await PermisoVO.new()
        await medico_actualizar.setId(9)
        await medico_actualizar.setNombre("Actualizar")
        await medico_actualizar.setDescripcion("Medico.actualizar: Permiso para que el medico actualice su información personal")

        medico_verificarExistencia = await PermisoVO.new()
        await medico_verificarExistencia.setId(10)
        await medico_verificarExistencia.setNombre("Verificar Existencia En Sistema Externo")
        await medico_verificarExistencia.setDescripcion("Medico.verificarExistenciaEnSistemaExterno: Permiso para verificar la existencia del medico en el sistema externo que valida que es un medico activo.")

        medico_buscarPerfilMedicoSistemaExterno = await PermisoVO.new()
        await medico_buscarPerfilMedicoSistemaExterno.setId(11)
        await medico_buscarPerfilMedicoSistemaExterno.setNombre("Buscar Perfil Medico Sistema Externo")
        await medico_buscarPerfilMedicoSistemaExterno.setDescripcion("Medico.buscarPerfilMedicoSistemaExterno: Permiso para buscar al medico en plataforma que lo valida como medico activo.")

        /*****Historia Clínica*******/
        historiaClinica_getHistoriaClinica = await PermisoVO.new()
        await historiaClinica_getHistoriaClinica.setId(12)
        await historiaClinica_getHistoriaClinica.setNombre("getHistoriaClinica")
        await historiaClinica_getHistoriaClinica.setDescripcion("HistoriaClinica.getHistoriaClinica: Permiso para que un usuario registrado consulte una historia clinica")

        historiaClinica_inicializarHCE = await PermisoVO.new()
        await historiaClinica_inicializarHCE.setId(13)
        await historiaClinica_inicializarHCE.setNombre("inicializarHCE")
        await historiaClinica_inicializarHCE.setDescripcion("HistoriaClinica.inicializarHCE: Permiso para que un medico registrado active (o inicialice) una historia clinica")

        historiaClinica_agregarRegistro = await PermisoVO.new()
        await historiaClinica_agregarRegistro.setId(14)
        await historiaClinica_agregarRegistro.setNombre("agregarRegistro")
        await historiaClinica_agregarRegistro.setDescripcion("HistoriaClinica.agregarRegistro: Permiso para que un medico agregue registros en una historia clinica")

        historiaClinica_consultarRegistro = await PermisoVO.new()
        await historiaClinica_consultarRegistro.setId(15)
        await historiaClinica_consultarRegistro.setNombre("consultarRegistro")
        await historiaClinica_consultarRegistro.setDescripcion("HistoriaClinica.consultarRegistro: Permiso para que un usuario registrado consulte a detalle un registro puntual de una historia clinica")

        historiaClinica_eliminarRegistro = await PermisoVO.new()
        await historiaClinica_eliminarRegistro.setId(16)
        await historiaClinica_eliminarRegistro.setNombre("eliminarRegistro")
        await historiaClinica_eliminarRegistro.setDescripcion("HistoriaClinica.eliminarRegistro: Permiso para que un medico registrado elimine un registro puntual de una historia clinica")

        historiaClinica_registrosFiltradosPorFecha = await PermisoVO.new()
        await historiaClinica_registrosFiltradosPorFecha.setId(17)
        await historiaClinica_registrosFiltradosPorFecha.setNombre("registrosFiltradosPorFecha")
        await historiaClinica_registrosFiltradosPorFecha.setDescripcion("HistoriaClinica.registrosFiltradosPorFecha: Permiso para que un usuario registrado consulte registros filtrados cronologicamente de una historia clinica")

        historiaClinica_registrosFiltradosPorTipo = await PermisoVO.new()
        await historiaClinica_registrosFiltradosPorTipo.setId(18)
        await historiaClinica_registrosFiltradosPorTipo.setNombre("registrosFiltradosPorTipo")
        await historiaClinica_registrosFiltradosPorTipo.setDescripcion("HistoriaClinica.registrosFiltradosPorTipo: Permiso para que un usuario registrado consulte registros filtradso por tipo de una historia clinica")

        /*****Acceso Historia Clinica*******/
        accesoHistoriaClinica_responderSolicitudDeAcceso = await PermisoVO.new()
        await accesoHistoriaClinica_responderSolicitudDeAcceso.setId(19)
        await accesoHistoriaClinica_responderSolicitudDeAcceso.setNombre("responderSolicitudDeAcceso")
        await accesoHistoriaClinica_responderSolicitudDeAcceso.setDescripcion("AccesoHistoriaClinica.responderSolicitudDeAcceso: Permiso para que un paciente responda las solicitudes que de acceso que le hacen los medicos y personal medico en general")

        accesoHistoriaClinica_solicitarAccesoHistoriaClinica = await PermisoVO.new()
        await accesoHistoriaClinica_solicitarAccesoHistoriaClinica.setId(20)
        await accesoHistoriaClinica_solicitarAccesoHistoriaClinica.setNombre("solicitarAccesoHistoriaClinica")
        await accesoHistoriaClinica_solicitarAccesoHistoriaClinica.setDescripcion("AccesoHistoriaClinica.solicitarAccesoHistoriaClinica: Permiso para que un medico solicite acceso a las historias clinicas de los pacientes")

        accesoHistoriaClinica_esSolicitudVigente = await PermisoVO.new()
        await accesoHistoriaClinica_esSolicitudVigente.setId(21)
        await accesoHistoriaClinica_esSolicitudVigente.setNombre("esSolicitudVigente")
        await accesoHistoriaClinica_esSolicitudVigente.setDescripcion("AccesoHistoriaClinica.esSolicitudVigente: Permiso para que un usuario registrado y el sistema verifique si una solicitud de acceso sigue activa")

        accesoHistoriaClinica_getPermisosDeAccesoActivosPorHistoriaClinica = await PermisoVO.new()
        await accesoHistoriaClinica_getPermisosDeAccesoActivosPorHistoriaClinica.setId(22)
        await accesoHistoriaClinica_getPermisosDeAccesoActivosPorHistoriaClinica.setNombre("getPermisosDeAccesoActivosPorHistoriaClinica")
        await accesoHistoriaClinica_getPermisosDeAccesoActivosPorHistoriaClinica.setDescripcion("AccesoHistoriaClinica.getPermisosDeAccesoActivosPorHistoriaClinica: Permiso para que un paciente consulte quien tiene acceso activo a su historia clinica")

        accesoHistoriaClinica_getPermisosDeAccesoPorHistoriaClinica = await PermisoVO.new()
        await accesoHistoriaClinica_getPermisosDeAccesoPorHistoriaClinica.setId(23)
        await accesoHistoriaClinica_getPermisosDeAccesoPorHistoriaClinica.setNombre("getPermisosDeAccesoPorHistoriaClinica")
        await accesoHistoriaClinica_getPermisosDeAccesoPorHistoriaClinica.setDescripcion("AccesoHistoriaClinica.getPermisosDeAccesoPorHistoriaClinica: Permiso para que un paciente consulte quien tiene acceso a su historia clinica")

        accesoHistoriaClinica_getPermisosDeAccesoActivosPorMedico = await PermisoVO.new()
        await accesoHistoriaClinica_getPermisosDeAccesoActivosPorMedico.setId(24)
        await accesoHistoriaClinica_getPermisosDeAccesoActivosPorMedico.setNombre("getPermisosDeAccesoActivosPorMedico")
        await accesoHistoriaClinica_getPermisosDeAccesoActivosPorMedico.setDescripcion("AccesoHistoriaClinica.getPermisosDeAccesoActivosPorMedico: Permiso para que un medico consulte a que historias clínicas tiene acceso activo")

        accesoHistoriaClinica_getPermisosDeAccesoPorMedico = await PermisoVO.new()
        await accesoHistoriaClinica_getPermisosDeAccesoPorMedico.setId(25)
        await accesoHistoriaClinica_getPermisosDeAccesoPorMedico.setNombre("getPermisosDeAccesoPorMedico")
        await accesoHistoriaClinica_getPermisosDeAccesoPorMedico.setDescripcion("AccesoHistoriaClinica.getPermisosDeAccesoPorMedico: Permiso para que un medico consulte a que historias clínicas ha tenido acceso")


        // Roles
        rolPaciente = await RolVO.new()
        // await rolPaciente.setId(1)
        await rolPaciente.setNombre("Paciente")
        await rolPaciente.setDescripcion("Para usuario paciente")
        await rolPaciente.setPermisos(
            [
                [1, paciente_consultar.address, false],
                [2, paciente_consultar2.address, true],
                [3, paciente_consultarPorId.address, false],
                [4, paciente_registrar.address, false],
                [5, paciente_cambiarEstado.address, true],
                //[6, cambiar________.address, true],
                [7, medico_consultar.address, true],
                [8, medico_registrar.address, false],
                [9, medico_actualizar.address, false],
                [10, medico_verificarExistencia.address, true],
                [11, medico_buscarPerfilMedicoSistemaExterno.address, true],

                [12, historiaClinica_getHistoriaClinica.address, true],
                [13, historiaClinica_inicializarHCE.address, false],
                [14, historiaClinica_agregarRegistro.address, false],
                [15, historiaClinica_consultarRegistro.address, true],
                [16, historiaClinica_eliminarRegistro.address, false],
                [17, historiaClinica_registrosFiltradosPorFecha.address, true],
                [18, historiaClinica_registrosFiltradosPorTipo.address, true],

                [19, accesoHistoriaClinica_responderSolicitudDeAcceso.address, true],
                [20, accesoHistoriaClinica_solicitarAccesoHistoriaClinica.address, false],
                [21, accesoHistoriaClinica_esSolicitudVigente.address, true],
                [22, accesoHistoriaClinica_getPermisosDeAccesoActivosPorHistoriaClinica.address, true],
                [23, accesoHistoriaClinica_getPermisosDeAccesoPorHistoriaClinica.address, true],
                [24, accesoHistoriaClinica_getPermisosDeAccesoActivosPorMedico.address, false],
                [25, accesoHistoriaClinica_getPermisosDeAccesoPorMedico.address, false]
            ]
        )

        rolMedico = await RolVO.new()
        // await rolMedico.setId(2)
        await rolMedico.setNombre("Medico")
        await rolMedico.setDescripcion("Para usuario medico")
        await rolMedico.setPermisos(
            [
                [1, paciente_consultar.address, true],
                [2, paciente_consultar2.address, false],
                [3, paciente_consultarPorId.address, true],
                [4, paciente_registrar.address, false],
                [5, paciente_cambiarEstado.address, true],
                //[6, cambiar________.address, true],
                [7, medico_consultar.address, true],
                [8, medico_registrar.address, false],
                [9, medico_actualizar.address, true],
                [10, medico_verificarExistencia.address, true],
                [11, medico_buscarPerfilMedicoSistemaExterno.address, true],
                [12, historiaClinica_getHistoriaClinica.address, true],
                [13, historiaClinica_inicializarHCE.address, true],
                [14, historiaClinica_agregarRegistro.address, true],
                [15, historiaClinica_consultarRegistro.address, true],
                [16, historiaClinica_eliminarRegistro.address, false],
                [17, historiaClinica_registrosFiltradosPorFecha.address, true],
                [18, historiaClinica_registrosFiltradosPorTipo.address, true],
                [19, accesoHistoriaClinica_responderSolicitudDeAcceso.address, false],
                [20, accesoHistoriaClinica_solicitarAccesoHistoriaClinica.address, true],
                [21, accesoHistoriaClinica_esSolicitudVigente.address, true],
                [22, accesoHistoriaClinica_getPermisosDeAccesoActivosPorHistoriaClinica.address, false],
                [23, accesoHistoriaClinica_getPermisosDeAccesoPorHistoriaClinica.address, false],
                [24, accesoHistoriaClinica_getPermisosDeAccesoActivosPorMedico.address, true],
                [25, accesoHistoriaClinica_getPermisosDeAccesoPorMedico.address, true]
            ]
        )

        // Registro en rol mapper
        await rolMapper.guardar(rolPaciente.address)
        await rolMapper.guardar(rolMedico.address)
        let rolPacienteId = await rolPaciente.getId()
        let rolMedicoId = await rolMedico.getId()
        console.log("rol paciente id: " + rolPacienteId)
        console.log("rol médico id: " + rolMedicoId)
        callback()

    } catch (error) {
        console.log("================= Error migration================")
        console.error(error)
        console.log("================= Fin Error migration================")
    }
}