console.log("==================EstadoVO====================")
const EstadoVO = artifacts.require("EstadoVO");

module.exports = function (deployer) {
    deployer.deploy(EstadoVO);
}