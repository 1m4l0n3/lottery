# Lottery Smart Contract (Raffle)

This repository contains a smart contract implementation for a decentralized lottery system (Raffle) on the Ethereum blockchain. The contract uses Chainlink VRF (Verifiable Random Function) for generating a provably fair and tamper-proof random winner. It also integrates Chainlink Automation to handle periodic tasks such as selecting a winner.

## What is a Lottery (Raffle)?

A lottery, or raffle, is a game of chance where participants contribute funds for an opportunity to win the collected pool. In this smart contract:
- Participants can enter the lottery by sending a specified amount of Ether.
- After a defined interval, the contract automatically selects a random winner from the participants using Chainlink VRF.
- The entire Ether balance of the contract is transferred to the winner.

## Key Features

- **Decentralized Randomness**: Ensures fairness using Chainlink VRF for selecting the winner.
- **Automated Execution**: Uses Chainlink Automation to trigger the winner selection process at regular intervals.
- **Player Management**: Maintains a list of participants and resets it after each round.
- **Security**: Protects against common vulnerabilities like reentrancy.

## Usage

### Build

```shell
$ forge build
```

### Test

```shell
$ forge test
```

### Format

```shell
$ forge fmt
```

### Gas Snapshots

```shell
$ forge snapshot
```

### Anvil

```shell
$ anvil
```

### Deploy

```shell
$ forge script script/Counter.s.sol:CounterScript --rpc-url <your_rpc_url> --private-key <your_private_key>
```

### Cast

```shell
$ cast <subcommand>
```

### Help

```shell
$ forge --help
$ anvil --help
$ cast --help
```
