require('dotenv').config();
const Paciente = artifacts.require('Paciente')
const Medico = artifacts.require('Medico')
const Oraculo = artifacts.require('Oracle')


module.exports = async function (callback) {
    console.log("==================Usuarios default (I)====================")
    let paciente
    let medico
    let oraculo

    const accounts = await web3.eth.getAccounts()
    console.log(accounts[8])
    // Paciente
    paciente = await Paciente.deployed()

    // Médico
    medico = await Medico.deployed()

    // Oraculo
    oraculo = await Oraculo.deployed()
    try {
        // NOTE: Cambiar dirección por dirección que usara el nodo.
        await  oraculo.setOraculo(process.env.ACCOUNT, 1)
    } catch (error) {
        console.error(" se rompio", error)
    }


    console.log("==================Usuarios default====================")
    console.log("Terminamos la carga de datos y conexión entre contratos")
    console.log("usuarios disponibles:")
    console.table(accounts)
    callback()
}
