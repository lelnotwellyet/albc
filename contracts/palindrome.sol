//SPDX-License-Identifier:MIT
pragma solidity ^0.8.21;
contract plaindrome{
    function checkpal(uint n) public pure returns(string memory){
    uint r;
    uint rev = 0;
    uint n1 = n;

    while (n!=0){
        r = n%10;
        rev = rev*10+r;
        n = n/10;
    }
    if(n1==rev){
        return 'palindrome';
    }
    else{
        return 'not a palindrome';
    }

    }
    
}