const { open } = require('fs/promises');

const AccesoHistoriaClinica = artifacts.require('AccesoHistoriaClinica')
const Acceso = artifacts.require('Acceso')
const AccesoHistoriaClinicaMapper = artifacts.require('AccesoHistoriaClinicaMapper')
const MedicoMapper = artifacts.require('MedicoMapper')



module.exports = async function (callback) {


    try {
        let accesoHistoriaClinica
        let acceso
        let accesoHistoriaClinicaMapper
        let medicoMapper

        acceso = await Acceso.deployed()
        accesoHistoriaClinicaMapper = await AccesoHistoriaClinicaMapper.deployed()
        medicoMapper = await MedicoMapper.deployed()

        console.log("================AccesoHistoriaClinica==================")
        // accesoHistoriaClinica
        accesoHistoriaClinica = await AccesoHistoriaClinica.deployed()
        await accesoHistoriaClinica.setAccesoHistoriaClinicaMapper(accesoHistoriaClinicaMapper.address)
        await accesoHistoriaClinica.setMedicoMapper(medicoMapper.address)
        await accesoHistoriaClinica.setAcceso(acceso.address)
        direcciones.push({ contrato: 'accesoHistoriaClinica', direccion: accesoHistoriaClinica.address })
        console.log("accesoHistoriaClinica: ", accesoHistoriaClinica.address)

        callback()

    } catch (error) {
        console.log("================= Error migration================")
        console.error(error)
        console.log("================= Fin Error migration================")
        callback()
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