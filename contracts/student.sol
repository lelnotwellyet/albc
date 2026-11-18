//SPDX-License-Identifier:MIT
pragma solidity ^0.8.21;
contract studentC{
    struct studentD{
        uint sid;
        string sname;
        string add;
    }
    mapping(uint=>studentD) public s;
    function addstud(uint i, string memory n, string memory a) public{
        s[i]= studentD(i,n,a);
    }
    function gets(uint i) public view returns(uint,string memory, string memory){
        studentD memory s1 = s[i];
        return(s1.sid, s1.sname, s1.add);

    }

}