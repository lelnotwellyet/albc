// SPDX-License-Identifier: MIT
pragma solidity ^0.8.21;

contract Prime {
    function isPrime(uint n) public pure returns (bool) {
        if (n < 2) {
            return false;
        }
        for (uint i = 2; i * i <= n; i++) {
            if (n % i == 0) {
                return false;
            }
        }
        return true;
    }
}