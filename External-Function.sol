// SPDX-License-Identifier: UNLICENSED
pragma solidity >=0.7.0 <0.9.0;

// The Funtions Defined as External 
// Can Be Call From The Outside of The Contract Call 
// External Fucntion Can Be Calles WithOut Inherrating Contract
// It Can be Called by Initiating Contract By Its name
// The Contract Which Calls Extrernal Function 
// Form Another Cannot Change The State Varibales Of 
// The Contract Which Has External Type Function
// In Our Case If We Call External Fucniton "setdata" from Contarct B
// It Will not Modify The State Varibales Of Contarct A 
// But If We Call Extternal Function add From Contract B
// It will Modify the State Varibale of Contract B "result"
// That means External Fucntion Has Effect on State Variable 
// Of The Calling Contract but Not In The Contarct That It Has Come from
// In Our Case If we Call External Fucntions of The A Contracts 
// To The B Contracts It Will have Effect On The State Varibales of B
// But Not In A.  


contract A {
    uint amount;

    uint id;

    mapping(uint => uint) public  idToAmount;

    // the fucntion "setdata" in this contract 
    // external type which changes the State variables
    // amount, id, and idToAmount

    function setdata(uint _id, uint _amount) external {

        amount = _amount;
        id = _id;
        idToAmount[_id] = _amount;
    }

    // the fucntion "add" in this contract is also
    // external type which does not change  the State variables
    // but returns A Additoions Of Two Uints
    
    function add(uint a, uint b) external pure returns(uint) {

        uint result = a + b;
        return  result;

    }

}


// Contaract That Will Call The External Funtions From Contract A
contract B {

    // Declaring State As a Of Contract Type A For Contract
    // A
    A  a;

    // This State Will have Effects 
    // Of External Call Functions
    // Of Contarct A.
    uint public result;
    
    constructor(){

        // Initiating Contract A to Use Its
        // Proper In This B Contract
        // Note: Initiating in constructor helps 
        //  in setting the reference for the constructor will be executed only once
        a = new A();
    }
    function set(uint _id, uint _amount) public {
        // This External Call Have No Effect
        a.setdata(_id, _amount);
    }
    function getAddition(uint _a, uint _b) public {
        // But This will Have Effect on This Contract.
        result = a.add(_a, _b);
    }
}
