// SPDX-License-Identifier: MIT
pragma solidity ^0.8.21;

contract Anagram {

    function isAnagram(string memory a, string memory b) public pure returns (bool) {
        bytes memory x = bytes(a);
        bytes memory y = bytes(b);

        if (x.length != y.length) {
            return false;
        }

        int[26] memory count;

        for (uint i = 0; i < x.length; i++) {
            count[index(x[i])]++;
            count[index(y[i])]--;
        }

        for (uint i = 0; i < 26; i++) {
            if (count[i] != 0) {
                return false;
            }
        }
        return true;
    }

    function index(bytes1 ch) internal pure returns (uint) {
        uint8 c = uint8(ch);
        if (c >= 65 && c <= 90) {
            c = c + 32;            // A-Z to a-z
        }
        require(c >= 97 && c <= 122, "Only letters allowed");
        return c - 97;
    }
}
