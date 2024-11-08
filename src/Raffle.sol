pragma solidity ^0.8.18;

error Raffle_NotEnoughEthSent();

contract Raffle {
    address payable[] private s_players;
    uint256 private immutable i_entranceFee;

    event EnteredRaffle(address indexed player);

    constructor(uint256 entranceFee) {
        i_entranceFee = entranceFee;
    }

    function enterRaffle() public payable {
        if ( msg.value < i_entranceFee ) revert Raffle_NotEnoughEthSent();
        s_players.push(payable(msg.sender));
        emit EnteredRaffle(msg.sender);
    }

    function pickWinner() public {}

    function getEntranceFee() public view returns (uint256) {
        return i_entranceFee;
    }
}
