const Paciente = artifacts.require('Paciente')
const PacienteMapper = artifacts.require('PacienteMapper')
const RolMapper = artifacts.require('RolMapper')
const UsuarioMapper = artifacts.require('UsuarioMapper')
const Acceso = artifacts.require('Acceso')
const DatosParametricosMapper = artifacts.require('DatosParametricosMapper')


module.exports = async function (callback) {


    try {
        let paciente
        let pacienteMapper
        let rolMapper
        let usuarioMapper       
        let acceso
        let datosParametricosMapper
        

        pacienteMapper = await PacienteMapper.deployed()
        rolMapper = await RolMapper.deployed()
        usuarioMapper = await UsuarioMapper.deployed()
        acceso = await Acceso.deployed()        
        datosParametricosMapper = await DatosParametricosMapper.deployed()


        console.log("================Paciente==================")
        // Paciente
        paciente = await Paciente.deployed()
        await paciente.setPacienteMapper(pacienteMapper.address)
        await paciente.setRolMapper(rolMapper.address)
        await paciente.setUsuarioMapper(usuarioMapper.address)
        await paciente.setAcceso(acceso.address)
        await paciente.setDatosParametricosMapper(datosParametricosMapper.address)
        callback()

    } catch (error) {
        console.log("================= Error migration================")
        console.error(error)
        console.log("================= Fin Error migration================")
        callback()
    }
}
