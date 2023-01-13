const PermisoMapper = artifacts.require('PermisoMapper')
const PermisoVO = artifacts.require("PermisoVO")

const RolMapper = artifacts.require('RolMapper')
const RolVO = artifacts.require('RolVO')

const UsuarioMapper = artifacts.require('UsuarioMapper')
const UsuarioVO = artifacts.require('UsuarioVO')

const PacienteMapper = artifacts.require('PacienteMapper')
const Paciente = artifacts.require('Paciente')
const PacienteVO = artifacts.require('PacienteVO')

const Medico = artifacts.require('Medico')
const MedicoMapper = artifacts.require('MedicoMapper')
const MedicoOraculo = artifacts.require('MedicoOraculo')

const Acceso = artifacts.require('Acceso')

const AccesoHistoriaClinica = artifacts.require('AccesoHistoriaClinica')
const AccesoHistoriaClinicaMapper = artifacts.require('AccesoHistoriaClinicaMapper')

const EstadoVO = artifacts.require('EstadoVO')
const EstadoCivilVO = artifacts.require('EstadoCivilVO')
const AseguradoraVO = artifacts.require('AseguradoraVO')
const TipoVinculacionVO = artifacts.require('TipoVinculacionVO')
const EstadoHCEVO = artifacts.require('EstadoHCEVO')
const TipoIdentificacionVO = artifacts.require('TipoIdentificacionVO')

const DatosParametricosMapper = artifacts.require('DatosParametricosMapper')
const HistoriaClinica = artifacts.require('HistoriaClinica')
const HistoriaClinicaMapper = artifacts.require('HistoriaClinicaMapper')
const Oracle = artifacts.require('Oracle')

const { open} = require('fs/promises');

module.exports = async function (callback) {
    let direcciones = []
    // let instance

    let medicoOraculo
    let accesoHistoriaClinica
    let oracle

    const accounts = await web3.eth.getAccounts()
    oracle = await Oracle.deployed()
    direcciones.push({contrato:'oracle',direccion: oracle.address})

    medicoOraculo = await MedicoOraculo.deployed()
    direcciones.push({contrato:'medicoOraculo',direccion: medicoOraculo.address})
    

    // accesoHistoriaClinica
    accesoHistoriaClinica = await AccesoHistoriaClinica.deployed()    
    direcciones.push({contrato:'accesoHistoriaClinica',direccion: accesoHistoriaClinica.address})

    await writeToFile('build/contracts/direcciones.json', direcciones)
    console.log("Terminamos la carga de datos y conexión entre contratos")
    callback()
}


async function writeToFile(fileName, data) {
  try {
    // await writeFile(fileName, data);
    const file = await open(fileName, 'w');
    console.log(data)
    await file.write(JSON.stringify(data));
    console.log(`Wrote data to ${fileName}`);
  } catch (error) {
    console.error(`Got an error trying to write the file: ${error.message}`);
  }
}