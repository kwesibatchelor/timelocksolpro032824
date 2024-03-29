// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract Lock {
    // address owner; slot #0
    // address unlockTime; slot #1
    address public owner;
    uint256 public unlockTime;
    constructor (address _owner, uint256 _unlockTime) payable {
        owner = _owner;
        unlockTime = _unlockTime;
    }

    // dev withdraw function once timestamp has passed unlock time
    receive() external payable {
        if (block.timestamp > unlockTime) {
            address payable recipient = payable(owner);
            recipient.transfer(address(this).balance);
        }
    }
}