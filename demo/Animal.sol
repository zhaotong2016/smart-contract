pragma solidity ^0.4.25;



interface Animal{
    
    
    function run(uint speed) public returns (uint);
    
    
}

contract Cat is Animal {
     function run(uint speed) public returns (uint distance){
         return speed*speed;
     }
}

contract Dog is Animal{
      function run(uint speed) public returns (uint distance){
         return speed*10;
     }
}