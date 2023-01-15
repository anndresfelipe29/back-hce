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

        console.log("================Inyeccion de dependencias==================")
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

        /*******************************************Inyección de dependencias************************************/
        console.log("================Oracle==================")
        // Oraculo
        oracle = await Oracle.deployed()
        direcciones.push({ contrato: 'oracle', direccion: oracle.address })
        await oracle.setMedicoMapper(medicoMapper.address)
        await oracle.setDatosParametricosMapper(datosParametricosMapper.address)

        console.log("================Acceso==================")
        // Acceso
        acceso = await Acceso.deployed()
        await acceso.setUsuarioMapper(usuarioMapper.address)

        console.log("================AccesoHistoriaClinica==================")
        // accesoHistoriaClinica
        accesoHistoriaClinica = await AccesoHistoriaClinica.deployed()
        await accesoHistoriaClinica.setAccesoHistoriaClinicaMapper(accesoHistoriaClinicaMapper.address)
        await accesoHistoriaClinica.setMedicoMapper(medicoMapper.address)
        await accesoHistoriaClinica.setAcceso(acceso.address)
        direcciones.push({ contrato: 'accesoHistoriaClinica', direccion: accesoHistoriaClinica.address })
        console.log("accesoHistoriaClinica: ", accesoHistoriaClinica.address)

        console.log("================HistoriaClinica==================")
        // Historia clínica
        historiaClinica = await HistoriaClinica.deployed()
        await historiaClinica.setDatosParametricosMapper(datosParametricosMapper.address)
        await historiaClinica.setHistoriaClinicaMapper(historiaClinicaMapper.address)
        await historiaClinica.setAcceso(acceso.address)
        await historiaClinica.setAccesoHistoriaClinica(accesoHistoriaClinica.address)

        console.log("================Medico==================")
        // Médico
        medico = await Medico.deployed()
        await medico.setRolMapper(rolMapper.address)
        await medico.setUsuarioMapper(usuarioMapper.address)
        await medico.setMedicoMapper(medicoMapper.address)
        await medico.setDatosParametricosMapper(datosParametricosMapper.address)
        // await medico.setMedicoOraculo(medicoOraculo.address)
        await medico.setAcceso(acceso.address)
        await medico.setOracle(oracle.address)

        console.log("================Paciente==================")
        // Paciente
        paciente = await Paciente.deployed()
        await paciente.setPacienteMapper(pacienteMapper.address)
        await paciente.setRolMapper(rolMapper.address)
        await paciente.setUsuarioMapper(usuarioMapper.address)
        await paciente.setAcceso(acceso.address)
        await paciente.setDatosParametricosMapper(datosParametricosMapper.address)

        await writeToFile('build/contracts/extras/direcciones.json', direcciones)
        console.log("=============Initial==================")
        console.log("Terminamos la carga de datos y conexión entre contratos")
        callback()

    } catch (error) {
        console.log("================= Error migration================")
        console.error(error)
        console.log("================= Fin Error migration================")
    }
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