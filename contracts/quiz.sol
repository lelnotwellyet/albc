//SPDX-License-Identifier:MIT
pragma solidity  ^0.8.21;
contract quiz{
    //create a struct to store question and the correct answer in one place
    struct questions{
        string qu;
        string ca;
    }
    //create an array and alias q
    questions[] public q;
    //create total correct and wrong answer counts
    uint public tc;
    uint public tw;
    //create an event for storing the q the users ans and if its true or false it creates a log basically
    //we can call it by emit 
    event answers(string q,string uans, bool isc);
    //create a function for adding questions and correct ans and pushing to the array using the alias
    function addqs(string memory qu,string memory ca) public{
        q.push(questions(qu,ca));
    }
    function showq(uint i) public view returns(string memory){
        require(i<q.length, "not found");
        return q[i].qu;
    }
    function totalq()public view returns(uint){
        return q.length;
    }
    //create a function to checkk if the answer is true or false and adding it to the cout and calling the evven by emit
    //and having an index 
    function ans(uint i,string memory uans) public{
        require(i<q.length,"question not found");
        if(keccak256(bytes(uans))==keccak256(bytes(q[i].ca))){
            tc++;
            emit answers(q[i].qu, uans, true);
        }
        else{
            tw++;
            emit answers(q[i].qu, uans, false);
        }

    }

    }
    

