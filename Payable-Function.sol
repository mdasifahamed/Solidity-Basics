// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0 <0.9.0;


// Payable Functions In Solidity 
// Payable Is A Keyword Which Can be In Fucntions
// Payable is Responsible  Transfering Money From 
// One Address to Othes
// These Addres Can be Contract Addres Or People Address or Externally Address
// To Transfer Ethereum Or Ethereum  Etherreum Base Or Any Kind
// Real Money Transfering Through We Need to Use Payable Keyword In Function 
// To Make The Function Able To Transfer Money
// Note: Without Using Payable Keyword In the Function We Cannot Access "msg.value"
//       And The Address Which Going To received Money Declared Payable Also 

contract Transaction {
    // Owner is Going To received Ether Its Addres Is delard Payable
    // Because Without Payable Address Cannot Accept/Send Ether
    address payable owner;
    address[] Recievers;// Jsut For tracking Purpose Not Manadatory

    mapping (address=>uint) amountofReceivers; // Jsut For tracking Purpose Not Manadatory
    
    // Declaring Thae Contarct Owner 
    // Via Cnonstructor
    constructor() {
        owner = payable(msg.sender);
    }

    // For Restrincting Other From sending Ethers
    modifier onylyOwner{
        require(msg.sender==owner, "Only Owner Use This Feature");
        _;
    }
    // This "receiveEther()" Fucntion Received Ether From Any Address 
    // And Stores It to the This Contract owner Address
    // As It Received Ether Paybale keyword is Used Otherwise 
    // This Function Will Be Un Able to Receive Ether. 
    function receiveEther()  payable public { 

        owner.transfer(msg.value);
    }

    // This "sendToOthers()" is a that sends ether to a address
    // as this function is sendeing ether and ther address pased in the fucntion
    // which received ether so payable keyword is used 
    // other wise it will not be able to transfer ether 
    // & this function can only be called by the owner
    // Note: The Address Passed to this Function as parametter whcih is 
    //        going to receive ether is explicitly converted to paybale 
    //        because only payable address can receive and send ether.
    // rest of code after transfer is just for tracking and can be omited. 
    function sendToOthers(address _add) payable public onylyOwner {
        payable (_add).transfer(msg.value);
        Recievers.push(_add);
        amountofReceivers[_add]=msg.value;
    }
}
