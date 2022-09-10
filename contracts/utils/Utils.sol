// SPDX-License-Identifier: MIT
pragma solidity 0.8.17;
contract Utils{
    function compareStrings(string memory _s1, string memory _s2) public pure returns(bool areEual){
        return keccak256(abi.encodePacked(_s1)) == keccak256(abi.encodePacked(_s2));
    }
}