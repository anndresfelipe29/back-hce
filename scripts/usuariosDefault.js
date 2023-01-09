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

    await paciente.registrarConStruct(accounts[8], [[accounts[8], 0, "Andres","paciente", "Gomas", "test", "111111",0, "true"],[0, 0, 0, 25, "Bogota", "ocupacion","direccion","3150 000",0,0,0], 0], { from: accounts[8] })
    await medico.registrarConStruct(accounts[9], [[accounts[9], 0, "Andres","medico", "Gomas", "test", "111111",0, "true"], 1,0], "usuario", "contrasena", { from: accounts[9] })
    await  oraculo.setOraculo(accounts[7], 1)

    console.log("==================Usuarios default====================")
    console.log("Terminamos la carga de datos y conexión entre contratos")
    console.log("usuarios disponibles:")
    console.table(accounts)
    callback()
}
