// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Burnable.sol";
import "hardhat/console.sol";

contract SupplyChainToken is ERC20, ERC20Burnable, Ownable {
    //cap which sets the maximum supply of the token to 50 billion tokens, 
    uint256 private cap = 50_000_000_000 * 10**uint256(18);

    //Sets the token name to "SupplyChainToken" and the symbol to "SCT".
    //Ownable(msg.sender): Sets the contract deployer as the owner.
    constructor() ERC20("SupplyChainToken", "SCT") Ownable(msg.sender) {
        console.log("owner: %s maxcap: %s", msg.sender, cap);
        //Mints the maximum supply of tokens to the owner's address.
        _mint(msg.sender, cap);
    }
    // "mint" refers to the process of creating new tokens or coins and
    // adding them to the total supply. 
    function mint(address to, uint256 amount) public onlyOwner {
        require(
            ERC20.totalSupply() + amount <= cap,
            "SupplyChainToken: cap exceeded"
        );
        _mint(to, amount);
    }
}