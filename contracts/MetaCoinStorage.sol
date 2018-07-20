pragma solidity ^0.4.17;

contract MetaCoinStorage {

    mapping(address => uint) balances;

    mapping(address => bool) accessAllowed;

    constructor() public {
        accessAllowed[msg.sender] = true;
        balances[msg.sender] = 10000;
    }

    modifier platform() {
        require(accessAllowed[msg.sender] == true);
        _;
    }

    function allowAccess(address _address) platform public {
        accessAllowed[_address] = true;
    }

    function denyAccess(address _address) platform public {
        accessAllowed[_address] = false;
    }


    function getBalance(address _address) public view returns(uint) {
        return balances[_address];
    }

    function setBalance(address _address, uint _balance) platform public {
        balances[_address] = _balance;
    }

}