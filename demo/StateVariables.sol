

pragma solidity ^0.4.25;


/**
 *  
 **/
contract StateVariables{

    string name;
    uint public rename_counter;
    address owner;
  
  
    
    //��ʼ�� �Ա������ó�ʼ��ֵ
    constructor() public{
        name = "unknown";
        owner = msg.sender;
        rename_counter = 0;
    }
    
    // 1�޸�name ���� �ǲ��� �����Լ��ӵ���� 
    /*function setName(string _name)public returns(string){
        if(msg.sender == owner){
            name = _name;
        }else{
            // ������ִֹ�У�������gas �������˻� ���� assert() require() throw 
            revert("Permission denied.");
        }
        
        return name;
    }*/
    

    // �Ż� setName
    modifier checkOwner(address _add){
        require(msg.sender == owner,"Permission denied.");
        rename_counter += 1;
        _;
    }
    
    
    function setName(string _name)public checkOwner(msg.sender) returns(string){
        name = _name;
        return name;
    }
    
    
    // ��ȡ���� view 
    function getName() public view returns (string) {
        return name;
    }
}