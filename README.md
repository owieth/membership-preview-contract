# Contracts

## Local Setup

## Deployed Contracts

| Contract      | Network | Contract address |
| ------------- | ------- | ---------------- |
| SwissDAOMembership    |  goerli   | https://goerli.etherscan.io/address/0xa05d615ce35beaa61dfe87d05007f2220c3ffecf |
| SwissDAOMembership    |  sepolia   | https://sepolia.etherscan.io/address/0x1e8A9a06c42621881DCaCFAa6F6e4b5274fe3F5b |

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