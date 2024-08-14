// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.24;

contract VulnerableAccessControl {
    address payable public owner;

    constructor() payable {
        require(msg.value >= 0.01 ether, "not enough Metis");
        owner = payable(msg.sender);
    }

    // Unrestricted function to set a new owner
    function setOwner(address _newOwner) public {
        owner = payable(_newOwner);
    }

    function withdraw(uint _amount) public {
        owner.transfer(_amount);
    }
}
