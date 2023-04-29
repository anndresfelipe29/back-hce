console.log("==================HistoriaClinicaMapper====================")
const HistoriaClinicaMapper = artifacts.require("HistoriaClinicaMapper");

module.exports = function (deployer) {
    deployer.deploy(HistoriaClinicaMapper, {gas: 8000000});
}