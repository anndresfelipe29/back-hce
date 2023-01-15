console.log("==================AccesoHistoriaClinicaMapper====================")
const Utils = artifacts.require("Utils");
const AccesoHistoriaClinicaMapper = artifacts.require("AccesoHistoriaClinicaMapper");

module.exports = function (deployer) {
    deployer.link(Utils, AccesoHistoriaClinicaMapper);
    deployer.deploy(AccesoHistoriaClinicaMapper);
   
}