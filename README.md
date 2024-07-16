# CoolerToken

CoolerToken is an ER20 Token built using solidity and the OpenZeppelin library. The Projects includes the code for the Smart Contract, A deploy Script and a set of tests written using the foundry framework.

## Introduction

CoolerToken is an ERC20 token with basic functionalities such as minting an initial supply of tokens, transferring tokens, and handling allowances.

## Prerequisites

To work on this project, you need the following tools installed:
- [Foundry](https://getfoundry.sh/) (for testing and deploying smart contracts)

## Installation 

1. **Clone the repository**:
   ```bash
   git clone https://github.com/DontMind-me/CoolerToken-ERC20
   cd coolertoken
   ```

## Installs

To interact with the contract, you will have to download the following packages.

```
forge install openzeppelin/openzeppelin-contracts@v5.0.2 --no-commit
```

```
forge install cyfrin/foundry-devops@0.2.2 --no-commit
```

## Commands

#### Build

```shell
$ forge build
```

#### Test

```shell
$ forge test
```

#### Gas Snapshots

```shell
$ forge snapshot
```

#### Anvil

```shell
$ anvil
```

#### Deploy

```shell
$ forge create src/CoolerToken.sol:CoolerToken --rpc-url http://localhost:8545 --private-key $(DEFAULT_ANVIL_KEY) --broadcast
```
------------------------------------
## THANK YOU FOR VISITING MY PROJECT!!