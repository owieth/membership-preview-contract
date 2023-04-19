# Contracts

## Local Setup

## Deployed Contracts

| Contract      | Network | Contract address |
| ------------- | ------- | ---------------- |
| SwissDAOMembership    |  goerli   | https://goerli.etherscan.io/address/0x9b10a4de9b1bcdfe0c681024e74e7f3986cc8d2a |
| SwissDAOMembership    |  sepolia   | https://sepolia.etherscan.io/address/0x5870c3f8FE6605Fb43C8D63Cc31CB2B64cdb0C0E |

### Deploy contracts

```shell
# To give our shell access to our environment variables
source .env
# To deploy and verify our contract
forge script script/<scriptname>.s.sol:<contractname> --rpc-url goerli || mainnet --broadcast

# concatenate the following if you want to verify the contract
# --verify -vvvvv

```

### Test contracts

Using foundry

```shell
forge test
# for more details, logging with emit, add verbosity 1 up to 5 v's
forge test -vvvv
```

### Local Blockchain with Anvil (Foundry)

Set up a local blockchain like this

```shell
# set up fresh local blockchain
anvil

# if you want to fork an existing blockchain, because you need to interact with existing contracts, e.g on goerli testnet
anvil -f https://eth-goerli.g.alchemy.com/v2/<your_api_keys>
```