console.log("==================RolMapper====================")
const RolMapper = artifacts.require("RolMapper");

module.exports = function (deployer) {
    deployer.deploy(RolMapper);
}