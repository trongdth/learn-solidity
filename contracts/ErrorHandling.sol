// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.24;

contract ErrorHandling {
    constructor() {}

    function testAssert(uint _a) public pure {
        assert(_a > 0);
    }

    function testRequire(uint _a) public pure {
        require(_a > 0, "Value must be greater than 0");
    }

    function testRevert(uint _a) public pure {
        if (_a <= 0) {
            revert("Value must be greater than 0");
        }
    }
}
