





## 一、Smart contract & Solidity



1、Deploy a smart contract

​		smart contract -> solidity compiler -> output (contract abi/bytecode) ->  

​		Transaction( data:bytecode ) 交给矿工 -> Contract Address (State)

2、Call a smart contract

​		a、Client (Contract ABI /function Parameters) -> Compose a transaction  ->
​		b、Transaction [ 1、contract Address/2、function hash/3、function parameter/4、gas limit (tx fee)]
​		c、矿工打包 放到blockchain 上面 根据 Contract address (State)查找->load bytecode 
​		d、Evm executes the contract bytecode with give inputs (State) 主要作用 是为了跨平台 

3、智能合约基础语法

	1、function <name> (<paramters>){}
	
		returns (return value type)
	
	2、Visibility
		public
		external 只有contract外面调用 
		interal 只有contract内部调用
		private  只允许contract 内部调用
	
	3、Pure function
		不用考虑和链上互动
		很纯净 完全不读写State

4、Ganache & Remix

  下载安装


5、State Valriables

	将状态储存在合约里

6、Funcation Modifiers

	modifier name(<args>){ //args 参数
		.... //逻辑
	    _; //执行完成modifier之后，会去往下执行原本function
	}

7、 assert() require() throw 

 	throw  已经被丢弃

8、 event & log
	  emit name

	multiple topics

9、Fallbak

   每个合约只有一个 没有名字的 方法
   不允许传入参数且 不会有返回值

10、 Address type

	wei 是最小的gas单位
	1ether = 10^3 Finnery = 10^6 Szabo = 10^18Wei
	
	address.balance -> uint256 获取余额
	address.send(uint256 amount) 发送 
	address.tansfer(uint256 amount)
	
	Transfer v.s Send
	 Transfer 保证了发送eth的正确性，因为失败的时候会让整个transaction 收到 throw 而终止
	 Send 在执行失败只会返回false, 所以使用send时 应该检查返回值

11、mapping	

12、struct

13、实况捐款合约

14、Abstract Contracts


15、Interface

16、Library

17 、SafeMath

​		参考：https://github.com/OpenZeppelin/

18、Import & using lib for type;

19、ERC20 Interface

20、ERC20 part1

21、ERC20 part2

​			授权

22 、ERC20 Optional

23、 ERC20 Mintable 

​			铸造

24、 ERC20 Burnable

​			銷毀

25、 ERC20 Pausable

​			暂停or开启

26、 Investments Example



## 二、去中心化金融 Defi

![](https://github.com/zhaotong2016/smart-contract/blob/master/image/defi.jpg)

## 三、UnitSawp Demo

部署工厂合约：

0x27C1adB1cd1399F4dfB8A426D86B074D9e72a38b

weth地址 不同网络地址不同
0xdf032bc4b9dc2782bb09352007d4c57b75160b15

新部署的路由合约地址

参考：https://docs.uniswap.org/protocol/V2/reference/smart-contracts/router-01

0x8985b115336e7a16D9939547Af58260d362cE1b4

部署路由合约 有两个地址

1、工厂合约地址
2、weth地址 不同网络地址不同


