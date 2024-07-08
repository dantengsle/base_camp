// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

contract EmployeeStorage {
    uint16 private shares;
    uint32 private salary;
    uint public idNumber;
    string public name;

    constructor(uint16 _shares, string memory _name, uint32 _salary, uint _idNumber) {
        shares = _shares;
        name = _name;
        salary = _salary;
        idNumber = _idNumber;
    }

    function viewSalary() public view returns (uint32) {
        return salary;
    }
    function viewShares() public view returns (uint16) {
        return shares;
    }

    // Custom error declaration
    error TooManyShares(uint16 _shares);

    function grantShares(uint16 _newShares) public {
        if (_newShares > 5000) {
            revert("Too many shares");
        } else if (shares + _newShares > 5000) {
            revert TooManyShares(shares + _newShares);
        }

        shares += _newShares;
    }

    // Function used for testing packing of storage variables (not relevant to main functionality)
    function checkForPacking(uint _slot) public view returns (uint r) {
        assembly {
            r := sload (_slot)
        }
    }

    /**
    * Warning: Anyone can use this function at any time!
    */
    // Function to reset shares for debugging purposes (not relevant to main functionality)
    function debugResetShares() public {
        shares = 1000;
    }
}