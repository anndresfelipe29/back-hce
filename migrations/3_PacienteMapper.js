console.log("==================PacienteMapper====================")
const PacienteMapper = artifacts.require("PacienteMapper");

module.exports = function (deployer) {
    deployer.deploy(PacienteMapper, {gas: 8000000});
}