// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.24;

interface ICalculator {
    function add(uint a, uint b) external pure returns (uint);
    function sub(uint a, uint b) external pure returns (uint);
}
