// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

// Base contract: holds the name and id of the person who sets up the course.
// They are initialised through the constructor.
contract Person {
    string public name;
    uint256 public id;
    address public owner;

    constructor(string memory _name, uint256 _id) {
        name = _name;
        id = _id;
        owner = msg.sender;
    }
}

// Derived contract: stores the course details and registers students.
contract Student is Person {
    struct StudentInfo {
        string name;
        uint256 id;
        bool isRegistered;
    }

    string public courseName;
    uint256 public courseFee;     // in wei
    uint256 public maxCapacity;
    uint256 public registeredCount;

    mapping(address => StudentInfo) public students;
    mapping(uint256 => bool) public idTaken;

    event Registered(
        address indexed studentAddress,
        string name,
        uint256 studentId,
        uint256 seatsRemaining
    );
    event Withdrawn(address indexed owner, uint256 amount);

    modifier onlyOwner() {
        require(msg.sender == owner, "Only owner can call this");
        _;
    }

    constructor(
        string memory _name,
        uint256 _id,
        string memory _courseName,
        uint256 _courseFee,
        uint256 _maxCapacity
    ) Person(_name, _id) {
        require(_maxCapacity > 0, "Capacity must be greater than 0");
        courseName = _courseName;
        courseFee = _courseFee;
        maxCapacity = _maxCapacity;
    }

    // Register the caller for the course (send exactly courseFee wei)
    function register(string calldata _name, uint256 _id) external payable {
        require(registeredCount < maxCapacity, "Registration full");
        require(!students[msg.sender].isRegistered, "Already registered");
        require(!idTaken[_id], "Student ID already used");
        require(msg.value == courseFee, "Incorrect course fee");

        students[msg.sender] = StudentInfo(_name, _id, true);
        idTaken[_id] = true;
        registeredCount += 1;

        emit Registered(msg.sender, _name, _id, maxCapacity - registeredCount);
    }

    function seatsLeft() external view returns (uint256) {
        return maxCapacity - registeredCount;
    }

    // Fees collected so far, waiting to be withdrawn
    function contractBalance() external view returns (uint256) {
        return address(this).balance;
    }

    // Only the account that deployed the contract can withdraw
    function withdraw() external onlyOwner {
        uint256 balance = address(this).balance;
        require(balance > 0, "No funds to withdraw");
        (bool success, ) = payable(owner).call{value: balance}("");
        require(success, "Transfer failed");
        emit Withdrawn(owner, balance);
    }
}
