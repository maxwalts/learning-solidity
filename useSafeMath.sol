pragma solidity 0.6.6; //DRY - Don't Repeat Yourself

import "./SafeMath.sol";
    

contract useLib {
    using SafeMath for uint256;
    uint256 public value;
    
    function calculate(uint _value1, uint _value2) public {
        value = _value1.div(_value2);
    }
}