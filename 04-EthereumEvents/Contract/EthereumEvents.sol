pragma solidity ^0.4.23;

contract EthereumEvents {

    event event_Transfer(
        address indexed AddressFrom,
        address indexed AddressTo,
		uint indexed Amount,
		uint TransTimeStamp
    );
    
    function TransferEther(address ToAddress) public payable 
    {
        require(msg.value >= 100, "minimum transfer condition not met");
        ToAddress.transfer(msg.value);
		emit event_Transfer(msg.sender, ToAddress, msg.value, block.timestamp);
    }

}
