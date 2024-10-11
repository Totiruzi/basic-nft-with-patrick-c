// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

import {Test, console2} from "forge-std/Test.sol";
import {DeployBasicNft} from "script/DeployBasicNft.s.sol";
import {BasicNft} from "src/BasicNft.sol";

contract BasicNftTest is Test {
    DeployBasicNft deployer;
    BasicNft basicNft;
    address USER = makeAddr("USER");

    /** Patrics public example */ 
    string public constant PATRICK_PUB_URL ="ipfs://bafybeig37ioir76s7mg5oobetncojcm3c3hxasyd4rvid4jqhy4gkaheg4/?filename=0-PUG.json";

    /** Using IPFS locally and publishing my file */
    // string public constant LOCALHOST_URL = "http://bafybeie5venjwpgkqpthezwtyrm7bqm5wzkiukcvqdyftd4behdamkw3re.ipfs.localhost:8080/";

    // string public constant LOCAL_URL = "ipfs://QmYx6GsYAKnNzZ9A6NvEKV9nf1VaDzJrqDR23Y8YSkebLU";

    string public constant PUB_URL = "https://ipfs.io/ipns/k51qzi5uqu5dmiksejmrq7vpjh6ffcvurdee1mm4lmfz3fseodh4vlt7e8hb2x";

    

    function setUp() public {
        deployer = new DeployBasicNft();
        basicNft = deployer.run();
    }

    function testNameIsCorrect() public view {
        string memory expectedName = "Dogie";
        string memory actuallName = basicNft.name();

        assert(
            keccak256(abi.encodePacked(expectedName)) ==
                keccak256(abi.encodePacked(actuallName))
        );
    }

    function testCanMintAndHasBalance() public {
        vm.prank(USER);
        basicNft.mintNft(PATRICK_PUB_URL);
        // basicNft.mintNft(PUB_URL);

        assert(basicNft.balanceOf(USER) == 1);
         assert(
            keccak256(abi.encodePacked(PATRICK_PUB_URL)) ==
                keccak256(abi.encodePacked(basicNft.tokenURI(0)))
        );

        // assert(
        //     keccak256(abi.encodePacked(PUB_URL)) ==
        //         keccak256(abi.encodePacked(basicNft.tokenURI(0)))
        // );
    }
}
