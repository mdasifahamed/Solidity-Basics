// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0 <0.9.0;


// Constructor 
// Constructor In Solidity 
// Executed only Once In The time of Deployment
// It May Contain Parameter or May Not
// Only One Contructor Can be Defined In One Contract
contract A {
    address  _owner;

    // Below The ConstructOr Sets The Address Of 
    // The Owner Of Contract That Means
    // Who the Deployed The Contract Is Owner Of The Contract 
    // As construvtor Will Be Executed For Once 
    // Thus Owner Can Be Defined
    constructor(){
        _owner = msg.sender;
    }

    // Below The Function "getsum" Uses State "_owner" 
    // To Determine Is Function Caller is the owner Of The Contract 
    // or Not As _owner is excuted at the time of Contructor while deploying the contract
    // set the addrees from first execution it
    // Contains The The owner Addreess.
    // And msg.sender Alway sreturn the callaer address
    // If AnyOne Who Doesn tOwn This Contract Call this Function
    // It Will Throw An Error
    function getsum(uint a, uint b) public view  returns(uint)  {
        require(msg.sender == _owner, "Only The Owner Of Contract Can Call This Function");
        return a+b;
    }
}


contract B {
    uint public id;
    address _owner;

    // Parametrized Constructor
    // We can set value of the constructor value 
    // Ath The Time Of Deployment
    constructor(uint _id){
        _owner = msg.sender;
        id = _id;
    }

    function getId() public view  returns(uint) {
        return id;
    }
    function UpdateId(uint _id) public {
        id=_id;
    }

}
