

pragma solidity ^0.4.25;


import "contracts/SafeMath.sol";
import "contracts/IERC20.sol";


contract ERC20 is IERC20{
    
    using SafeMath for uint256;
    
    string public constant name ="haha token";
    
    uint8 public constant decimals = 18;
    
    string public constant symbol = "HT";
    
    
    uint256 private _totalSupply;
    
    mapping(address => uint256) _balances;
    mapping(address => mapping(address => uint256)) _approve;
    
    function totalSupply() external view returns (uint256){
        return _totalSupply;
    }

  
    function balanceOf(address account) external view returns (uint256){
        return _balances[account];
    }

    //从 msg.sender -token ->to
    function transfer(address to, uint256 tokens) external returns (bool){
        return _transfer(msg.sender,to,tokens);
    }

    //得到 tokenOwner 授权给 spender使用token 剩余数量
    function allowance(address owner, address spender) external view returns (uint256){
        return _approve[owner][spender];
    }

  
    // ms.spender 授权给 spender 可使用自己的tokne
    function approve(address spender, uint256 tokens) external returns (bool){
        //授权 给 多少 tokens
        // msg.sender --> tokens -->to
        _approve[msg.sender][spender] = tokens;
        emit Approval(msg.sender,spender,tokens);
        return true;
    }

     
    function transferFrom(
        address from,
        address to,
        uint256 tokens
    ) external returns (bool){
         _approve[from][msg.sender] =  _approve[from][msg.sender].sub(tokens);
        
          return _transfer(from,to,tokens);
    }
    
    
    function _transfer(address from,address to,uint256 tokens) internal returns (bool success){
          _balances[from] = _balances[from].sub(tokens);
          _balances[to] = _balances[to].add(tokens);
          emit Transfer(from, to,tokens);
             return true;
    }
}

