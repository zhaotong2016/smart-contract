

pragma solidity ^0.4.25;


/**
 *  
 **/
contract StateVariables{

    string name;
    uint public rename_counter;
    address owner;
  
  
    
    //初始化 对变量设置初始化值
    constructor() public{
        name = "unknown";
        owner = msg.sender;
        rename_counter = 0;
    }
    
    // 1修改name 必须 是不是 部署合约的拥有者 
    /*function setName(string _name)public returns(string){
        if(msg.sender == owner){
            name = _name;
        }else{
            // 用来终止执行，且消耗gas 不进行退还 类似 assert() require() throw 
            revert("Permission denied.");
        }
        
        return name;
    }*/
    

    // 优化 setName
    modifier checkOwner(address _add){
        require(msg.sender == owner,"Permission denied.");
        rename_counter += 1;
        _;
    }
    
    
    function setName(string _name)public checkOwner(msg.sender) returns(string){
        name = _name;
        return name;
    }
    
    
    // 获取变量 view 
    function getName() public view returns (string) {
        return name;
    }
}