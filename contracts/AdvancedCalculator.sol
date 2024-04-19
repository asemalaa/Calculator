
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// Define a library for basic arithmetic operations
library SafeMath {
    // Safe addition function
    function add(int a, int b) internal pure returns (int c) {
        c = a + b;
        require(c >= a, "Addition Overflow");
    }

    // Safe subtraction function
    function sub(int a, int b) internal pure returns (int c) {
        require(b <= a, "Subtraction Overflow");
        c = a - b;
    }

    // Safe multiplication function
    function mul(int a, int b) internal pure returns (int c) {
        if (a == 0 || b == 0) {
            return 0;
        }
        c = a * b;
        require(c / a == b, "Multiplication Overflow");
    }

    // Safe division function
    function div(int a, int b) internal pure returns (int) {
        require(b > 0, "Division by zero");
        return a / b;
    }
}

contract AdvancedCalculator {
    using SafeMath for int;

    address public owner;

    constructor() {
        owner = msg.sender;
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "Unauthorized: Caller is not the owner");
        _;
    }

    // Using the SafeMath library functions
    function add(int a, int b) public pure returns (int) {
        return a.add(b);
    }

    function subtract(int a, int b) public pure returns (int) {
        return a.sub(b);
    }

    function multiply(int a, int b) public pure returns (int) {
        return a.mul(b);
    }

    function divide(int a, int b) public pure returns (int) {
        return a.div(b);
    }

    // An example of a function that uses the onlyOwner modifier
    function resetCalculator() public onlyOwner {
        // reset logic for owner only
    }
}
