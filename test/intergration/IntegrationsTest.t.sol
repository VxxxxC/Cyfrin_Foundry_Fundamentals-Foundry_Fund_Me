// SPDX-License-Identifier: MIT

pragma solidity ^0.8.19;

import {Test, console} from "lib/forge-std/src/Test.sol";
import {FundMe} from "../../src/FundMe.sol";
import {DeployFundMe} from "../../script/DeployFundMe.s.sol";
import {FundFundMe, WithdrawFundMe} from "../../script/Interactions.s.sol";

contract IntegrationTest is Test {
    FundMe fundMe;

    address USER = makeAddr("user");
    uint256 constant SEND_VALUE = 0.1 ether;
    uint256 constant INIT_VALUE = 10 ether;
    uint256 constant GAS_PRICE = 1 gwei;

    function setUp() external {
        DeployFundMe deploy = new DeployFundMe();
        fundMe = deploy.run();
        vm.deal(USER, INIT_VALUE); // give USER 10 ETH
    }

    function testUserCanFundInteractions() external {
        FundFundMe Fund_FundMe = new FundFundMe();
        Fund_FundMe.fundFundMe(address(fundMe));

        WithdrawFundMe Withdraw_FundMe = new WithdrawFundMe();
        Withdraw_FundMe.withdrawFundMe(address(fundMe));

        assert(address(fundMe).balance == 0);
    }
}
