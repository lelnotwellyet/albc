// SPDX-License-Identifier: MIT
pragma solidity ^0.8.21;

contract Krishnamurthy {

    function isKrishnamurthy(uint n) public pure returns (bool) {
        if (n == 0) {
            return false;
        }

        uint sum = 0;
        uint temp = n;

        while (temp > 0) {
            uint d = temp % 10;
            sum = sum + factorial(d);
            temp = temp / 10;
        }

        return sum == n;
    }

    function factorial(uint d) internal pure returns (uint) {
        uint f = 1;
        for (uint i = 2; i <= d; i++) {
            f = f * i;
        }
        return f;
    }
}
