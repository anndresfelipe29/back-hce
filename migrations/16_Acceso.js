console.log("==================Acceso====================")
const Acceso = artifacts.require("Acceso");

module.exports = function (deployer) {
    deployer.deploy(Acceso, {gas: 8000000});
}