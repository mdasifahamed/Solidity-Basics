// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0;

contract Parent{
    uint public a = 10;
    address owner;
    constructor() {
        owner = msg.sender;
    }



    function add5() public {
        a = a+5;
    }

    function add20() internal returns (uint) {
        a = a+20;
        uint result = a;
        return result;
    }
    // add20() function also cannnot be visible
    // In The Deployed Parent Contract As it is internal 
    // but it can be access with public fucntion with call
    // like below function getadd20()
    function mul5() private returns (uint) {
        a= a*5;
        uint result = a;
        return result;
    }
    // mul5() function also cannnot be visible
    // In The Deployed Parent Contract As it is private 
    // but it can be access with public fucntion with call
    // like below function getmul()

    function getmul() public returns (uint){
        uint result = mul5();
        return  result;
    }

    function getadd20() public returns (uint){
        uint result = add20();
        return result;
    }
    function sub5() public returns(uint) {
        require(msg.sender == owner);
        a = a - 5;
        uint result = a;
        return result;
    }



}



contract Child is Parent{


    function add10() public{
        a = a+10;
    }
    function add30() public {
        a = add20() +10;
    }
    // function getmul() public  {
    //     mul5();
    // }
    // Cannot Posible Because It is a Private Fucntion Of Parent Contract 
    // Only Parent Contract Can Call this

    function addandsub5() public {
        a = a+5;
        a = sub5() - a;
    }

}
