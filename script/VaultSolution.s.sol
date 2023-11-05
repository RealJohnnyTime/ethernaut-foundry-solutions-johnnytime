// SPDX-License-Identifier: MIT
pragma solidity 0.8.0;

import "../src/Vault.sol";
import "forge-std/Script.sol";
import "forge-std/console.sol";

contract VaultSolution is Script {

    Vault public vaultInstance = Vault(0xE4f2D394944128AF7124E1581a1Db15bfA048FC3);

    function run() external {
        vm.startBroadcast(vm.envUint("PRIVATE_KEY"));
        vaultInstance.unlock(0x412076657279207374726f6e67207365637265742070617373776f7264203a29);
        vm.stopBroadcast();
    }
}