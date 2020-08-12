pragma solidity 0.6.6; //DRY - Don't Repeat Yourself

import "./Math.sol";
    

contract useLib {
    uint256 public value;
    
    function calculate(uint _value1, uint _value2) public {
        //old way
        //value = _value1 / _value2;
        
        //using my library
        value = Math.divide(_value1, _value2);
    }
}