// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.24;

contract VulnerableExternalCall {
    mapping(address => uint) public balances;

    function deposit() public payable {
        balances[msg.sender] += msg.value;
    }

    function withdraw(uint _amount) public {
        require(balances[msg.sender] >= _amount, "Insufficient balance");
        // Unchecked external call
        (bool success, ) = msg.sender.call{value: _amount}("");
        // No check if the call was successful
        balances[msg.sender] -= _amount;
    }
}
