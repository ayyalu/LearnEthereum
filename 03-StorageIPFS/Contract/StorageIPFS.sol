pragma solidity ^0.4.23;

contract StorageIPFS {

    struct User{
		string FirstName;        
		string LastName;
		int MobileNo;
		bytes CertHash;
    }

    mapping(string => User[]) UserEmailIDMap;

    function AddUser(string EmailID,string FirstName,string LastName,int MobileNo,bytes CertHash) public
    {
        UserEmailIDMap[EmailID].push(User(FirstName,LastName,MobileNo,CertHash));
    }

    function ViewUser(string EmailID) public view returns(string FirstName,string LastName,int MobileNo,bytes CertHash)
    {
        User memory ThisUser=UserEmailIDMap[EmailID][0];
        return (ThisUser.FirstName, ThisUser.LastName, ThisUser.MobileNo, ThisUser.CertHash);
    }
}
