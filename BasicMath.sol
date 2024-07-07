// SPDX-License-Identifier: MIT
pragma solidity  ^0.8.17;

contract BasicMath {
    uint constant uintMax = type(uint).max;

    /*
    Adder
    A function called adder. It must:

    Accept two uint arguments, called _a and _b
    Return a uint sum and a bool error
    If _a + _b do not overflow, it should return the sum and an error of false
    If _a + _b overflow, it should return 0 as the sum, and an error of true
    */
    function adder(uint _a, uint _b) external pure returns (uint sum, bool error) {
        //  if (_b > MAX_INT - _a) {
        if (_b > uintMax - _a) {
            // overflow
            return (0, true);
        }
        // else
        return (_a + _b, false);
    }

    /*
    Subtractor

    A function called subtractor. It must:
    Accept two uint arguments, called _a and _b
    Return a uint difference and a bool error

    If _a - _b does not underflow, it should return the difference and an error of false
    If _a - _b underflows, it should return 0 as the difference, and an error of true
    */
    function subtractor(uint _a, uint _b) external pure returns(uint difference, bool error) {
        // underflow
        if (_b > _a) {
            return (0, true);
        }

        // not underflow
        return (_a - _b, false);
    }
}
