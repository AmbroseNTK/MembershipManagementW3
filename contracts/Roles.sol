// SPDX-License-Identifier: MIT
pragma solidity ^0.8.6;

contract Roleable {
    address public owner;

    mapping(address => bool) public admins;
    mapping(address => bool) public managers;

    constructor() {
        owner = msg.sender;
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "Only owner can call this function");
        _;
    }

    modifier onlyAdmin() {
        require(admins[msg.sender], "Only admin can call this function");
        _;
    }

    modifier onlyManager() {
        require(managers[msg.sender], "Only manager can call this function");
        _;
    }

    modifier onlyOwnerOrAdmin() {
        require(
            msg.sender == owner || admins[msg.sender],
            "Only owner or admin can call this function"
        );
        _;
    }

    function transferOwnership(address _newOwner) public onlyOwner {
        owner = _newOwner;
    }

    function addAdmin(address _admin) public onlyOwner {
        admins[_admin] = true;
    }

    function removeAdmin(address _admin) public onlyOwner {
        admins[_admin] = false;
    }

    function addManager(address _manager) public onlyOwnerOrAdmin {
        managers[_manager] = true;
    }

    function removeManager(address _manager) public onlyOwnerOrAdmin {
        managers[_manager] = false;
    }
}
