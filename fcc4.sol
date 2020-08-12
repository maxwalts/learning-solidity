pragma solidity 0.6.6;

//inheritance

contract ERC20Token {
    string public name;
    mapping(address => uint256) public balances;
    
    constructor(string memory _name) public {
        name = _name;
    }
    
    function mint() public virtual {
        balances[tx.origin] ++;
    }
}

contract myToken is ERC20Token {
    string public symbol;
    address[] public owners;
    uint256 ownerCount;
    
    //for overriding the constructor. Spacing is for readability.
    constructor(
        string memory _name, 
        string memory _symbol
    ) 
        ERC20Token(_name) 
    public {
            symbol = _symbol;
    }
    
    function mint() public override {
        //calling other mint function so behavior is preserved
        super.mint();
        ownerCount++;
        owners.push(msg.sender);
    }
    
}