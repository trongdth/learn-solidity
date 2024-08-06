// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.24;

contract Fundamentals {
    // Represents an Ethereum address
    address user = 0x54aa977d8aAec77935DC4b31DEE40d47054fEB2a;

    // It's just a string
    string message = "Hello, Solidity!";

    // It's just 32 bytes (efficient than string)
    bytes32 b32;

    // Basically is it True or False
    bool isReady = true;

    // Small number for max supply of NFTs
    uint8 MAX_SUPPLY = 10;

    // What do you think 1 days is?
    uint256 public WAIT_TIME = 1 days;

    // Enum
    enum S {
        CREATED,
        LOCKED,
        INACTIVE
    }

    // Mapping from uint to string
    mapping(uint => string) public uintStudents;

    // Mapping from address to string
    mapping(address => string) public addressStudents;

    // Dynamic Array
    uint[] public dynamicArr;

    // Fixed Array
    uint[5] public fixedArr;

    struct Tesla {
        string model;
        uint256 year;
        string color;
    }

    Tesla[] public teslas;

    function addTesla(
        string memory model_,
        uint256 year_,
        string memory color_
    ) public {
        Tesla memory newTesla = Tesla({
            model: model_,
            year: year_,
            color: color_
        });

        teslas.push(newTesla);
    }

    function getDynamicArr(uint i) public view returns (uint) {
        return dynamicArr[i];
    }

    function getFixedArr(uint i) public view returns (uint) {
        return fixedArr[i];
    }

    function addToDynamicArray(uint value) public {
        dynamicArr.push(value);
    }

    function getDynamicArrLength() public view returns (uint) {
        return dynamicArr.length;
    }

    function bytes32ToString(
        bytes32 bytes32_
    ) public pure returns (string memory) {
        return string(abi.encodePacked(bytes32_));
    }

    function get(address addr_) public view returns (string memory name) {
        name = addressStudents[addr_];
        return name;
    }

    function set(address addr_, string memory name_) public {
        addressStudents[addr_] = name_;
    }

    function remove(address addr_) public {
        delete addressStudents[addr_];
    }

    function countDown() public pure returns (uint) {
        uint i = 5;
        uint sum = 0;
        while (i > 0) {
            sum += i;
            i--;
        }
        return sum;
    }

    function countUp() public pure returns (uint) {
        uint sum = 0;
        for (uint256 i = 0; i <= 5; i++) {
            sum += i;
        }
        return sum;
    }
}
