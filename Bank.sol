pragma solidity ^0.4.19;
// Smart contract
contract MyContract {
// Stores the address of the contract owner
address private owner;
// Constructor - runs only once when the contract is deployed
constructor() public {
owner = msg.sender;
}
// Returns the address of the owner
function getOwner()
public
view
returns (address)
{
return owner;
}
// Returns the current balance of the owner
function getBalance()
public
view
returns (uint256)
{
return owner.balance;
}
// Deposit exactly 2 ETH into the contract
function deposit()
external
payable
{
require(
msg.value == 2 ether,
"Please send exactly two ethers"
);
}
// Withdraw all ETH from the contract
// Only the owner can call this function
function withdraw()
external
{
require(
msg.sender == owner,
"Only owner can withdraw"
);
msg.sender.transfer(address(this).balance);
}
}
