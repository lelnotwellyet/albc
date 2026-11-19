// SPDX-License-Identifier: MIT
pragma solidity ^0.8.21;

contract Armstrong {

    function isArmstrong(uint n) public pure returns (bool) {
        if (n == 0) {
            return true;
        }

        uint digits = 0;
        uint temp = n;
        while (temp > 0) {
            digits++;
            temp = temp / 10;
        }

        uint sum = 0;
        temp = n;
        while (temp > 0) {
            uint d = temp % 10;
            sum = sum + d ** digits;
            temp = temp / 10;
        }

        return sum == n;
    }
}
