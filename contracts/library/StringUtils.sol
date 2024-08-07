// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.24;

library StringUtils {
    // Function to concatenate two strings
    function concatenate(
        string memory _base,
        string memory _value
    ) internal pure returns (string memory) {
        return string(abi.encodePacked(_base, _value));
    }

    // Function to compare two strings
    function compare(
        string memory _a,
        string memory _b
    ) internal pure returns (bool) {
        return (keccak256(abi.encodePacked((_a))) ==
            keccak256(abi.encodePacked((_b))));
    }
}
