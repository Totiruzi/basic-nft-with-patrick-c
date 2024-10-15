// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

import {Script, console2} from "forge-std/Script.sol";
import {MoodNft} from "src/MoodNft.sol";
import {Base64} from "@openzeppelin/contracts/utils/Base64.sol";

contract DeployMoodNft is Script {

    MoodNft moodNft;
    function run() external returns (MoodNft) {
        string memory happySvg = vm.readFile("img/happy.svg");
        string memory sadSvg = vm.readFile("img/sad.svg");
        console2.log(happySvg);

        vm.startBroadcast();
        moodNft = new MoodNft(svgToImageUri(happySvg), svgToImageUri(sadSvg));
        vm.stopBroadcast();

        return moodNft;
    }

    function svgToImageUri (string memory svg) public pure returns (string memory) {
        // Encoding the svg to a string using base64
        string memory baseURL = "data:image/svg+xml;base64,";
        string memory svgBase64Encoded = Base64.encode(
            bytes(string(abi.encodePacked(svg)))
        );

        return string(abi.encodePacked(baseURL, svgBase64Encoded));
    }
}