
const MedicoMapper = artifacts.require('MedicoMapper')

const DatosParametricosMapper = artifacts.require('DatosParametricosMapper')

const Oracle = artifacts.require('Oracle')

module.exports = async function (callback) {
    let medicoMapper
    let datosParametricosMapper

    try {

        console.log("================Inyeccion de dependencias==================")

        medicoMapper = await MedicoMapper.deployed()
        datosParametricosMapper = await DatosParametricosMapper.deployed()
        oracle = await Oracle.deployed()

        /*******************************************Inyección de dependencias************************************/
        console.log("================Oracle==================")
        // Oraculo
        
        await oracle.setMedicoMapper(medicoMapper.address)
        await oracle.setDatosParametricosMapper(datosParametricosMapper.address)
        callback()

    } catch (error) {
        console.log("================= Error migration================")
        console.error(error)
        console.log("================= Fin Error migration================")
        callback()
    }
}

