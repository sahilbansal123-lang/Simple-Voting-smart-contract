// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.0;

contract Voting {
    uint public totalVotes;
    mapping(uint => uint) public votes;

    function vote(uint proposal) public {
        require(proposal >= 0 && proposal <= 1, "Invalid proposal.");
        votes[proposal]++;
        totalVotes++;
    }

    function winningProposal() public view returns (uint) {
        uint winningVoteCount = 0;
        uint winningProposal;
        for (uint p = 0; p <= 1; p++) {
            if (votes[p] > winningVoteCount) {
                winningVoteCount = votes[p];
                winningProposal = p;
            }
        }
        return winningProposal;
    }
}
