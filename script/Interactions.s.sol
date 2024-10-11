// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

import {DeployBasicNft} from "./DeployBasicNft.s.sol";
import {Script} from "forge-std/Script.sol";
import {BasicNft} from "src/BasicNft.sol";
import {DevOpsTools} from "@foundry-devops/DevOpsTools.sol";

contract MintBasicNft is Script {
    /** Patrics public example */ 
    string public constant PATRICK_PUB_URL ="ipfs://bafybeig37ioir76s7mg5oobetncojcm3c3hxasyd4rvid4jqhy4gkaheg4/?filename=0-PUG.json";

    /** Using IPFS locally and publishing my file */
    // string public constant LOCALHOST_URL = "http://bafybeie5venjwpgkqpthezwtyrm7bqm5wzkiukcvqdyftd4behdamkw3re.ipfs.localhost:8080/";

    // string public constant LOCAL_URL = "ipfs://QmYx6GsYAKnNzZ9A6NvEKV9nf1VaDzJrqDR23Y8YSkebLU";

    string public constant PUB_URL = "https://ipfs.io/ipns/k51qzi5uqu5dmiksejmrq7vpjh6ffcvurdee1mm4lmfz3fseodh4vlt7e8hb2x";
    
    function run() external {
        address mostRecentlyDeployedContract = DevOpsTools
            .get_most_recent_deployment("BasicNft", block.chainid);
    mintNftOnContract(mostRecentlyDeployedContract);
    }

    function mintNftOnContract(address contractAddress) public {

        vm.startBroadcast();
        BasicNft(contractAddress).mintNft(PATRICK_PUB_URL);
        vm.stopBroadcast();
    }
}

