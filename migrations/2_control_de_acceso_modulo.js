// const PersonaStruct = artifacts.require("PersonaStruct");
const Persona = artifacts.require("Persona");
const Paciente = artifacts.require("Paciente");
const Medico = artifacts.require("Medico");
const Usuario = artifacts.require('./logica/Usuario.sol');
const PersonaDAO = artifacts.require("PersonaDAO");
const AccesoService = artifacts.require("AccesoService");
const MedicoService = artifacts.require("MedicoService");
const PacienteService = artifacts.require("PacienteService");

module.exports = function (deployer) {
    // deployer.deploy(PersonaStruct);
    deployer.deploy(Persona);
    deployer.deploy(Paciente);
    deployer.deploy(Medico);
    deployer.deploy(Usuario);
    deployer.deploy(PersonaDAO);
    deployer.deploy(AccesoService);
    deployer.deploy(MedicoService);
    deployer.deploy(PacienteService);

    
  
};
