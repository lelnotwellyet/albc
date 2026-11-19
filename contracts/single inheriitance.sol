// SPDX-License-Identifier: MIT
pragma solidity ^0.8.21;

contract Vehicle {
    string vehType;
    string nt;

    constructor(string memory t, string memory n) {
        vehType = t;
        nt = n;
    }

    function disp() public view returns (string memory, string memory) {
        return (vehType, nt);
    }
}

contract Bike is Vehicle {
    string brandname;
    string color;

    constructor(
        string memory t,
        string memory n,
        string memory bn,
        string memory c
    ) Vehicle(t, n) {
        brandname = bn;
        color = c;
    }

    function dispB() public view returns (string memory, string memory, string memory, string memory) {
        (string memory t, string memory n) = disp();
        return (t, n, brandname, color);
    }
}
