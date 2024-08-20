// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.24;

contract VulnerableReentrancy {
    mapping(address => uint) public balances;

    function deposit() public payable {
        require(msg.value >= 0.01 ether, "not enough Metis");
        balances[msg.sender] += msg.value;
    }

    function withdraw(uint _amount) public {
        require(balances[msg.sender] >= _amount, "Insufficient balance");
        balances[msg.sender] -= _amount;
        (bool success, ) = msg.sender.call{value: _amount}("");
        require(success, "Transfer failed");
    }
}
