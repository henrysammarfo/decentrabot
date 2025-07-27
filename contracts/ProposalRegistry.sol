// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract ProposalRegistry {
    struct Proposal {
        uint256 id;
        address proposer;
        string hash;
        bool executed;
    }
    mapping(uint256 => Proposal) public proposals;
    uint256 public nextId;

    function register(string calldata hash) external returns (uint256) {
        proposals[nextId] = Proposal(nextId, msg.sender, hash, false);
        return nextId++;
    }

    function markExecuted(uint256 id) external {
        proposals[id].executed = true;
    }
}
