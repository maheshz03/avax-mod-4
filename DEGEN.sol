// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Burnable.sol";
import "hardhat/console.sol";

contract ItemRedeemToken is ERC20, Ownable, ERC20Burnable {
    event LogMessage(string message);

    struct Product {
        string productName;
        uint256 tokenCost;
    }

    mapping(uint256 => Product) public products;
    mapping(address => uint256) public redeemed;

    constructor() ERC20("DEGEN", "DGN") Ownable() {
        // Adding sample products
        _addProduct("Smartphone", 800);
        _addProduct("Laptop", 1500);
        _addProduct("Smart TV", 2000);
        _addProduct("Wireless Headphones", 500);
        _addProduct("Gaming Console", 1200);
    }

    function _addProduct(string memory _productName, uint256 _tokenCost) internal {
        uint256 productId = products.length + 1;
        products[productId] = Product(_productName, _tokenCost);
    }

    function mint(address account, uint256 amount) public onlyOwner {
        _mint(account, amount);
    }

    function burn(uint256 amount) public override {
        require(balanceOf(msg.sender) >= amount, "INSUFFICIENT FUNDS!!");
        _burn(msg.sender, amount);
        emit LogMessage("Burned tokens");
    }

    function transferTokens(address recipient, uint256 amount) external {
        require(balanceOf(msg.sender) >= amount, "INSUFFICIENT FUNDS!!");
        _transfer(msg.sender, recipient, amount);
    }

    function redeemProduct(uint256 productId) external payable {
        Product storage product = products[productId];
        require(bytes(product.productName).length > 0, "Product does not exist");
        require(balanceOf(msg.sender) >= product.tokenCost, "INSUFFICIENT FUNDS!!");
        
        _burn(msg.sender, product.tokenCost);
        redeemed[msg.sender]++;
        emit LogMessage("Redeemed product");
    }

    function userBalance() external view returns (uint256) {
        return balanceOf(msg.sender);
    }

    function redeemedProductsCount() external view returns (uint256) {
        return redeemed[msg.sender];
    }
}
