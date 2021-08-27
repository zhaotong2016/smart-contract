pragma solidity ^0.4.25;

import "contracts/ERC20.sol";

//����
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
    
    //ֻ������ҵ��˲����޸�
    modifier onlyMinter(){Mintable
        require(minters[msg.sender]);
        _;
    }
    
    
    function addMinter(address addr) public onlyOwner returns(bool){
        minters[addr] = true;
        return true;
    }
    
      //����token supply;
     // ת������������token��ĳ��
    function mint(address to, uint256 tokens) public onlyMinter returns (bool) {
        _totalSupply = _totalSupply.add(tokens);
        _balances[to] = _balances[to].add(tokens);
        emit Transfer(address(0),to,tokens);
        
        return true;
    }
}