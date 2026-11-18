//SPDX-License-Identifier:MIT
pragma solidity  ^0.8.21;
contract prime{
    function checkprime(uint n) public pure returns(string memory){
        if(n<=1){
            return "not a prime";


        }
        for(uint i =2; i<n; i++ ){
            if(n%i==0){
                return "not a prime";
            }
        }
        return 'prime number';

    }
}