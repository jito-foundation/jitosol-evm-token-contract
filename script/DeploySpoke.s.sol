// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Script, console} from "forge-std/Script.sol";
import "../src/SpokeToken.sol";

contract DeploySpoke is Script {
    function setUp() public {}

    function run() public {
        uint256 deployerPrivateKey = vm.envUint("PRIVATE_KEY");
        address ntt_manager = address(0);
        address owner = 0x8255352322c301c076cB2E2a1C63772ffa0ba829;
        vm.startBroadcast(deployerPrivateKey);

        SpokeToken t = new SpokeToken(
            "Jito Staked SOL",
            "JitoSOL",
            ntt_manager,
            owner
        );

        vm.stopBroadcast();
    }
}

contract SetSpokeMinter is Script {
    function setUp() public {}

    function run() public {
        uint256 deployerPrivateKey = vm.envUint("PRIVATE_KEY");
        address tokenAddr = 0x83e1d2310Ade410676B1733d16e89f91822FD5c3;
        address minterAddr = 0x02f5FB92F3794C535b1523183A417fB9efbB4f5d;

        vm.startBroadcast(deployerPrivateKey);

        // setMinter to the Manager proxy on the spoke chain
        SpokeToken t = SpokeToken(tokenAddr);
        t.setMinter(minterAddr);

        vm.stopBroadcast();
    }
}
