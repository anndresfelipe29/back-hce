const { open } = require('fs/promises');


const Oracle = artifacts.require('Oracle')
const AccesoHistoriaClinica = artifacts.require('AccesoHistoriaClinica')
const HistoriaClinica = artifacts.require('HistoriaClinica')

module.exports = async function (callback) {


    try {
        let direcciones = []

        let oracle
        let accesoHistoriaClinica
        let historiaClinica

        oracle = await Oracle.deployed()
        accesoHistoriaClinica = await AccesoHistoriaClinica.deployed()
        historiaClinica = await HistoriaClinica.deployed()
                
        direcciones.push({ contrato: 'oracle', direccion: oracle.address })
        direcciones.push({ contrato: 'accesoHistoriaClinica', direccion: accesoHistoriaClinica.address })
        direcciones.push({ contrato: 'historiaClinica', direccion: historiaClinica.address })
        

        console.log("oracle: ", oracle.address)
        console.log("accesoHistoriaClinica: ", accesoHistoriaClinica.address)
        console.log("historiaClinica: ", historiaClinica.address)


        await writeToFile('build/contracts/extras/direcciones.json', direcciones)
       
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