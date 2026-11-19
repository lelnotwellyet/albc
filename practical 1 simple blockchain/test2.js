const { block, Blockchain } = require('./prime');

let n = new Blockchain();
n.addBlock(new block(1, 17, Date.now()));
n.addBlock(new block(2, 4, Date.now()));
console.log(n.chain);