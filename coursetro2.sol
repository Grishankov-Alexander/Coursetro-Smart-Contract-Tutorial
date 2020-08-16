pragma solidity ^0.4.18;

contract Courses {
    
    struct Instructor {
        uint age;
        string fName;
        string lName;
    }
    
    mapping (address => Instructor) instructors;
    address[] instructorAccounts;
    
    function setInstructor(address _address, uint _age, string _fName, string _lName) public {
        Instructor storage instructor = instructors[_address];
        instructor.age = _age;
        instructor.fName = _fName;
        instructor.lName = _lName;
        instructorAccounts.push(_address) -1;
    }
    
    function getInstructors() view public returns (address[]) {
        return instructorAccounts;
    }
    
    function getInstructor(address _addr) view public returns (uint, string, string) {
        return (instructors[_addr].age, instructors[_addr].fName, instructors[_addr].lName);
    }
    
    function countInstructors() view public returns (uint) {
        return instructorAccounts.length;
    }
}
