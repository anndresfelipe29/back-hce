console.log("==================MedicoMapper====================")
const MedicoMapper = artifacts.require("MedicoMapper");

module.exports = function (deployer) {
    deployer.deploy(MedicoMapper);
}