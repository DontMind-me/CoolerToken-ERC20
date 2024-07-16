//SPDX-License-Identifier: MIT

pragma solidity ^0.8.18;

contract CoolToken {

    mapping(address => uint256) private s_balance;

    function name() public pure returns(string memory) {
        return "Cool Token";
    }

    function symbol() public pure returns(string memory) {
        return "COT";
    }

    function decimals() public pure  returns(uint8) {
        return 18;
    }

    function totalSupply() public pure returns(uint256) {
        return 100 ether;
    }

    function balanceOf(address _owner) public view returns(uint256) {
        return s_balance[_owner];
    }

    function transfer(address _to, uint256 amount) public {
        uint256 previousBalance = balanceOf(msg.sender) + balanceOf(_to);
        s_balance[msg.sender] = balanceOf(msg.sender) - amount;
        s_balance[_to] = balanceOf(_to) - amount;
        require(previousBalance == balanceOf(_to) + balanceOf(msg.sender));

    }



}