# ItemRedeemToken Smart Contract 

## Description

The `ItemRedeemToken` smart contract is an Ethereum-based ERC-20 token that allows users to mint, transfer, burn tokens, and redeem various products using their token balance. The contract is implemented in Solidity and utilizes the OpenZeppelin library for ERC-20 functionality.

## Features

### ERC-20 Token

- The contract extends the ERC-20 standard, providing basic token functionalities such as transfer, minting, and burning.

### Product Redemption

- Users can redeem products by spending a specified amount of tokens. Each product has a unique identifier, a name, and a corresponding token cost.

### Ownership

- The contract includes an ownership mechanism, allowing the owner to mint new tokens.

### Product Information

- Sample products are added during contract deployment, and additional products can be added by the contract owner.

### Contract Interactions

- **Mint Tokens:**
  - `mint(address account, uint256 amount)`: Allows the contract owner to mint a specified amount of tokens and assign them to a specific account.

- **Burn Tokens:**
  - `burn(uint256 amount)`: Allows users to burn a specified amount of their own tokens.

- **Transfer Tokens:**
  - `transferTokens(address recipient, uint256 amount)`: Allows users to transfer tokens to another address.

- **Redeem Product:**
  - `redeemProduct(uint256 productId)`: Allows users to redeem a product by providing the product ID. The required tokens will be burned, and the user's redemption count will be incremented.

- **Check Token Balance:**
  - `userBalance()`: Returns the token balance of the caller.

- **Check Redeemed Products Count:**
  - `redeemedProductsCount()`: Returns the number of products redeemed by the caller.

## Example Usage

1. Deploy the contract to the Ethereum network.
2. Mint tokens to your address using the `mint` function.
3. Transfer tokens to other addresses using the `transferTokens` function.
4. Burn tokens using the `burn` function.
5. Redeem products by calling the `redeemProduct` function with the appropriate product ID.

## Security Considerations

- Ensure that only trusted entities have ownership of the contract.
- Validate and test all contract functionalities thoroughly before deploying to a live network.
- Consider additional security measures such as access control and input validation.


## Author

Mahesh

Maheshzabade24@gmail.com
## License

This smart contract is licensed under the MIT License. See the [LICENSE](./LICENSE) file for details.

