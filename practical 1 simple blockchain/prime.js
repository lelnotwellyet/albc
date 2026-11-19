const c = require('crypto');

class block {
    constructor(id, n, t, ph = "") {
        this.id = id;
        this.n = n;
        this.result = this.isPrime(n);
        this.t = t;
        this.ph = ph;
        this.hash = this.calch();
    }

    isPrime(n) {
        if (n <= 1) {
            return false;
        }
        for (let i = 2; i < n; i++) {
            if (n % i === 0) {
                return false;
            }
        }
        return true;
    }

    calch() {
        return c.createHash('sha256').update(this.id + this.n + this.result + this.t + this.ph).digest('hex');
    }
}

class Blockchain {
    constructor() {
        this.chain = [this.GBlock()];
    }

    GBlock() {
        return new block(0, 0, Date.now(), "0");
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