// const PersonaStruct = artifacts.require("PersonaStruct");
// const PacienteDAO = artifacts.require("PacienteDAO");
// const PacienteService = artifacts.require("PacienteService");
const PacienteMapper = artifacts.require("PacienteMapper");
const Paciente = artifacts.require("Paciente");
// const PacienteVO = artifacts.require("PacienteVO");
const MedicoMapper = artifacts.require("MedicoMapper");
const Medico = artifacts.require("Medico");
const Acceso = artifacts.require("Acceso");
// const PermisoRolMapper = artifacts.require("PermisoRolMapper");
const EstadoVO = artifacts.require("EstadoVO");
const UsuarioMapper = artifacts.require("UsuarioMapper");
const RolMapper = artifacts.require("RolMapper");
const TipoIdentificacionVO = artifacts.require('TipoIdentificacionVO');
const DatosParametricosMapper = artifacts.require('DatosParametricosMapper');
// const MedicoOraculo = artifacts.require('MedicoOraculo')
const HistoriaClinica = artifacts.require('HistoriaClinica')
const HistoriaClinicaMapper =artifacts.require('HistoriaClinicaMapper')
const AccesoHistoriaClinicaMapper = artifacts.require('AccesoHistoriaClinicaMapper')
const AccesoHistoriaClinica = artifacts.require('AccesoHistoriaClinica')
const Utils = artifacts.require('Utils')

const Oracle = artifacts.require('Oracle')

module.exports = function (deployer) {
    try {
           // deployer.deploy(PersonaStruct);
    // deployer.deploy(PacienteService);
    deployer.deploy(PacienteMapper);
    deployer.deploy(MedicoMapper);
    deployer.deploy(UsuarioMapper);
    deployer.deploy(Acceso);
    // deployer.deploy(PacienteVO);
    deployer.deploy(Paciente);
    deployer.deploy(Medico);
    deployer.deploy(EstadoVO);
    deployer.deploy(RolMapper);
    deployer.deploy(TipoIdentificacionVO);
    deployer.deploy(DatosParametricosMapper);
    // deployer.deploy(MedicoOraculo);
    deployer.deploy(HistoriaClinicaMapper);
    deployer.deploy(HistoriaClinica);
    /*
     Así se usan librerias propias en contratos
     https://blockheroes.dev/complex-migration/#:~:text=Migrate%20libraries%20(%2B%20interfaces)
    */
    deployer.deploy(Utils);
    deployer.link(Utils, AccesoHistoriaClinicaMapper);
    deployer.deploy(AccesoHistoriaClinicaMapper);
    deployer.deploy(AccesoHistoriaClinica);
    
    // deployer.deploy(PermisoRolMapper);
    // Agregar a otro migrate
    deployer.link(Utils, Oracle);
    deployer.deploy(Oracle)
    } catch (error) {
        console.log("================= Error migration================")
        console.error(error)
        console.log("================= Fin Error migration================")
    }
 
};
