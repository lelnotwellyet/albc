// SPDX-License-Identifier: MIT
// ^ License label. Solidity shows a warning if it is missing.
pragma solidity ^0.8.21;
// ^ Compiler version. ^0.8.21 means 0.8.21 or higher, but below 0.9.0.
contract addition {
// ^ Defines the contract (like a class). The name "addition" must match
//   what the migration file requires.
    function add(uint a, uint b) public pure returns (uint) {
    // add                 -> name of the function
    // (uint a, uint b)    -> two unsigned integers (cannot be negative)
    // public              -> can be called from outside the contract
    // pure                -> does not read or write blockchain data, so
    //                        calling it is free (no gas)
    // returns (uint)      -> gives back one unsigned integer
        return a + b;
        // Adds the two inputs and returns the result.
        // Since Solidity 0.8, overflow automatically reverts.
    }
}