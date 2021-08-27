

pragma solidity ^0.4.25;

/**
 * https://goerli.etherscan.io/address/0x31A990e9239CC6aae8B11E580B80bFED9e971c00
 * 
 * LogDonate
 * 
 * [
	{
		"from": "0x31A990e9239CC6aae8B11E580B80bFED9e971c00",
		"topic": "0xaef23279e845ae93cc01c8166ab5e8867b29d29562399f4ad6854b068addf844",
		"event": "LogDonate",
		"args": {
			"0": "0xf8006Af66c5ffBd34F138A5621272BDd0c27B770",
			"1": "0x43B5a1F6C8DDB1C3581f049d8305b39F55832Dff",
			"2": "hunter",
			"3": "1000000000000000000",
			"4": "hello world",
			"streamer": "0xf8006Af66c5ffBd34F138A5621272BDd0c27B770", //������
			"donor": "0x43B5a1F6C8DDB1C3581f049d8305b39F55832Dff", //�����
			"nickname": "hunter",
			"value": "1000000000000000000",
			"message": "hello world"
		}
	}
]
 * ʵ������Լ
 **/
 
 contract Donation2{
     //streamer ����ˣ�donor ���˭��nickname ������ǳƣ����� ˵�Ļ�
     event LogDonate(address streamer,address donor,
     string nickname,uint value,string message);
     //ʵ����
     function donate(address _streamer,string _nickname,string _message)public payable {
        _streamer.transfer(msg.value); 
        emit LogDonate(_streamer,msg.sender,_nickname,msg.value,_message);
     }
 }