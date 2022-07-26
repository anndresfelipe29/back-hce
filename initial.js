const PermisoMapper = artifacts.require('PermisoMapper')
const PermisoVO = artifacts.require("PermisoVO")
const RolMapper = artifacts.require('RolMapper')
const RolVO = artifacts.require('RolVO')
const UsuarioMapper = artifacts.require('UsuarioMapper')
const UsuarioVO = artifacts.require('UsuarioVO')
const Acceso = artifacts.require('Acceso')

const EstadoVO = artifacts.require('EstadoVO')
const EstadoCivilVO = artifacts.require('EstadoCivilVO')
const AseguradoraVO = artifacts.require('AseguradoraVO')
const TipoVinculacionVO = artifacts.require('TipoVinculacionVO')
const EstadoHCEVO = artifacts.require('EstadoHCEVO')
const PacienteVO = artifacts.require('PacienteVO')
const PacienteMapper = artifacts.require('PacienteMapper')
const Paciente = artifacts.require('Paciente')
const TipoIdentificacionVO = artifacts.require('TipoIdentificacionVO')
const DatosParametricosMapper = artifacts.require('DatosParametricosMapper')


module.exports = async function (callback) {

    let instance
    let usuarioVO
    let estado
    let acceso
    let paciente
    let medico
    let pacienteMapper
    let datosParametricosMapper
    let rolMapper




    const accounts = await web3.eth.getAccounts()

    //usuarioMapper = await UsuarioMapper.new()    
    rolMapper = await RolMapper.deployed()
    pacienteMapper = await PacienteMapper.deployed()
    datosParametricosMapper = await DatosParametricosMapper.deployed()
    usuarioMapper = await UsuarioMapper.deployed()
    acceso = await Acceso.deployed()

    await acceso.setUsuarioMapper(usuarioMapper.address)
    // Paciente
    paciente = await Paciente.deployed()
    await paciente.setPacienteMapper(pacienteMapper.address)
    await paciente.setRolMapper(rolMapper.address)
    await paciente.setUsuarioMapper(usuarioMapper.address)
    await paciente.setAcceso(acceso.address)
    await paciente.setdatosParametricosMapper(datosParametricosMapper.address)

    // Permisos
    permisoX = await PermisoVO.new()
    await permisoX.setId(1)
    await permisoX.setNombre("acceso a x cosa")
    await permisoX.setDescripcion("descripcion de x cosa")

    permisoY = await PermisoVO.new()
    await permisoY.setId(2)
    await permisoY.setNombre("acceso a Y cosa")
    await permisoY.setDescripcion("descripcion de Y cosa")

    permisoZ = await PermisoVO.new()
    await permisoZ.setId(3)
    await permisoZ.setNombre("acceso a Z cosa")
    await permisoZ.setDescripcion("descripcion de Z cosa")

    // Roles
    rolPaciente = await RolVO.new()
    // await rolPaciente.setId(1)
    await rolPaciente.setNombre("Paciente")
    await rolPaciente.setDescripcion("Para usuario paciente")
    await rolPaciente.setPermisos(
        [
            [1, permisoX.address, true],
            [2, permisoY.address, true],
            [3, permisoZ.address, false]
        ]
    )

    rolMedico = await RolVO.new()
    // await rolMedico.setId(2)
    await rolMedico.setNombre("Medico")
    await rolMedico.setDescripcion("Para usuario medico")
    await rolMedico.setPermisos(
        [
            [1, permisoX.address, false],
            [2, permisoY.address, true],
            [3, permisoZ.address, true]
        ]
    )

    // Registro en rol mapper
    await rolMapper.guardar(rolPaciente.address)
    await rolMapper.guardar(rolMedico.address)
    let rolPacienteId = await rolPaciente.getId()
    let rolMedicoId = await rolMedico.getId()
    console.log("rol paciente id: " + rolPacienteId)
    console.log("rol médico id: " + rolMedicoId)

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

    let estadoVOActivo = await EstadoVO.new()
    await estadoVOActivo.setNombre("Activo")
    await estadoVOActivo.setDescripcion("Estado persona activa descripcion")
    await estadoVOActivo.setEstaActivo(true)
    console.log("EstadoVO activo: " + estadoVOActivo.address)

    let estadoVOInactivo = await EstadoVO.new()
    await estadoVOInactivo.setNombre("Inactivo")
    await estadoVOInactivo.setDescripcion("Estado persona inactiva descripcion")
    await estadoVOInactivo.setEstaActivo(true)

    await datosParametricosMapper.guardarEstadoVO(estadoVOActivo.address)
    await datosParametricosMapper.guardarEstadoVO(estadoVOInactivo.address)
    let estadoVOActivoId = await estadoVOActivo.getId();
    let estadoVOInactivoId = await estadoVOInactivo.getId();
    console.log("Estado activo Id: " + estadoVOActivoId + "-> " + estadoVOActivo.address)
    console.log("Estado inactivo Id: " + estadoVOInactivoId + "-> " + estadoVOInactivo.address)

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


    console.log("Terminamos la carga de datos y conexión entre contratos")
    callback()
}
