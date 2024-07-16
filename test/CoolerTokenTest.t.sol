//SPDX-License-Identifier: MIT

pragma solidity ^0.8.18;

import {Test} from "forge-std/Test.sol";
import {DeployCoolerToken} from "../script/DeployCoolerToken.s.sol";
import {CoolerToken} from "../src/CoolerToken.sol";

contract CoolerTokenTest is Test {

    DeployCoolerToken public deployer;
    CoolerToken public coolerToken;

    address boris = makeAddr("boris");
    address anna = makeAddr("anna");
    address charlie = makeAddr("charlie");

    uint256 public constant STARTING_BALANCE = 100 ether;

    function setUp() external {

        deployer = new DeployCoolerToken();
        coolerToken = deployer.run();

        vm.prank(msg.sender);
        coolerToken.transfer(boris, STARTING_BALANCE);

    }

    function testBorisBalance() public {
        assertEq(STARTING_BALANCE, coolerToken.balanceOf(boris));
    }

    function testAllowanceWorks() public {

        uint256 initialAllowance = 100 ether;
        uint256 transferAmount = 50 ether;

        vm.prank(boris);
        coolerToken.approve(anna, initialAllowance);

        vm.prank(anna);
        coolerToken.transferFrom(boris, anna, transferAmount);

        assertEq(coolerToken.balanceOf(boris) , STARTING_BALANCE - transferAmount);
        assertEq(coolerToken.balanceOf(anna), transferAmount);

    }

    function testInitialSupply() public {
        uint256 initialSupply = 1000 ether; // Adjust based on your initial supply
        assertEq(coolerToken.totalSupply(), initialSupply);
    }

    function testAllowance() public {
        uint256 allowanceAmount = 20 ether;

        vm.prank(boris);
        coolerToken.approve(anna, allowanceAmount);

        assertEq(coolerToken.allowance(boris, anna), allowanceAmount);
    }

    function testTransferFromWithoutAllowance() public {
        uint256 transferAmount = 10 ether;

        vm.prank(anna);
        vm.expectRevert();
        coolerToken.transferFrom(boris, charlie, transferAmount);
    }

    function testTransferFromWithAllowance() public {
        uint256 allowanceAmount = 20 ether;
        uint256 transferAmount = 15 ether;

        vm.prank(boris);
        coolerToken.approve(anna, allowanceAmount);

        vm.prank(anna);
        coolerToken.transferFrom(boris, charlie, transferAmount);

        assertEq(coolerToken.balanceOf(boris), STARTING_BALANCE - transferAmount);
        assertEq(coolerToken.balanceOf(charlie), transferAmount);
        assertEq(coolerToken.allowance(boris, anna), allowanceAmount - transferAmount);
    }

    function testZeroTransfer() public {
        uint256 zeroAmount = 0;

        vm.prank(boris);
        coolerToken.transfer(anna, zeroAmount);

        assertEq(coolerToken.balanceOf(boris), STARTING_BALANCE);
        assertEq(coolerToken.balanceOf(anna), zeroAmount);
    }

    function testSelfTransfer() public {
        uint256 transferAmount = 10 ether;

        vm.prank(boris);
        coolerToken.transfer(boris, transferAmount);

        assertEq(coolerToken.balanceOf(boris), STARTING_BALANCE);
    }

    function testTransferExceedingBalance() public {
        uint256 transferAmount = 200 ether;

        vm.prank(boris);
        vm.expectRevert();
        coolerToken.transfer(anna, transferAmount);
    }


}