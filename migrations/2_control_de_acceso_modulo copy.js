// const PersonaStruct = artifacts.require("PersonaStruct");
const PersonaDAO = artifacts.require("PersonaDAO");
const PacienteDAO = artifacts.require("PacienteDAO");
const MedicoDAO = artifacts.require("MedicoDAO");

const Persona = artifacts.require("Persona");
const Paciente = artifacts.require("./logica/Paciente.sol");
const Medico = artifacts.require("./logica/Medico.sol");

const AccesoService = artifacts.require("AccesoService");
const PacienteService = artifacts.require("PacienteService");
const MedicoService = artifacts.require("MedicoService");

const Usuario = artifacts.require('./logica/Usuario.sol');

module.exports = function (deployer) {
    // deployer.deploy(PersonaStruct);
    // Deploy de daos
    deployer.deploy(PersonaDAO);
    deployer.deploy(PacienteDAO);
    deployer.deploy(MedicoDAO);
    
    deployer.deploy(Persona);
    deployer.deploy(Paciente);
    deployer.deploy(Medico);
    deployer.deploy(Usuario);
    
    deployer.deploy(AccesoService);
    deployer.deploy(PacienteService);
    deployer.deploy(MedicoService);
    
};
