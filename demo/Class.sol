pragma solidity ^0.4.25;


contract Class{
    
    struct Student{
        string name;
        uint socre;
        bool active;
    }
    
    mapping(uint => Student) students;
    
    modifier ActiveStudent(uint id){
        require(students[id].active,"Student is inactive");
        _;        
    }

    function register(uint id,string name) public{
        students[id] = Student({name:name,socre:0,active:true});
    }
    
    function modifiyScore(uint id,uint socre) public ActiveStudent(id){
       students[id].socre = socre; 
    }
    
    function getStudent(uint id) public ActiveStudent(id) view returns (string,uint){
        return (students[id].name,students[id].socre);
    }
    
}