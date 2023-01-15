console.log("==================DatosParametricosMapper====================")
const DatosParametricosMapper = artifacts.require("DatosParametricosMapper");

module.exports = function (deployer) {
    deployer.deploy(DatosParametricosMapper);
}