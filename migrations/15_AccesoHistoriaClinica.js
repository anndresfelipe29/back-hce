console.log("==================AccesoHistoriaClinica====================")
const AccesoHistoriaClinica = artifacts.require("AccesoHistoriaClinica");

module.exports = function (deployer) {
    deployer.deploy(AccesoHistoriaClinica, {gas: 8000000});
}