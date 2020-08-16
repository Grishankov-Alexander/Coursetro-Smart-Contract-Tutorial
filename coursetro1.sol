pragma solidity ^0.4.18;

contract Coursetro {
    string fName;
    uint age;
    address contract_owner;
    
    function Coursetro() public {
        contract_owner = msg.sender;
    }
    
    modifier onlyOwner {
        require(msg.sender == contract_owner);
        _;
    }
    
    event Instructor (
        string name,
        uint age
    );
    
    function setInstructor(string _fName, uint _age) onlyOwner public {
        fName = _fName;
        age = _age;
        Instructor(_fName, _age);
    }
    function getInstructor() public constant returns (string, uint) {
        return (fName, age);
    }
} 