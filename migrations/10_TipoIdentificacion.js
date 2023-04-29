console.log("==================TipoIdentificacionVO====================")
const TipoIdentificacionVO = artifacts.require("TipoIdentificacionVO");

module.exports = function (deployer) {
    deployer.deploy(TipoIdentificacionVO, {gas: 8000000});
}