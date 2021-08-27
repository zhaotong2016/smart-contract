 
 
pragma solidity ^0.4.25;

 contract Donation3 {
     
     struct DonorInfo{
         address [] donors;
         mapping (address => uint) ledger;
     }
     
     mapping (address => DonorInfo) DonationHistory;
     
     
     //streamer ����ˣ�donor ���˭��nickname ������ǳƣ����� ˵�Ļ�
     event LogDonate(address streamer,address donor,string nickname,uint value,string message);
     
     //���о��
     function donate(address _streamer,string _nickname,string _message)public payable {
        
        require(msg.value > 0);
        
        _streamer.transfer(msg.value); 
        
        if(DonationHistory[_streamer].ledger[msg.sender] == 0){
           DonationHistory[_streamer].donors.push(msg.sender);
        }
     
        DonationHistory[_streamer].ledger[msg.sender] += msg.value;
         
        emit LogDonate(_streamer,msg.sender,_nickname,msg.value,_message);
     }
     
     //��ȡ����б�
     function getDonorList() public view returns (address[]){
         return DonationHistory[msg.sender].donors;
     }
     
     event LogListDonorInfo(address streamer,address user,uint value);
     
     //�г����о��log
     function listDonorInfo() public {
         for(uint i = 0; i< DonationHistory[msg.sender].donors.length; i++){
             address user = DonationHistory[msg.sender].donors[i];
             emit LogListDonorInfo(msg.sender,user, DonationHistory[msg.sender].ledger[user]);
         }
     }
 }