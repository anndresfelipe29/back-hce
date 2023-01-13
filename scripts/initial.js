const { open} = require('fs/promises');

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
    // let instance
    let usuarioVO
    let estado
    let acceso
    let paciente
    let pacienteMapper
    let medico
    let medicoMapper
//    let medicoOraculo
    let datosParametricosMapper
    let historiaClinicaMapper
    let rolMapper
    let accesoHistoriaClinica
    let accesoHistoriaClinicaMapper

    const accounts = await web3.eth.getAccounts()
    
    // Carga de mappers 
    rolMapper = await RolMapper.deployed()
    pacienteMapper = await PacienteMapper.deployed()
    medicoMapper = await MedicoMapper.deployed()
    //medicoOraculo = await MedicoOraculo.deployed()
    //direcciones.push({contrato:'medicoOraculo',direccion: medicoOraculo.address})
    datosParametricosMapper = await DatosParametricosMapper.deployed()
    usuarioMapper = await UsuarioMapper.deployed()
    historiaClinicaMapper = await HistoriaClinicaMapper.deployed()
    accesoHistoriaClinicaMapper = await AccesoHistoriaClinicaMapper.deployed()


    /*******************************************Inyección de dependencias************************************/

    // Oraculo
    oracle = await Oracle.deployed()
    direcciones.push({contrato:'oracle',direccion: oracle.address})
    await oracle.setMedicoMapper(medicoMapper.address)
    await oracle.setDatosParametricosMapper(datosParametricosMapper.address)

    // Acceso
    acceso = await Acceso.deployed()
    await acceso.setUsuarioMapper(usuarioMapper.address)

    // accesoHistoriaClinica
    accesoHistoriaClinica = await AccesoHistoriaClinica.deployed()    
    await accesoHistoriaClinica.setAccesoHistoriaClinicaMapper(accesoHistoriaClinicaMapper.address)
    await accesoHistoriaClinica.setMedicoMapper(medicoMapper.address)
    await accesoHistoriaClinica.setAcceso(acceso.address)
    direcciones.push({contrato:'accesoHistoriaClinica',direccion: accesoHistoriaClinica.address})
    console.log("accesoHistoriaClinica: ", accesoHistoriaClinica.address)

    // Historia clínica
    historiaClinica = await HistoriaClinica.deployed()
    await historiaClinica.setDatosParametricosMapper(datosParametricosMapper.address)
    await historiaClinica.setHistoriaClinicaMapper(historiaClinicaMapper.address)
    await historiaClinica.setAcceso(acceso.address)
    await historiaClinica.setAccesoHistoriaClinica(accesoHistoriaClinica.address)

    // Médico
    medico = await Medico.deployed()
    await medico.setRolMapper(rolMapper.address)
    await medico.setUsuarioMapper(usuarioMapper.address)
    await medico.setMedicoMapper(medicoMapper.address)
    await medico.setDatosParametricosMapper(datosParametricosMapper.address)
    // await medico.setMedicoOraculo(medicoOraculo.address)
    await medico.setAcceso(acceso.address)
    await medico.setOracle(oracle.address)

    // Paciente
    paciente = await Paciente.deployed()
    await paciente.setPacienteMapper(pacienteMapper.address)
    await paciente.setRolMapper(rolMapper.address)
    await paciente.setUsuarioMapper(usuarioMapper.address)
    await paciente.setAcceso(acceso.address)
    await paciente.setDatosParametricosMapper(datosParametricosMapper.address)


    /********************************************Carga de datos inicial********************************************/

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






    // Carga de datos parametricos
    let cedulaTipoIdentificacionVO = await TipoIdentificacionVO.new()
    // await cedulaTipoIdentificacionVO.setId(1)
    await cedulaTipoIdentificacionVO.setNombre("Cedula")
    await cedulaTipoIdentificacionVO.setDescripcion("Cedula descripcion")
    await cedulaTipoIdentificacionVO.setEstaActivo(true)

    let tarjetaIdentidadTipoIdentificacionVO = await TipoIdentificacionVO.new()
    // await tarjetaIdentidadTipoIdentificacionVO.setId(2)
    await tarjetaIdentidadTipoIdentificacionVO.setNombre("Tarjeta de identidad")
    await tarjetaIdentidadTipoIdentificacionVO.setDescripcion("Tarjeta de identidad descripcion")
    await tarjetaIdentidadTipoIdentificacionVO.setEstaActivo(true)

    await datosParametricosMapper.guardarTipoIdentificacionVO(cedulaTipoIdentificacionVO.address)
    await datosParametricosMapper.guardarTipoIdentificacionVO(tarjetaIdentidadTipoIdentificacionVO.address)
    let cedulaid = await cedulaTipoIdentificacionVO.getId()
    let tarjetaIdentidadId = await tarjetaIdentidadTipoIdentificacionVO.getId()
    console.log("Cedula: " + cedulaid + "-> " + cedulaTipoIdentificacionVO.address)
    console.log("Tarjeta de identidad id: " + tarjetaIdentidadId + "-> " + tarjetaIdentidadTipoIdentificacionVO.address)

    let estadoVOInactivo = await EstadoVO.new()
    await estadoVOInactivo.setNombre("Inactivo")
    await estadoVOInactivo.setDescripcion("Estado persona inactiva descripcion")
    await estadoVOInactivo.setEstaActivo(true)
    console.log("EstadoVO en inactivo: " + estadoVOInactivo.address)
    
    let estadoVOActivo = await EstadoVO.new()
    await estadoVOActivo.setNombre("Activo")
    await estadoVOActivo.setDescripcion("Estado persona activa descripcion")
    await estadoVOActivo.setEstaActivo(true)
    console.log("EstadoVO activo: " + estadoVOActivo.address)

    let estadoVOValidacion = await EstadoVO.new()
    await estadoVOValidacion.setNombre("En validacion")
    await estadoVOValidacion.setDescripcion("Estado medico en validacion descripcion")
    await estadoVOValidacion.setEstaActivo(true)
    console.log("EstadoVO en validacion: " + estadoVOValidacion.address)



    await datosParametricosMapper.guardarEstadoVO(estadoVOActivo.address)
    await datosParametricosMapper.guardarEstadoVO(estadoVOInactivo.address)
    await datosParametricosMapper.guardarEstadoVO(estadoVOValidacion.address)
    let estadoVOActivoId = await estadoVOActivo.getId();
    let estadoVOInactivoId = await estadoVOInactivo.getId();
    let estadoVOValidacionId = await estadoVOValidacion.getId();
    console.log("Estado activo Id: " + estadoVOActivoId + "-> " + estadoVOActivo.address)
    console.log("Estado inactivo Id: " + estadoVOInactivoId + "-> " + estadoVOInactivo.address)
    console.log("Estado validacion Id: " + estadoVOValidacionId + "-> " + estadoVOValidacionId.address)

    let estadoCivilSoltero = await EstadoCivilVO.new()
    await estadoCivilSoltero.setNombre("Soltero")
    await estadoCivilSoltero.setDescripcion("Estado civil soltero descripcion")

    let estadoCivilCasado = await EstadoCivilVO.new()
    await estadoCivilCasado.setNombre("Casado")
    await estadoCivilCasado.setDescripcion("Estado civil casado descripcion")

    let estadoCivilUnionLibre = await EstadoCivilVO.new()
    await estadoCivilUnionLibre.setNombre("Union libre")
    await estadoCivilUnionLibre.setDescripcion("Estado civil union libre descripcion")
    console.log("union libre: " + estadoCivilUnionLibre.address)

    await datosParametricosMapper.guardarEstadoCivilVO(estadoCivilSoltero.address)
    await datosParametricosMapper.guardarEstadoCivilVO(estadoCivilCasado.address)
    await datosParametricosMapper.guardarEstadoCivilVO(estadoCivilUnionLibre.address)
    let estadoCivilSolteroId = await estadoCivilSoltero.getId();
    let estadoCivilCasadoId = await estadoCivilCasado.getId();
    let estadoCivilUnionLibreId = await estadoCivilUnionLibre.getId();
    console.log("Estado civil soltero Id: " + estadoCivilSolteroId + "-> " + estadoCivilSoltero.address)
    console.log("Estado civil casado Id: " + estadoCivilCasadoId + "-> " + estadoCivilCasado.address)
    console.log("Estado civil union libre Id: " + estadoCivilUnionLibreId + "-> " + estadoCivilUnionLibre.address)

    let aseguradoraVOCompensar = await AseguradoraVO.new()
    await aseguradoraVOCompensar.setNombre("Compensar")
    await aseguradoraVOCompensar.setEstaActivo(true)

    let aseguradoraVOFamisanar = await AseguradoraVO.new()
    await aseguradoraVOFamisanar.setNombre("Famisanar")
    await aseguradoraVOFamisanar.setEstaActivo(true)

    await datosParametricosMapper.guardarAseguradoraVO(aseguradoraVOFamisanar.address)
    await datosParametricosMapper.guardarAseguradoraVO(aseguradoraVOCompensar.address)
    let aseguradoraVOCompensarId = await aseguradoraVOCompensar.getId();
    let aseguradoraVOFamisanarId = await aseguradoraVOFamisanar.getId();
    console.log("Aseguradora compensar Id: " + aseguradoraVOCompensarId + "-> " + aseguradoraVOCompensar.address)
    console.log("Aseguradora Famisanar Id: " + aseguradoraVOFamisanarId + "-> " + aseguradoraVOFamisanar.address)


    let tipoVinculacionVOCotizante = await TipoVinculacionVO.new()
    await tipoVinculacionVOCotizante.setNombre("Compensar")
    await tipoVinculacionVOCotizante.setBeneficios("El edificio es bonito")
    await tipoVinculacionVOCotizante.setEstaActivo(true)

    let tipoVinculacionVOBeneficiario = await TipoVinculacionVO.new()
    await tipoVinculacionVOBeneficiario.setNombre("Famisanar")
    await tipoVinculacionVOBeneficiario.setBeneficios("jajaja beneficio")
    await tipoVinculacionVOBeneficiario.setEstaActivo(true)


    await datosParametricosMapper.guardarTipoVinculacionVO(tipoVinculacionVOCotizante.address)
    await datosParametricosMapper.guardarTipoVinculacionVO(tipoVinculacionVOBeneficiario.address)
    let tipoVinculacionVOCotizanteId = await tipoVinculacionVOCotizante.getId();
    let tipoVinculacionVOBeneficiarioId = await tipoVinculacionVOBeneficiario.getId();
    console.log("Tipo de vinculación Cotizante: " + tipoVinculacionVOCotizanteId + "-> " + tipoVinculacionVOCotizante.address)
    console.log("Tipo de vinculación beneficiario: " + tipoVinculacionVOBeneficiarioId + "-> " + tipoVinculacionVOBeneficiario.address)

    let estadoHCEVOActiva = await EstadoHCEVO.new()
    await estadoHCEVOActiva.setNombre("Activa")
    await estadoHCEVOActiva.setDescripcion("Estado HCE activa descripcion")
    await estadoHCEVOActiva.setEstaActivo(true)

    let estadoHCEVOInactiva = await EstadoHCEVO.new()
    await estadoHCEVOInactiva.setNombre("Inactiva")
    await estadoHCEVOInactiva.setDescripcion("Estado HCE inactiva descripcion")
    await estadoHCEVOInactiva.setEstaActivo(true)

    let estadoHCEVOCerrada = await EstadoHCEVO.new()
    await estadoHCEVOCerrada.setNombre("Cerrada")
    await estadoHCEVOCerrada.setDescripcion("Estado HCE cerrada descripcion")
    await estadoHCEVOCerrada.setEstaActivo(true)


    await datosParametricosMapper.guardarEstadoHCEVO(estadoHCEVOActiva.address)
    await datosParametricosMapper.guardarEstadoHCEVO(estadoHCEVOInactiva.address)
    await datosParametricosMapper.guardarEstadoHCEVO(estadoHCEVOCerrada.address)
    let estadoHCEVOActivaId = await estadoHCEVOActiva.getId();
    let estadoHCEVOInactivaId = await estadoHCEVOInactiva.getId();
    let estadoHCEVOCerradaId = await estadoHCEVOCerrada.getId();
    console.log("Estado HCE activa Id: " + estadoHCEVOActivaId + "-> " + estadoHCEVOActiva.address)
    console.log("Estado HCE inactivo Id: " + estadoHCEVOInactivaId + "-> " + estadoHCEVOInactiva.address)
    console.log("Estado HCE cerrada Id: " + estadoHCEVOCerradaId + "-> " + estadoHCEVOCerrada.address)

    await writeToFile('build/contracts/extras/direcciones.json', direcciones)
    console.log("=============Initial==================")
    console.log("Terminamos la carga de datos y conexión entre contratos")
    callback()
}

async function writeToFile(fileName, data) {
    try {
        console.log("============== Guardando direcciones relevantes =================")
      // await writeFile(fileName, data);
      const file = await open(fileName, 'w');
      console.log(data)
      await file.write(JSON.stringify(data));
      console.log(`Wrote data to ${fileName}`);
    } catch (error) {
      console.error(`Got an error trying to write the file: ${error.message}`);
    }
  }