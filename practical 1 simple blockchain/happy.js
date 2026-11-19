const c = require('crypto');

class block {
    constructor(id, n, t, ph = "") {
        this.id = id;
        this.n = n;
        this.result = this.isHappy(n);
        this.t = t;
        this.ph = ph;
        this.hash = this.calch();
    }

    isHappy(n) {
        let visited = [];
        while (n !== 1 && !visited.includes(n)) {
            visited.push(n);
            let sum = 0;
            while (n > 0) {
                let digit = n % 10;
                sum = sum + digit * digit;
                n = Math.floor(n / 10);
            }
            n = sum;
        }
        return n === 1;
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
        if (b.result === true) {
            b.ph = this.getCBlock().hash;
            b.hash = b.calch();
            this.chain.push(b);
        }
    }
}

module.exports = { block, Blockchain };