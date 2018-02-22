var GoCoin = artifacts.require("./goblockchain/token/ERC20Zepellin/GoCoin.sol");

module.exports = function(deployer) {
  deployer.deploy(GoCoin);
};
