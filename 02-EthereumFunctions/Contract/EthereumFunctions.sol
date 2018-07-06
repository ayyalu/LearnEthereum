pragma solidity ^0.4.23;

contract EthereumFunctions {

	address ContractOwner;
	
    constructor() public {
        ContractOwner = msg.sender;
    }
    
    struct User{
		string FirstName;        
		string LastName;
		int MobileNo;
    }

    mapping(string => User[]) UserEmailIDMap;

    function TransferEther(address ToAddress) public payable
    {
        ToAddress.transfer(msg.value);
    }

    function AddUser(string EmailID,string FirstName,string LastName,int MobileNo) public
    {
        UserEmailIDMap[EmailID].push(User(FirstName,LastName,MobileNo));
    }

    function ViewUser(string EmailID) public view returns(string FirstName,string LastName,int MobileNo)
    {
        User memory ThisUser=UserEmailIDMap[EmailID][0];
        return (ThisUser.FirstName, ThisUser.LastName, ThisUser.MobileNo);
    }

    function CalC(uint A,uint B) public pure returns(uint AB)
    {
        return A*B;
    }
    
    modifier MinimumTransfer() {
    	require(msg.value >= 100);
		_;
    }

    function TransferEther_WithModifier(address ToAddress) public payable MinimumTransfer()
    {
        ToAddress.transfer(msg.value);
    }
    
    function TransferEther_NormalWay(address ToAddress) public payable 
    {
        require(msg.value >= 100);
        ToAddress.transfer(msg.value);
    }

}
