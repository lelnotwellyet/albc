const { block, Blockchain } = require('./add');

let n = new Blockchain();
n.addBlock(new block(2, 23, 76, Date.now()));
console.log(n.chain);