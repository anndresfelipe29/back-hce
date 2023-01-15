const { open } = require('fs/promises');


const RolMapper = artifacts.require('RolMapper')

const UsuarioMapper = artifacts.require('UsuarioMapper')

const PacienteMapper = artifacts.require('PacienteMapper')

const MedicoMapper = artifacts.require('MedicoMapper')
// const MedicoOraculo = artifacts.require('MedicoOraculo')

const AccesoHistoriaClinicaMapper = artifacts.require('AccesoHistoriaClinicaMapper')



const DatosParametricosMapper = artifacts.require('DatosParametricosMapper')

const HistoriaClinicaMapper = artifacts.require('HistoriaClinicaMapper')

const Oracle = artifacts.require('Oracle')

module.exports = async function (callback) {
    let direcciones = []
    let pacienteMapper
    let medicoMapper
    let datosParametricosMapper
    let historiaClinicaMapper
    let rolMapper
    let accesoHistoriaClinicaMapper

    try {

        console.log("================Inyeccion de dependencias==================")
        // Carga de mappers 

        medicoMapper = await MedicoMapper.deployed()
        console.log("================4==================")
        datosParametricosMapper = await DatosParametricosMapper.deployed()
        /*******************************************Inyección de dependencias************************************/
        console.log("================Oracle==================")
        // Oraculo
        oracle = await Oracle.deployed()
        direcciones.push({ contrato: 'oracle', direccion: oracle.address })
        await oracle.setMedicoMapper(medicoMapper.address)
        await oracle.setDatosParametricosMapper(datosParametricosMapper.address)
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