console.log("==================Paciente====================")
const Paciente = artifacts.require("Paciente");

module.exports = function (deployer) {
    deployer.deploy(Paciente, {gas: 8000000});
}