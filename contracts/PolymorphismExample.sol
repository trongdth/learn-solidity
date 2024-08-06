// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.24;

// Base contract
contract PolymorphismAnimal {
    function play() public pure virtual returns (string memory) {
        return "...";
    }

    function play(
        string memory game
    ) public pure virtual returns (string memory) {
        return game;
    }

    function sound() public pure virtual returns (string memory) {
        return "Some sound";
    }
}

// Derived contract
contract PolymorphismDog is PolymorphismAnimal {
    function sound() public pure override returns (string memory) {
        return "Barking";
    }
}

// Derived contract
contract PolymorphismCat is PolymorphismAnimal {
    function sound() public pure override returns (string memory) {
        return "Meowing";
    }
}

// Derived contract
contract PolymorphismBird is PolymorphismAnimal {
    function sound() public pure override returns (string memory) {
        return "Chirping";
    }
}
