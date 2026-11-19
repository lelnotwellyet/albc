const PerfectNumber = artifacts.require("PerfectNumber");

contract("PerfectNumber", () => {

    it("should identify 6 as perfect", async () => {
        const p = await PerfectNumber.deployed();
        assert.equal(await p.isPerfect(6), true);
    });

    it("should identify 28 as perfect", async () => {
        const p = await PerfectNumber.deployed();
        assert.equal(await p.isPerfect(28), true);
    });

    it("should identify 10 as not perfect", async () => {
        const p = await PerfectNumber.deployed();
        assert.equal(await p.isPerfect(10), false);
    });

    it("should reject 1 as a perfect number", async () => {
        const p = await PerfectNumber.deployed();
        assert.equal(await p.isPerfect(1), false);
    });
});