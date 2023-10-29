// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0 <0.9.0;


// Arrays In Solidity Have Two Types
// 1.  Fixed Sized(Fixed length)
// 2. Dynamic Sized(dynamic length)
// Array has Three member 
// length propert and pop(), push() method
// before Declaring array in Solidity data type Must be Defined
contract A {
    
    // defining a empty array fixed length array 
    // arr1 of 5 length of uint 
    // means it can only contain uint type values
    // which can contain 5 uint typs values
    // it can contain less than 5 value 
    // but not more than 5 value

    uint[5] public arr1;

    // Defining an empty dynamic sized array
    // arr2 type of array means it can contain only string type data
    // it length is dynamic we can store as amnay as elemnets
    // in it ultill stack overflow for the data type

    string[] public arr2;

    // lets fill up the The Arr1 Using function fillarr1()

    function fillarr1 (uint _a, uint _b, uint _c) public{
        // We are Filling three elemnts
        // to the array example purpose 
        // arr1 can only contain only 5 elements it 
        // can take value upto arr1[4] location
        // we cannot store value at arr1[5] or at arr1[6]
        // it not possible arr1[5]= = some uint value or arr1[6] == some uint value
        arr1[0] = _a;
        arr1[1] = _b;
        arr1[2] = _c;

    }
    
    // lets fill up arr2 using fillarr2()

    function fillarr2 (string memory _name1, string memory _name2) public{
        // We are Filling Two elemnts
        // to the array example purpose 
        // arr2 can make elements as it is dynamic
       // we going to using push() method here 
       // we dont care about index and length of the array
       arr2.push(_name1);
       arr2.push(_name2);
 
       

    }


}
