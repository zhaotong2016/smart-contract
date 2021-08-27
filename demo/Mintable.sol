pragma solidity ^0.4.25;

import "contracts/ERC20.sol";

//铸造
contract Mintable is ERC20{
    
    address private owner;
    mapping (address => bool) minters;
    
    
    constructor() public{
        owner = msg.sender;
    }
    
    modifier onlyOwner(){
        require(msg.sender == owner);
        _;
    }
    
    //只有铸造币的人才能修改
    modifier onlyMinter(){Mintable
        require(minters[msg.sender]);
        _;
    }
    
    
    function addMinter(address addr) public onlyOwner returns(bool){
        minters[addr] = true;
        return true;
    }
    
      //增加token supply;
     // 转移新增出来的token到某人
    function mint(address to, uint256 tokens) public onlyMinter returns (bool) {
        _totalSupply = _totalSupply.add(tokens);
        _balances[to] = _balances[to].add(tokens);
        emit Transfer(address(0),to,tokens);
        
        return true;
    }
}