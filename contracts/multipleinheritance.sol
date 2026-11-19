// SPDX-License-Identifier: MIT
pragma solidity ^0.8.21;

contract p1 {
    string name;

    constructor(string memory n) {
        name = n;
    }
}

contract p2 {
    string name2;

    constructor(string memory n) {
        name2 = n;
    }
}

contract child is p1, p2 {
    string Cname;

    constructor(string memory n1, string memory n2, string memory n3)
        p1(n1)
        p2(n2)
    {
        Cname = n3;
    }

    function disp() public view returns (string memory, string memory, string memory) {
        return (p1.name, p2.name2, Cname);
    }
}
