const { block, Blockchain } = require('./happy');

let n = new Blockchain();
n.addBlock(new block(1, 19, Date.now()));
n.addBlock(new block(2, 20, Date.now()));
n.addBlock(new block(3, 7, Date.now()));
console.log("\nBlockchain:");
console.log(n.chain);