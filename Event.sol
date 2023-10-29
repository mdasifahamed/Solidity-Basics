// SPDX-License-Identifier: MIT
pragma solidity >= 0.7.0 <0.9.0;


// EVENTS in Solidity 
// Are Special Feature Which Helps 
// Log Data In Clients Side 
// Whichmean we send Data Dta To Notify 
// What Has Happen After Users Call to A Contract Fucntion
// And Show Them What at is get Store Or Used In BlockChain
// Event Can be Created Outside Contarct at file Level or
// Inside The Contract 
// Like We Can Deifne Event 
// event NotifyStudentCreated(string _name, uint _id) here Also
// we Cannot Do Anything with event Data in Contract level
// We Can Only Do Something With Its Data In The Client Level
// by Deafult event emit can be calceld if the function execution
// fails due any condition or error 


contract A{

    struct Student{
        string name;
        uint id;
    }

    Student[] students;
    // We Definging event in the Contract level
    // we Can define any parameter here in event 
    // in Our we want to show them that we have stored on the chain

    event NotifyStudentCreated(string _name, uint _id);

    function setstudents(string memory _name, uint _id) public{

        students.push(Student(_name, _id));
        // We Are Emiting The event NotifyStudentCreated
        // After Adding The Student info to Student strund and 
        // Storing The Student struct to students array
        // if these adding fails for some reason the emit will not be 
        // executed and if ecerything went right 
        // then we can send the info 
        //we stored to user 
        // what we have stored in the blockchain in our case
        // Or anything we van to show the user after
        // the succesfull execution of this line
        // students.push(Student(_name, _id));
        emit NotifyStudentCreated(_name, _id);
    }

}
