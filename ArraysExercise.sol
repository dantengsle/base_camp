// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

contract ArraysExercise {
    uint[] public numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
    address[] public sender;
    uint[] public timestamps;
    uint public constant Y2K = 946702800; // Constant representing the Unix timestamp for the year 2000


    // Write a function called getNumbers that returns the entire numbers array.
    function getNumbers() external view returns(uint[] memory) {
        uint[] memory result = new uint[](numbers.length);

        for (uint i = 0; i < numbers.length; i++) {
            result[i] = numbers[i];
        }

        return result;
    }

    //  resets the numbers array to its initial value, holding the numbers from 1-10.
    function resetNumbers() public {
        numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
    }

    function appendToNumbers(uint[] calldata _toAppend) public {
        for (uint i = 0; i < _toAppend.length; i++) {
            numbers.push(_toAppend[i]);
        }
    }

    function saveTimestamp(uint _unixTimestamp) external {
        sender.push(msg.sender);
        timestamps.push(_unixTimestamp);
    }

    function afterY2K() public view returns(uint[] memory, address[] memory) {
        uint counter = 0;
        for (uint i = 0; i < timestamps.length; i++) {
            if (timestamps[i] > Y2K) {
                counter++;
            }
        }
        address[] memory senderAfterY2k = new address[](counter);
        uint[] memory timestampsAfterY2k = new uint[](counter);
        uint index = 0;

        for (uint i = 0; i < timestamps.length; i++) {
            if (timestamps[i] > Y2K) {
                senderAfterY2k[index] = sender[i];
                timestampsAfterY2k[index] = timestamps[i];
                index++;
            }
        }

        return (timestampsAfterY2k, senderAfterY2k);
    }

    function resetSenders() public {
        delete sender;
    }

    function resetTimestamps() public {
        delete timestamps;
    }
}