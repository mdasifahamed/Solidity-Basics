// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0;


// String In Solidity Have Diffrerent Behavoiur According To State

// 1. Storage
// 2. Momry

contract Parent{
    string  public name;
    // String Varibales Declared in Contract {} Scope 
    // By Default Take Storage State


    function setname(string memory _name) public{
        // Inside This Fucntion String Data 
        // is Taken as Parameter
        // but it state  is used memory
        // That means this string will be only existed when the
        // is getting executed 
        // after The execution variable will not 
        // use any space untill it is getting executed 
         
        name = _name;

    } 
    

}
