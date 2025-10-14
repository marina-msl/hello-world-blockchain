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

    address defaultOwner = address(1);
    address notAuthorizedMinter = address(3);
    uint256 initialSupply = 1000 * 1e18;
    //to test with another initial supply, uncomment the line below and comment the one above
    // uint256 initialSupply = 1000 * 1e18;


    function setUp() public {
        cheats.startPrank(defaultOwner);
        token = new BankToken(defaultOwner, initialSupply);
        cheats.stopPrank(); 
    }

    function testInitialSetup() public view {
        assertEq(token.owner(), defaultOwner, "Owner should be the one defined in the contract");
        assertEq(token.totalSupply(), initialSupply, "Initial supply should be the same initialized in the contract");
    }

    function testMinting() public {

        //Arrange
        address recipient = address(89);
        uint256 amountToMint = 500 * 1e18;

        //Act
        cheats.startPrank(defaultOwner);
        token.mint(recipient, amountToMint);
        uint256 newBalance = token.balanceOf(recipient);
        uint256 totalSupplyAfterMint = initialSupply + amountToMint;
        cheats.stopPrank();

        assertEq(newBalance, amountToMint , "There's a discrepancy in the recipient's balance");
        assertEq(token.totalSupply(), totalSupplyAfterMint, "Total supply should reflect the minted amount");
    }

    function testTransfer() public {
        //Arrange
        address recipient = address(87);
        uint256 amountToTransfer = 100 * 1e18;

        //Act
        uint256 senderOldBalance = token.balanceOf(defaultOwner);
        uint256 recipientOldBalance = token.balanceOf(recipient);

        cheats.startPrank(defaultOwner);
        token.transfer(recipient, amountToTransfer);
        cheats.stopPrank();

        uint256 senderNewBalance = token.balanceOf(defaultOwner);
        uint256 recipientNewBalance = token.balanceOf(recipient);

        //Assert
        assertEq(senderNewBalance, senderOldBalance - amountToTransfer, "Invalid sender balance");
        assertEq(recipientNewBalance, recipientOldBalance + amountToTransfer,  "Invalid recipient balance");
    }

}
