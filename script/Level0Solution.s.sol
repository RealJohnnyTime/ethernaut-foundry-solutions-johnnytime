// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/Level0.sol";
import "forge-std/Script.sol";
import "forge-std/console.sol";

contract Level0Solution is Script {
    
    Level0 public level0 = Level0(0xD6aed426603094B3772a4a16a7F055A46eD109aE);

    function run() external {
        console.log("Password: ", level0.password());
        vm.startBroadcast(vm.envUint("PRIVATE_KEY"));
        level0.authenticate(level0.password()); //call authenticate function with the password
        vm.stopBroadcast();
    }

}