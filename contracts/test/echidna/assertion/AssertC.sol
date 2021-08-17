//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.3;

contract AssertC {
    TestAssert ta;
    event AssertionFailed(string message);

    constructor() {
        ta = new TestAssert();
    }

    function set0(int256 val) public returns (bool) {
        assert(val % 100 != 0);
    }

    function set1(uint256 val) public {}

    function internal_func(uint256 val) internal {
        if (val > 128) emit AssertionFailed("error");
    }

    function f() public {
        emit AssertionFailed("error");
        revert();
    }

    function internal_assert(uint256 val) public returns (bool) {
        internal_func(val);
    }

    function external_assert(uint256 val) public returns (bool) {
        ta.fail(val);
    }
}

contract TestAssert {
    event AssertionFailed(string message);

    function fail(uint256 val) public {
        if (val > 128) emit AssertionFailed("error");
    }
}
