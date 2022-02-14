// const PersonaStruct = artifacts.require("PersonaStruct");
// const PacienteDAO = artifacts.require("PacienteDAO");
//const PacienteService = artifacts.require("PacienteService");
const PersonaRepository = artifacts.require("PersonaRepository");
const PersonaVO = artifacts.require("PersonaVO");

module.exports = function (deployer) {
    // deployer.deploy(PersonaStruct);
    //deployer.deploy(PacienteService);
    deployer.deploy(PersonaRepository);
    deployer.deploy(PersonaVO);

};
