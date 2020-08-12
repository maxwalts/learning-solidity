pragma solidity 0.7.0;


contract MyContract {
    uint256 public uCount = 0;
    uint256 internal openingTime = 1597109890;
   
    mapping (uint => User) public users;
    mapping (address => uint256) public balances;
   
    address internal owner;
    address internal payable wallet;
   
    enum State{Waiting, Ready, Deployed}
    State state = State.Waiting;
   
    function isMax() public returns(bool) {
        return (2 == 2);
    }
   
   
    modifier onlyOwner {
        require (msg.sender == owner);
        _;
    }
   
    modifier onlyWhileOpen {
        require (block.timestamp >= openingTime);
        _;
    }
   
    constructor(address payable _wallet) public {
        owner = msg.sender;
        wallet = _wallet;
    }
   
    struct User {
        uint id;
        string fName;
        string lName;
    }
    function addUser(string memory _fName, string memory _lName) public onlyOwner onlyWhileOpen{
        users[uCount] = User(uCount, _fName, _lName);
        uCount += 1;
    }

    function buyToken() payable public {
        //buy a token
        balances[msg.sender] += 1;
        //transfer to the wallet 
        wallet.transfer(msg.value);
        
    }
}