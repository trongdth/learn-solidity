// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.24;

import {Math} from "./library/Math.sol";

contract Calculator {
    uint256 private result = 0;

    function add(uint256 num) public {
        result += num;
    }

    function substract(uint256 num) public {
        result -= num;
    }

    function multiply(uint256 num) public {
        result *= num;
    }

    function get() public view returns (uint256) {
        return result;
    }
}

contract BasicCalculator {
    uint256 result;

    function add(uint256 a, uint256 b) public {
        result = a + b;
    }

    function substract(uint256 a, uint256 b) public {
        result = a - b;
    }
}

contract AdvancedCalculator is BasicCalculator {
    function multiply(uint256 a, uint256 b) public {
        result = a * b;
    }

    function divide(uint256 a, uint256 b) public {
        result = a / b;
    }

    function performOperation(uint256 a, uint256 b, uint8 operation) public {
        if (operation == 1) {
            add(a, b);
        } else if (operation == 2) {
            substract(a, b);
        } else if (operation == 3) {
            multiply(a, b);
        } else if (operation == 4) {
            divide(a, b);
        } else {
            revert("operation not found");
        }
    }
}

contract LibraryCalculator {
    using Math for uint;

    function add(uint a, uint b) public pure returns (uint) {
        return a.add(b);
    }

    function substract(uint a, uint b) public pure returns (uint) {
        return a.sub(b);
    }
}
