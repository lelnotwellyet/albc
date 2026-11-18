//SPDX-License-Identifier:MIT
pragma solidity ^0.8.21;
contract employeeC{
    struct employeeD{
        uint eid;
        string ename;
        uint esal;
        string edes;
    }
    mapping(uint=>employeeD) public s;
    function adde(uint i,string memory n, uint sa, string memory d) public{
        s[i] = employeeD(i,n,sa,d);
    }
    function gete(uint i) public view returns(uint,string memory,uint,string memory){
        employeeD memory s1 = s[i];
        return (s1.eid,s1.ename,s1.esal,s1.edes);

    }
}