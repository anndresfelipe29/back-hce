const { open } = require('fs/promises');

const Medico = artifacts.require('Medico')
const RolMapper = artifacts.require('RolMapper')
const UsuarioMapper = artifacts.require('UsuarioMapper')
const MedicoMapper = artifacts.require('MedicoMapper')
const Acceso = artifacts.require('Acceso')
const DatosParametricosMapper = artifacts.require('DatosParametricosMapper')
const Oracle = artifacts.require('Oracle')



module.exports = async function (callback) {


    try {
        let medico
        let rolMapper
        let usuarioMapper
        let medicoMapper
        let acceso
        let datosParametricosMapper
        let oracle


        rolMapper = await RolMapper.deployed()
        usuarioMapper = await UsuarioMapper.deployed()
        medicoMapper = await MedicoMapper.deployed()
        acceso = await Acceso.deployed()        
        datosParametricosMapper = await DatosParametricosMapper.deployed()
        oracle = await Oracle.deployed()

        console.log("================Medico==================")
        // Médico
        medico = await Medico.deployed()
        await medico.setRolMapper(rolMapper.address)
        await medico.setUsuarioMapper(usuarioMapper.address)
        await medico.setMedicoMapper(medicoMapper.address)
        await medico.setDatosParametricosMapper(datosParametricosMapper.address)
        await medico.setAcceso(acceso.address)
        await medico.setOracle(oracle.address)
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