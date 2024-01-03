// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/Privacy.sol";
import "forge-std/Script.sol";
import "forge-std/console.sol";

contract PrivacySolution is Script {

    Privacy public privacyInstance = Privacy(0xAc9ba5e72a1aFBF7bc9D1662050Ac2825D9a5E49);

    function run() external {
        vm.startBroadcast(vm.envUint("PRIVATE_KEY"));
        bytes32 key = 0xd50db3040ce1877e68692940feed74c93e0e63573d895ad4542fb1de128b3713;
        console.log("Before: ", privacyInstance.locked());
        privacyInstance.unlock(bytes16(key));
        console.log("After: ", privacyInstance.locked());
        vm.stopBroadcast();
    }
}