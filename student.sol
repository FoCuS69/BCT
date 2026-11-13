// SPDX-License-Identifier: MIT
pragma solidity ^0.8.34;
contract StudentData {
// Structure
struct Student {
uint256 rollNo;
string name;
uint256 age;
string course;
}
// Array
Student[] public students;
// Event for fallback
event FallbackCalled(address sender, uint256 value);
// Add student
function addStudent(
uint256 _rollNo,
string memory _name,
uint256 _age,
string memory _course
) public {
students.push(
Student(
_rollNo,
_name,
_age,
_course
)
);
}
// Get student details
function getStudent(uint256 _index)
public
view
returns (
uint256,
string memory,
uint256,
string memory
)
{
Student memory s = students[_index];
return (
s.rollNo,
s.name,
s.age,
s.course
);
}
// Get number of students
function getStudentCount()
public
view
returns (uint256)
{
return students.length;
}
// Fallback function
fallback() external payable {
emit FallbackCalled(
msg.sender,
msg.value
);
}
// Receive Ether
receive() external payable {
emit FallbackCalled(
msg.sender,
msg.value
);
}
}
