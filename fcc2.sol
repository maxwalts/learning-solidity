pragma solidity ^0.6.6;

contract newContract {
    mapping(address => uint256) public balances;
    //the wallet you pass in pays the ether.
    address payable wallet;
    
    event Purchase(
        address indexed _buyer, 
        uint256 _amount
        );
    
    constructor(address payable _wallet) public {
        wallet = _wallet;
   }
   
   fallback() external payable {
       buyToken();
   }
   
    function buyToken() public payable {
       //buy a token
       //showing how many times a transfer has been made
       balances[msg.sender] += 1;
       //transfer to the wallet 
       wallet.transfer(msg.value);
       emit Purchase(msg.sender, 1);
       
   }
}