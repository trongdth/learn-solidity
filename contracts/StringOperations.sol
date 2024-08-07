// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.24;

import {StringUtils} from "./library/StringUtils.sol";

contract StringOperations {
    using StringUtils for string;

    constructor() {}

    function concatenateStrings(
        string memory a,
        string memory b
    ) public pure returns (string memory) {
        return a.concatenate(b);
    }

    function compareStrings(
        string memory a,
        string memory b
    ) public pure returns (bool) {
        return a.compare(b);
    }
}
