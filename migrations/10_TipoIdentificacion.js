console.log("==================TipoIdentificacionVO====================")
const TipoIdentificacionVO = artifacts.require("TipoIdentificacionVO");

module.exports = function (deployer) {
    deployer.deploy(TipoIdentificacionVO);
}