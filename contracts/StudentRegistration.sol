// SPDX-License-Identifier: MIT
pragma solidity ^0.8.21;

contract Person {
    string public name;
    uint public id;

    constructor(string memory _name, uint _id) {
        name = _name;
        id = _id;
    }
}

contract Student is Person {
    string public courseName;
    uint public fees;
    uint public maxSeats;
    uint public registeredCount;
    mapping(address => bool) public registered;

    constructor(string memory _name, uint _id, string memory _course, uint _fees, uint _maxSeats)
        Person(_name, _id)
    {
        courseName = _course;
        fees = _fees;
        maxSeats = _maxSeats;
    }

    function register() public payable {
        require(registeredCount < maxSeats, "Course full");
        require(!registered[msg.sender], "Already registered");
        require(msg.value == fees, "Pay exact fees");
        registered[msg.sender] = true;
        registeredCount++;
    }
}
