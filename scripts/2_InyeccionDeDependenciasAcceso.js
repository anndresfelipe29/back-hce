const { open } = require('fs/promises');

const Acceso = artifacts.require('Acceso')
const UsuarioMapper = artifacts.require('UsuarioMapper')


module.exports = async function (callback) {


    try {
        let acceso
        let usuarioMapper
        usuarioMapper = await UsuarioMapper.deployed()
        console.log("================Acceso==================")
        // Acceso
        acceso = await Acceso.deployed()
        await acceso.setUsuarioMapper(usuarioMapper.address)
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