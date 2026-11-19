// SPDX-License-Identifier: MIT
pragma solidity ^0.8.21;

contract Happy {

    function isHappy(uint n) public pure returns (bool) {
        if (n == 0) {
            return false;
        }

        while (n != 1 && n != 4) {
            uint sum = 0;
            while (n > 0) {
                uint d = n % 10;
                sum = sum + d * d;
                n = n / 10;
            }
            n = sum;
        }

        return n == 1;
    }
}
