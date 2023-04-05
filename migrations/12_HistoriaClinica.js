console.log("==================HistoriaClinica====================")
const HistoriaClinica = artifacts.require("HistoriaClinica");

module.exports = function (deployer) {
    deployer.deploy(HistoriaClinica, {gas: 8000000});
}