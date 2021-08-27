pragma solidity ^0.4.25;



library Set{
    struct Data{
      mapping(int => bool) data;  
    }
    
    
    function Insert(Data storage d, int key) public returns (bool){
        
        if( d.data[key] ){
            return false;
        }
        d.data[key] = true;
        
        return true;
    }
    
     function Remove(Data storage d, int key) public returns (bool){
           if( !d.data[key] ){
                return false;
              
           }
            d.data[key] = true;
            return true;
     }
     
      function Contain(Data storage d, int key) public returns (bool){
            return   d.data[key];
         
      }
}


contract Main{
    Set.Data set;
    
    function insert(int key) public returns (bool){
        return Set.Insert(set,key);
    }
 
 
   function remove(int key) public returns (bool){
        return Set.Remove(set,key);
    }
      
    function Contain(int key) public returns (bool){
        return Set.Contain(set,key);
    }   
}