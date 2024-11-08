pragma solidity ^0.8.18;

error Raffle_NotEnoughEthSent();

contract Raffle {
    uint256 private immutable i_entranceFee;

    constructor(uint256 entranceFee) {
        i_entranceFee = entranceFee;
    }

    function enterRaffle() public payable {
        if ( msg.value < i_entranceFee ) revert Raffle_NotEnoughEthSent();
    }

    function pickWinner() public {}

    function getEntranceFee() public view returns (uint256) {
        return i_entranceFee;
    }
}
