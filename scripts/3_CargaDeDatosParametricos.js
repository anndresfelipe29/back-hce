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
        console.log("================Carga de datos parametricos==================")
       
       
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

        callback()

    } catch (error) {
        console.log("================= Error migration================")
        console.error(error)
        console.log("================= Fin Error migration================")
    }
}