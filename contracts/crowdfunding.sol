// SPDX-License-Identifier: MIT
pragma solidity ^0.8.21;

contract Campaign {
    address public owner;
    uint public goal;
    uint public deadline;
    uint public totalFunds;

    constructor(uint _goal, uint _durationSeconds) {
        owner = msg.sender;
        goal = _goal;
        deadline = block.timestamp + _durationSeconds;
    }
}

contract Crowdfunding is Campaign {
    mapping(address => uint) public contributions;
    bool public goalReached;

    event ContributionReceived(address contributor, uint amount);
    event GoalReached(uint totalFunds);

    constructor(uint _goal, uint _durationSeconds) Campaign(_goal, _durationSeconds) {}

    function contribute() public payable {
        require(block.timestamp < deadline, "Campaign ended");
        require(msg.value > 0, "Send some ETH");
        contributions[msg.sender] += msg.value;
        totalFunds += msg.value;
        emit ContributionReceived(msg.sender, msg.value);

        if (totalFunds >= goal && !goalReached) {
            goalReached = true;
            emit GoalReached(totalFunds);
        }
    }

    function refund() public {
        require(block.timestamp >= deadline, "Campaign still running");
        require(totalFunds < goal, "Goal reached, no refund");
        uint amount = contributions[msg.sender];
        require(amount > 0, "Nothing to refund");
        contributions[msg.sender] = 0;
        totalFunds -= amount;
        payable(msg.sender).transfer(amount);
    }
}
