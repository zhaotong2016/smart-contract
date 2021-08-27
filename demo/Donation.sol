pragma solidity ^0.4.25;

/**
 * �����Լ��ַhttps://goerli.etherscan.io/address/0x14B8660194ACcF4E2e48603cCafcdC1ECf70874b 
 * ��¼���
 **/
contract Donation{
    
    //������ 0xdff69c592c1b8b9db7b5a7d4e38db569ca5ca68e63b5b1a8534a9bdde1d7c714
    mapping(address => uint) public ledger;
    //�ж���û�о��
    mapping(address => bool) public donors;
    
    //���о�����
    address[] public donorList;
    
    
    function isDonor(address pAddr) internal view returns(bool){
        return donors[pAddr];
    }
    
    //���о��
    function donate() public payable {
        if(msg.value >= 1 ether){
            if(!isDonor(msg.sender)){
                donors[msg.sender] = true;
                donorList.push(msg.sender);
            }
            
            ledger[msg.sender] += msg.value;
        }else{
            revert("< 1 ether");
        }
    }
}