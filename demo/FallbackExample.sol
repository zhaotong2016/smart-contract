
pragma solidity ^0.4.25;

contract FallbackExample{
    
    event LogFallback(string message);
    
    event LogBalance(uint balance);
    
    function() payable public{
        emit LogFallback("Fallback");
        emit LogBalance(address(this).balance);
    }
}