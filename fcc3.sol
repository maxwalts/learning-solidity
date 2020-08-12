pragma solidity ^0.6.6;

contract ERC20Token {
    string public name;
    mapping(address => uint256) public balances;
    
    function mint() public {
        //msg.sender is the address of contract3 if called from contract3. so don't use that
        balances[tx.origin] ++;
        
    }
}

contract contract3 {
    address payable wallet;
    address public token;
    
    constructor(address payable _wallet, address _token) public{
        wallet = _wallet;
        token = _token;
    }
    
    fallback() external payable {
        buyToken();
    }
    
    function buyToken() public payable {
        //we give this contract the address of the Token contract.. then we can mint a token from an instance
        //I got the address by deploying, then "contract address" in the module.
        ERC20Token _token = ERC20Token(address(token));
        _token.mint();
        wallet.transfer(msg.value);
    }
    
}