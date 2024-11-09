pragma solidity ^0.8.18;

error Raffle_NotEnoughEthSent();

contract Raffle {
    address payable[] private s_players;
    uint256 private immutable i_entranceFee;
    uint256 private immutable i_interval;
    uint256 private s_lastTimeStamp;

    event EnteredRaffle(address indexed player);

    constructor(uint256 entranceFee, uint256 interval) {
        i_entranceFee = entranceFee;
        i_interval = interval;
        s_lastTimeStamp = block.timestamp;
    }

    function enterRaffle() public payable {
        if ( msg.value < i_entranceFee ) revert Raffle_NotEnoughEthSent();
        s_players.push(payable(msg.sender));
        emit EnteredRaffle(msg.sender);
    }

    function pickWinner() external view {
        if (block.timestamp - s_lastTimeStamp < i_interval) revert();
    }

    function getEntranceFee() public view returns (uint256) {
        return i_entranceFee;
    }
}
