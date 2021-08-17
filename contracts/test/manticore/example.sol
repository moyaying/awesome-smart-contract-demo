//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.3;

contract Simple {
    function f(uint256 a) public payable {
        if (a == 65) {
            revert();
        }
    }
}
