// SPDX-License-Identifier: UNLICENSED
pragma solidity >=0.7.0;


// Three Type Of Variable Scope In Solidity 
// State Varirable
// Local Variables
// Global Varibales
contract VariablesTyypes{

    // State Varibale (The variable We In side Contarct {} Code Blocks Are All State Variable)

    // This "id" var is A Stata Varibale
    // As It is defined inside conatract it is a
    // State and it will take storage inside the blockchain
    // it can be accesed to any function , modifiers, constratuctor,etc of
    // this VariablesTyypes contarct
    // as this vaibale visibilty is public it can also be acceeded from other contract 
    // out of this contarct with inhertence or new object creation
    uint8 public id =10;
  
    function getid() public view returns (uint8){
        return id;
    }

    // Local Variables
    function getsum(uint8 a,uint8 b) public pure returns(uint8){
        // The "result" Variable Used In this funtion
        // is local variable
        // it can only be accessed inside of this function only
        // it will not store in thae storage Of Blockchain
        // It will only memory when time of execution of this
        // function getsum
        uint8  result = a + b;
        return result;

    }

    // Global Varibles

    // Global Varibale Are Variable That Are All Golbal For All Contarcts, Functions ,
    // Interfaces, Libraries, etc
    // Any code block {} can Accesss Global Variables
    // Solidity a set Global Varibales find Here "https://docs.soliditylang.org/en/v0.8.17/units-and-global-variables.html" 


    function globlavariables() public view returns (uint){
        // Below Block.number is global varibale 
        // The Main purpose of Using mutabilty is view however 
        // we have not declared the varibale inthe contarct but it is 
        // part of contart that why we have to declare nutabilyt view
        // pure wonnt work here.
        return block.number;
    }





}
