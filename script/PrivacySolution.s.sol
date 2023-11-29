// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/Privacy.sol";
import "forge-std/Script.sol";
import "forge-std/console.sol";

contract PrivacySolution is Script {

    Privacy public privacyInstance = Privacy(0xDC7B775cCA5162DA49D400D3aAff7f77bAbCF1aD);

    function run() external {
        vm.startBroadcast(vm.envUint("PRIVATE_KEY"));
        bytes32 key = 0x8d07fb18a1848c8a4c8f2110b3b873d58f712f2b833bb3b7251a6ba6c93db4af;
        console.log("Before: ", privacyInstance.locked());
        privacyInstance.unlock(bytes16(key));
        console.log("After: ", privacyInstance.locked());
        vm.stopBroadcast();
    }
}