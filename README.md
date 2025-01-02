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

## Contract Details

### Main Functions

1. **`enterRaffle()`**
    - Allows a user to enter the lottery by paying the entrance fee.
    - Adds the sender's address to the list of participants.
    - Emits an `EnteredRaffle` event.

   **Reverts**:
    - `Raffle__NotEnoughEthSent`: If the user sends less than the entrance fee.
    - `Raffle__NotOpen`: If the lottery is not in the "OPEN" state.


2. **`checkUpkeep(bytes memory)`**
    - Checks if the conditions to pick a winner are met.
    - Returns `upkeepNeeded` as `true` if:
        - The lottery is open.
        - The set time interval has passed.
        - There are participants in the lottery.
        - The contract has a positive balance.


3. **`performUpkeep(bytes calldata)`**
    - Called by Chainlink Automation to start the winner selection process.
    - Requests a random number from Chainlink VRF.
    - Changes the lottery state to "CALCULATING".

   **Reverts**:
    - `Raffle__UpkeepNotNeeded`: If the upkeep conditions are not met.


4. **`fulfillRandomWords(uint256, uint256[] calldata)`**
    - Internal function called by Chainlink VRF to deliver the random number.
    - Selects a winner using the random number.
    - Transfers the contract's balance to the winner.
    - Resets the lottery for the next round.
    - Emits a `PickedWinner` event.

   **Reverts**:
    - `Raffle__TransferFailed`: If the transfer to the winner fails.


5. **`getEntranceFee()`**
    - Returns the entrance fee required to join the lottery.

### Events

- **`EnteredRaffle(address indexed player)`**: Emitted when a player enters the lottery.
- **`PickedWinner(address indexed winner)`**: Emitted when a winner is selected.


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
