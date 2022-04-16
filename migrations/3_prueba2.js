// const PersonaStruct = artifacts.require("PersonaStruct");
// const PacienteDAO = artifacts.require("PacienteDAO");
// const PacienteService = artifacts.require("PacienteService");
// const PacienteMapper = artifacts.require("PacienteMapper");
const Acceso = artifacts.require("Acceso");
// const PacienteVO = artifacts.require("PacienteVO");
const Paciente = artifacts.require("Paciente");
// const PermisoRolMapper = artifacts.require("PermisoRolMapper");
const EstadoVO = artifacts.require("EstadoVO");

module.exports = function (deployer) {
    // deployer.deploy(PersonaStruct);
    // deployer.deploy(PacienteService);
    // deployer.deploy(PacienteMapper);
    deployer.deploy(Acceso);
    // deployer.deploy(PacienteVO);
    deployer.deploy(Paciente);
    deployer.deploy(EstadoVO);
    // deployer.deploy(PermisoRolMapper);

};
