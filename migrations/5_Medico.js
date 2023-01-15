console.log("==================Medico====================")
const Medico = artifacts.require("Medico");

module.exports = function (deployer) {
    deployer.deploy(Medico);
}