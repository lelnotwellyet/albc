//SPDX-License-Identifier:MIT
// Declares the license (Remix warns if this line is missing).

pragma solidity ^0.8.21;
// Tells the compiler to use version 0.8.21 or any newer 0.8.x.

contract v{
// Starts the contract named "v" (like a class in Java/C++).

    string[] public c;
    // A list of candidate names; "public" auto-creates a getter c(index).

    mapping(address=>bool) public hv;
    // Lookup table: wallet address -> true/false for "has this wallet voted?".

    mapping(string=>uint) public vc;
    // Lookup table: candidate name -> number of votes they have.

    constructor(string[] memory  cn){
    // Runs once at deployment and receives the list of candidate names.

        c = cn;
        // Copies the incoming names into the permanent list c.
    }

    function vote(string memory cn) public{
    // Function anyone can call to vote; cn is the one name the voter picks.

        require(!hv[msg.sender],"u already voted!");
        // Cancels the transaction if the caller's wallet has already voted.

        bool ce = false;
        // Flag meaning "candidate exists"; assumed false until we find the name.

        for(uint i=0;i<c.length;i++){
        // Loops through every candidate position: 0, 1, 2, ...

            if(keccak256(bytes(c[i]))==keccak256(bytes(cn))){
            // Compares the hash of candidate i with the hash of the typed name (strings can't use ==).

                ce = true;
                // Name found, so flip the flag to true.

                break;
                // Stops the loop early since we already found a match.
            }
        }

        require(ce,"candidate does not exist");
        // Cancels the transaction if the name was never found in the list.

        vc[cn]++;
        // Adds 1 vote to the chosen candidate.

        hv[msg.sender]=true;
        // Marks this wallet as voted so it can't vote again.
    }

    function winner() public view returns(string memory){
    // Free-to-call function (view) that returns the winning candidate's name.

        string memory winnerc = c[0];
        // Assumes the first candidate is the current leader.

        for(uint i=1;i<c.length;i++){
        // Loops through the remaining candidates (starts at 1, since 0 is already the leader).

            if(vc[c[i]]>vc[winnerc]){
            // Checks if candidate i has more votes than the current leader.

                winnerc = c[i];
                // If yes, candidate i becomes the new leader.
            }
        }

        return winnerc;
        // Gives back the name of the leader after checking everyone.
    }
}