pragma solidity ^0.4.26;

contract Owned {
    address owner;
    
    constructor() public {
        owner = msg.sender;
    }
    
    modifier onlyOwner {
        require(msg.sender == owner);
        _;
    }
}

contract Courses is Owned {
    
    struct Instructor {
        uint age;
        bytes16 fName;
        bytes16 lName;
    }
    mapping (address => Instructor) instructors;
    address[] instructorAddresses;
    
    constructor() public {}
    
    event instructorModified (
        uint age,
        bytes16 fName,
        bytes16 lName
    );
    
    function setInstructor(address _addr, uint _age, bytes16 _fName, bytes16 _lName) onlyOwner public {
        instructors[_addr].age = _age;
        instructors[_addr].fName = _fName;
        instructors[_addr].lName = _lName;
        instructorAddresses.push(_addr);
        emit instructorModified(_age, _fName, _lName);
    }
    
    function getInstructors() view public returns (address[]) {
        return instructorAddresses;
    }
    
    function getInstructor(address _addr) view public returns (uint, bytes16, bytes16) {
        return (instructors[_addr].age, instructors[_addr].fName, instructors[_addr].lName);
    }
    
    function countInstructors() view public returns (uint) {
        return instructorAddresses.length;
    }
}