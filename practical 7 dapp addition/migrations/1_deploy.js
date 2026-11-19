// Load the compiled contract. The name is case-sensitive and must match
// the contract name in addition.sol ("addition").
const a = artifacts.require("addition");
// Truffle calls this function when you run "truffle migrate".
// "deployer" is a helper object provided by Truffle.
module.exports = function (deployer) {
    // Deploy the contract to the network (costs a small amount of gas).
    deployer.deploy(a);
};
