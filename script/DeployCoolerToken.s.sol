//SPDX-License-Identifier: MIT

pragma solidity ^0.8.18;

import {Script} from "forge-std/Script.sol";
import {CoolerToken} from "../src/CoolerToken.sol";

contract DeployCoolerToken is Script {

    uint256 public constant INITIAL_SUPPLY = 1000 ether;

    function run() external returns(CoolerToken){
        vm.startBroadcast();
        CoolerToken ct = new CoolerToken(INITIAL_SUPPLY);
        vm.stopBroadcast();

        return ct;
    }

}