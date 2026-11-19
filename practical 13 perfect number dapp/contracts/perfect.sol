// SPDX-License-Identifier: MIT
pragma solidity ^0.8.21;

contract PerfectNumber {
    function isPerfect(uint256 n) public pure returns (bool) {
        if (n < 2) {
            return false;
        }
        uint256 sum = 1;
        for (uint256 i = 2; i <= n / i; i++) {
            if (n % i == 0) {
                sum += i;
                uint256 pair = n / i;
                if (pair != i) {
                    sum += pair;
                }
            }
        }
        return sum == n;
    }
}