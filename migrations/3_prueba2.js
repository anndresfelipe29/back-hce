// const PersonaStruct = artifacts.require("PersonaStruct");
// const PacienteDAO = artifacts.require("PacienteDAO");
// const PacienteService = artifacts.require("PacienteService");
// const PacienteMapper = artifacts.require("PacienteMapper");
const Acceso = artifacts.require("Acceso");
// const PacienteVO = artifacts.require("PacienteVO");
// const PermisoRolMapper = artifacts.require("PermisoRolMapper");

module.exports = function (deployer) {
    // deployer.deploy(PersonaStruct);
    // deployer.deploy(PacienteService);
    // deployer.deploy(PacienteMapper);
    deployer.deploy(Acceso);
    // deployer.deploy(PacienteVO);
    // deployer.deploy(PermisoRolMapper);

};
