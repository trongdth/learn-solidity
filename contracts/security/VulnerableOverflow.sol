// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

contract VulnerableOverflow {
    uint8 public smallNumber = 255;

    function increment() public {
        smallNumber += 1;
    }
}
