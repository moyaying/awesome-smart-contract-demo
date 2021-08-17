//SPDX-License-Identifier: MIT License
pragma solidity ^0.8.3;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract MyToken is ERC20, Ownable {
    // uint256 private totalSupply;

    constructor() ERC20("Test Token", "TT") {
        _mint(_msgSender(), 10 * 10**8 * 10**18);
    }

    // constructor(string memory name_, string memory symbol_)
    //     ERC20(name_, symbol_)
    // {
    //     _mint(_msgSender(), 10 * 10**8 * 10**18);
    // }

    function mint(address account, uint256 amount) public onlyOwner {
        _mint(account, amount);
    }

    function burn(uint256 amount) public {
        _burn(_msgSender(), amount);
    }
}
