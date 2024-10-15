// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

import {Test, console2} from "forge-std/Test.sol";
import {MoodNft} from "src/MoodNft.sol";
import {DeployMoodNft} from "script/DeployMoodNft.s.sol";

contract DeployMoodNftTest is Test {
    MoodNft moodNft;
    DeployMoodNft public deployer;

    function setUp() public {
        deployer = new DeployMoodNft();
    }

    function testConvertSvgToUri() public view {
        string memory expectedUri = "data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSI1MDAiIGhlaWdodD0iNTAwIj48dGV4dCB4PSIxMCIgeT0iMjAiIGZpbGw9ImdyZWVuIj5IaSEgWW91IGNhbiBzZWUgdGhpcyBpbiB5b3VyIGJyb3dzZXIgPzwvdGV4dD48L3N2Zz4=";
        
        string memory svg = '<svg xmlns="http://www.w3.org/2000/svg" width="500" height="500"><text x="10" y="20" fill="green">Hi! You can see this in your browser ?</text></svg>';

        string memory convertedUri = deployer.svgToImageUri(svg);

        console2.log(expectedUri);

        console2.log(convertedUri);

        // comparing 2 string we have to use keccak256(abi.encodePacked(stringToCompare)) 

        assert(keccak256(abi.encodePacked(convertedUri)) == keccak256(abi.encodePacked(expectedUri)));
    }
}