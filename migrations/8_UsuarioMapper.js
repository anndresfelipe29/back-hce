console.log("==================UsuarioMapper====================")
const UsuarioMapper = artifacts.require("UsuarioMapper");

module.exports = function (deployer) {
    deployer.deploy(UsuarioMapper);
}