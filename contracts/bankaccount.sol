//SPDX-License-Identifier: MIT
pragma solidity ^0.8.21;
contract bank{
    struct users{
        uint acc;
        string name;
        uint bal;
    }
    mapping(uint=>users) public u;
    function createA(uint acc, string memory name) public returns(uint){
        require(acc!=0,"invalid account number");
        require(u[acc].acc==0,"account already exists!");
        u[acc] = users(acc,name,0);
        return acc;
    }
    function dep(uint acc) public payable{
        require(u[acc].acc !=0 , "account doesnt exists!");
        require(msg.value>0,"enter a amount");
        u[acc].bal+=msg.value;
    }
    function withdrawal(uint acc, uint amt) public{
        require(u[acc].acc != 0 , "acccount doesnt exists");
        require(u[acc].bal>=amt,"insufficient bal");
        u[acc].bal-=amt;
        payable(msg.sender).transfer(amt);


    }
    function getbal(uint acc,uint bal) public view returns (uint){
        require(u[acc].acc != 0 , " account doesnt exist");
        return u[acc].bal;
    }
}