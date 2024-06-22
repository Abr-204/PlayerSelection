// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract PlayerSelection {
    address public owner;

    constructor() {
        owner = msg.sender;
    }

    // Modifier to check if the caller is the owner
    modifier onlyOwner() {
        require(msg.sender == owner, "You are not authorized to call this function");
        _;
    }

    // Function to select batsmen
    function batsmenSelection(uint256 centuries, uint256 fifties) public view onlyOwner returns (string memory) {
        require(centuries >= 5, "Player must have at least 5 centuries");
        require(fifties >= 10, "Player must have at least 10 fifties");

        // Using assert to ensure the logical correctness
        assert(centuries >= 5 && fifties >= 10);

        return "Player selected as Batsman";
    }

    // Function to select bowlers
    function bowlerSelection(uint256 wickets) public view onlyOwner returns (string memory) {
        // Require statement to check minimum wickets
        require(wickets >= 30, "Player must have at least 30 wickets in a match");

        // Using revert to handle the case where wickets are less than required
        if (wickets < 30) {
            revert("Player is not eligible for selection as a bowler");
        }

        return "Player selected as Bowler";
    }
}
