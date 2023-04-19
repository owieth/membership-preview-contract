// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import "forge-std/Script.sol";
import {SwissDAOMembership} from "../src/SwissDAOMembership.sol";

contract SwissDAOMembershipScript is Script {
    function setUp() public {}

    function run() public {
        uint256 deployerPrivateKey = vm.envUint("PRIVATE_KEY");
        vm.startBroadcast(deployerPrivateKey);

        SwissDAOMembership membership = new SwissDAOMembership(
            "https://membership-preview.vercel.app/"
        );
        membership.safeMint();

        vm.stopBroadcast();
    }
}
