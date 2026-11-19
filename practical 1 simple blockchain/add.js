const c = require('crypto');

class block {
    constructor(id, n, n1, t, ph = "") {
        this.id = id;
        this.n = n;
        this.n1 = n1;
        this.result = n + n1;
        this.t = t;
        this.ph = ph;
        this.hash = this.calch();
    }

    calch() {
        return c.createHash('sha256').update(this.id + this.n + this.n1 + this.result + this.t + this.ph).digest('hex');
    }
}

class Blockchain {
    constructor() {
        this.chain = [this.GBlock()];
    }

    GBlock() {
        return new block(0, 0, 0, Date.now(), "0");
    }

    getCBlock() {
        return this.chain[this.chain.length - 1];
    }

    addBlock(b) {
        b.ph = this.getCBlock().hash;
        b.hash = b.calch();
        this.chain.push(b);
    }
}

module.exports = { block, Blockchain };