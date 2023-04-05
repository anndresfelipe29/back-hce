console.log("==================Utils====================")
const Utils = artifacts.require("Utils");

module.exports = function (deployer) {
    deployer.deploy(Utils, {gas: 8000000});
}