// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0;



// Function State Muatbility 
// Solidity has 2 Types Of Staet Mutability
// 1. Pure Function
// 2. View Functions
// To Modify Sate Varibales (variable declared inside contract sate{})
// There No need To Declare Fucntion Sate Mutabilty

contract Parent{
    
    uint8 public id;
    string public name;
    uint8 public result;

    // Below in the  get_id() function State Mutabilty 
    // View is Used.
    // Using View State Mutabilty we cannot
    // Modify State Variable 
    // But We Can Read Sate Variables;
    // As Shown InThe Function Code Block
    function get_id() public view returns (uint8){
        // We Cannot do id = 10;
        // but we can return id
        // As We Did.
        return id;
    }

    // Below in the totalsub () &totalnum() function state mutability
    // pure is used.
    // By using pure we cannot read or write on the state variable
    // but we can use its return value to set value for 
    // state varibales
    // pure function can also be called outside the contract 
    // can be call inside the contract 
    
    function totalsub() public  pure returns (uint8){
        // return id or id =10;
        // cannot posible here
        return 7;
    }
    function totalnum() public  pure returns (uint8){
        // return id or id =10;
        // cannot posible here
        return 35;
    }

    // To Modify The State varibales We Can Function Without Any 
    // Sate Muatbility Declared
    // Like Bellow Function SetData()

    function SetData(uint8 _id , string memory _name) public  {

        id = _id;
        name = _name;
        result = totalnum()/totalsub();// Using Pure Fucntion retrun Values To Set State Varibales Value 
        
    }
}

