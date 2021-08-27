pragma solidity ^0.4.25;

/**
 * 部署合约地址https://goerli.etherscan.io/address/0x14B8660194ACcF4E2e48603cCafcdC1ECf70874b 
 * 记录捐款
 **/
contract Donation{
    
    //捐献人 0xdff69c592c1b8b9db7b5a7d4e38db569ca5ca68e63b5b1a8534a9bdde1d7c714
    mapping(address => uint) public ledger;
    //判断有没有捐款
    mapping(address => bool) public donors;
    
    //所有捐款的人
    address[] public donorList;
    
    
    function isDonor(address pAddr) internal view returns(bool){
        return donors[pAddr];
    }
    
    //进行捐款
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