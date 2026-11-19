// SPDX-License-Identifier: MIT
pragma solidity ^0.8.21;

contract Product {
    uint public pid;
    uint public price;
    uint public stock;
    string public pname;

    constructor(uint _pid, uint _price, uint _stock, string memory _pname) {
        pid = _pid;
        price = _price;
        stock = _stock;
        pname = _pname;
    }
}

contract OnlineStore is Product {
    address payable public owner;

    constructor(uint _pid, uint _price, uint _stock, string memory _pname)
        Product(_pid, _price, _stock, _pname)
    {
        owner = payable(msg.sender);
    }

    function purchase() public payable {
        require(stock > 0, "Out of stock");
        require(msg.value == price, "Send exact price");
        stock--;
        owner.transfer(msg.value);
    }
}
