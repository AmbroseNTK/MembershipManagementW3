// SPDX-License-Identifier: MIT
pragma solidity ^0.8.6;

import "./Roles.sol";

contract Gift is Roleable {
    struct GiftData {
        string id;
        address sender;
        uint256 amount;
        uint256 timestamp;
        string name;
        string description;
        string link;
        uint256 price;
    }

    mapping(string => GiftData) public gifts;

    constructor() {
        owner = msg.sender;
    }

    function createGift(
        string memory _id,
        uint256 _amount,
        string memory _name,
        string memory _description,
        string memory _link,
        uint256 _price
    ) public onlyOwnerOrAdmin {
        gifts[_id] = GiftData({
            id: _id,
            sender: msg.sender,
            amount: _amount,
            timestamp: block.timestamp,
            name: _name,
            description: _description,
            link: _link,
            price: _price
        });
    }

    function getGift(string memory _id) public view returns (GiftData memory) {
        return gifts[_id];
    }
}
