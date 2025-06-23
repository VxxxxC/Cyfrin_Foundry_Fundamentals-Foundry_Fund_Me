// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Script, console} from "lib/forge-std/src/Script.sol";
import {HelperConfig} from "./HelperConfig.s.sol";
import {FundMe} from "../src/FundMe.sol";

contract DeployFundMe is Script {
    function deployFundMe() public returns (FundMe) {
        // This is the address of the ETH/USD price feed on Sepolia
        HelperConfig helperConfig = new HelperConfig();

        vm.startBroadcast();
        FundMe fundMe = new FundMe(helperConfig.localNetworkConfig());
        vm.stopBroadcast();
        return fundMe;
    }

    function run() external returns (FundMe) {
        return deployFundMe();
    }
}
