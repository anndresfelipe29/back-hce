const { open } = require('fs/promises');

const HistoriaClinica = artifacts.require('HistoriaClinica')
const AccesoHistoriaClinica = artifacts.require('AccesoHistoriaClinica')
const Acceso = artifacts.require('Acceso')
const DatosParametricosMapper = artifacts.require('DatosParametricosMapper')
const HistoriaClinicaMapper = artifacts.require('HistoriaClinicaMapper')




module.exports = async function (callback) {


    try {
        let accesoHistoriaClinica
        let acceso
        let historiaClinicaMapper
        let historiaClinica
        let datosParametricosMapper

        accesoHistoriaClinica = await AccesoHistoriaClinica.deployed()
        acceso = await Acceso.deployed()
        historiaClinicaMapper = await HistoriaClinicaMapper.deployed()  
        datosParametricosMapper = await DatosParametricosMapper.deployed()
        

        console.log("================HistoriaClinica==================")
        // Historia clínica
        historiaClinica = await HistoriaClinica.deployed()
        await historiaClinica.setDatosParametricosMapper(datosParametricosMapper.address)
        await historiaClinica.setHistoriaClinicaMapper(historiaClinicaMapper.address)
        await historiaClinica.setAcceso(acceso.address)
        await historiaClinica.setAccesoHistoriaClinica(accesoHistoriaClinica.address)

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