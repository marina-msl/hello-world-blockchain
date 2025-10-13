// // SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

import {Test} from "forge-std/Test.sol";
import "../src/BankToken.sol";
import  "@openzeppelin/contracts/token/ERC20/IERC20.sol";

// Arrange, Act, Assert

interface CheatCodes {
    function startPrank(address) external;
    function stopPrank() external;
    function expectRevert(bytes calldata) external;
}

contract BankTokenTest is Test {
    BankToken private token;
    CheatCodes cheats = CheatCodes(VM_ADDRESS);

    address defaultOwner = address(0xABCD);
    address notAuthorizedMinter = address(3);
    uint256 initialSupply = 1000 * 1e18;

    function setUp() public {
        cheats.startPrank(defaultOwner);
        token = new BankToken(defaultOwner, initialSupply);
        cheats.stopPrank(); 
    }

    function testInitialSetup() public view {
        assertEq(token.owner(), defaultOwner, "Owner should be the one defined in the contract");
        assertEq(token.totalSupply(), initialSupply, "Initial supply should be the one initialized in the contract");
    }

}
