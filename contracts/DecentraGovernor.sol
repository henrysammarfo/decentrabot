// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/governance/Governor.sol";
import "@openzeppelin/contracts/governance/extensions/GovernorCountingSimple.sol";
import "@openzeppelin/contracts/governance/extensions/GovernorVotes.sol";

contract DecentraGovernor is Governor, GovernorCountingSimple, GovernorVotes {
    constructor(IVotes token)
        Governor("DecentraGovernor")
        GovernorVotes(token)
    {}

    function votingDelay() public pure override returns (uint256) {
        return 1;
    }
    function votingPeriod() public pure override returns (uint256) {
        return 45818; // ~1 week
    }

    function proposalThreshold() public pure override returns (uint256) {
        return 0;
    }

    function quorum(uint256) public pure override returns (uint256) {
        return 1;
    }
}
