// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";


contract BankToken is ERC20, Ownable {

    constructor(address initialOwner, uint256 initialSupply) 
        ERC20("BankToken", "BTK") 
        Ownable(initialOwner)
       {
        _mint(msg.sender, 1000 * 10 ** decimals());
    }

    function mint(address to, uint256 amount) public onlyOwner {
        _mint(to, amount);
    }
}   