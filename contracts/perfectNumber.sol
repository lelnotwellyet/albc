// SPDX-License-Identifier: MIT 
pragma solidity ^0.8.20; 
contract PerfectNumber { 
    function check(uint n) public pure returns(string memory) { 
        uint sum = 0; 
        for(uint i = 1; i <= n / 2; i++) { 
            if(n % i == 0) { 
                sum = sum + i; 
            }  } 
        if(sum == n) { 
            return "Perfect Number"; } 
        return "Not Perfect Number"; 
    }  } 
