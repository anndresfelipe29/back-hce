// const PersonaStruct = artifacts.require("PersonaStruct");
// const PacienteDAO = artifacts.require("PacienteDAO");
const PacienteService = artifacts.require("PacienteService");


module.exports = function (deployer) {
    // deployer.deploy(PersonaStruct);
    deployer.deploy(PacienteService);
    

};
