pragma solidity ^0.4.25;

import "contracts/ERC20.sol";

//Ïú»Ù
contract Burnable is ERC20{
    
    event Burn(address account,uint256 tokens);
   
      //¼õÉÙtoken supply;
     //¼õÉÙ msg.sender tokens
    function burn(address to, uint256 tokens) public returns (bool) {
       
        require( tokens < _balances[msg.sender]);
        
        _totalSupply = _totalSupply.sub(tokens);
        _balances[msg.sender] = _balances[msg.sender].sub(tokens);
        emit Burn(msg.sender, tokens);
        
        emit Transfer(msg.sender,address(0),tokens);
        
        return true;
    }
    

}