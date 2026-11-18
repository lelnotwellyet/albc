// SPDX-License-Identifier: MIT
pragma solidity  ^0.8.21;
contract bankC{
    uint balance;
    function deposit() public payable {
        balance+=msg.value;

    }
    function transferE(address payable r) public payable 
    { 
        require(address(this).balance>msg.value,"Insufficient balance"); 
            r.transfer(msg.value); 
    }
}