console.log("==================Oracle====================")
const Utils = artifacts.require("Utils");
const Oracle = artifacts.require("Oracle");

module.exports = function (deployer) {
    deployer.link(Utils, Oracle);
    deployer.deploy(Oracle, {gas: 8000000});
}