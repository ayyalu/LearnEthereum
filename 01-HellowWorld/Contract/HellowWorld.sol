pragma solidity ^0.4.23;

contract HellowWorld {
    string MyName;

    function setMyName(string _MyName) public {
        MyName = _MyName;
    }

    function getMyName() public view returns (string _MyName) {
        return MyName;
    }
}