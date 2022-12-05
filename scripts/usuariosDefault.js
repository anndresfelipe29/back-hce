const Paciente = artifacts.require('Paciente')
const Medico = artifacts.require('Medico')


module.exports = async function (callback) {
    let paciente
    let medico

    const accounts = await web3.eth.getAccounts()
    console.log(accounts[8])
    // Paciente
    paciente = await Paciente.deployed()

    // Médico
    medico = await Medico.deployed()

    await paciente.registrarConStruct(accounts[8], [[accounts[8], 0, "Andres","paciente", "Gomas", "test", "111111",0, "true"],[0, 0, 0, 25, "Bogota", "ocupacion","direccion","3150 000",0,0,0], 0], { from: accounts[8] })
    await medico.registrarConStruct(accounts[9], [[accounts[9], 0, "Andres","medico", "Gomas", "test", "111111",0, "true"], 1,0], "usuario", "contrasena", { from: accounts[9] })
    

    console.log("Terminamos la carga de datos y conexión entre contratos")
    console.log("usuarios disponibles:")
    console.table(accounts)
    callback()
}
