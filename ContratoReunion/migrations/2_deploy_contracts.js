var reunionVerificacion = artifacts.require("reunionVerificacion");
module.exports = function(deployer) {
  deployer.deploy(reunionVerificacion);
};
