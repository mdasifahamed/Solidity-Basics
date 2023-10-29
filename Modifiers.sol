// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0 <0.9.0;

// Fucntion Modifiers
// Fucntion Modeifiers Are Special
// Kind Of Function That Has Effect On Function
// It can be parametrized or Non Paramarized
// It is InHertable With Its Contract 
// Multiple Modifiers Canbe Used in Single Functions

contract A {
    // Owner Is Here The One Who deployed This Contract to the Chain
    address owner;
    struct nft{
        string name;
        uint Quintity;
    }

    nft[] public nfts;
    constructor(){
        // As Owner first Deployed the Contract 
        // So the First messegaer Is the Sender i.e the Owner
        // And As Construction is executed only once when Deployed 
        // Thats How Owner Is Get Set.
        owner = msg.sender;
    }
    uint public above5;

    // Modifire "onlyOwner" is a Non Parameterized Modifire
    // It Checks If The User is The Owner Of The Contract Or not
    // If Not Then Then The Fucntion Excution Will Stop Where This Modifiers I sUsed
    // Note : The fucntion First Check the require as Requie is 
    // Used Before The _;
    // "_;" This Means If Condtion Satified then exectued The Othe lines 
    // Of The Function Else revert to back. 
    modifier onlyOwner(){
        require( msg.sender== owner,"Only Owner Can Call This Function");
        _;
    }


    // Parametrized Modifier 
    // This "greaterthan5" modifier takes an argument _num
    // And Checks the Num Is Greater Than Five or Not if yes 
    // Then It Permits To Execute The Function
    modifier greaterthan5(uint _num){
        require(_num>5,"Number Must Be More Than 5");
        _;
    }
    // "sumgreatherthan10" modifier will execute The Function
    // First Then Checks If The the sum of The Number Is greter Than 10
    // Or Not If Yes Then return the "mulply" result else not 
    modifier sumgreatherthan10(uint _num1, uint _num2){
        _;
        require((_num1+_num2)>10 , "Sum Of Num1 and Num2 Must Be Greater than 10");
        
    }
    
    function setnfts(string memory _name, uint _quantity) public  {
        nfts.push(nft(_name,_quantity));
    }
    
    // in This Function "viewnft" uses OnlyOwner modifier
    // Which indicates That Only the Owner Of This Contarct Can View The nft.
    function viewnft(uint _index) public  view onlyOwner returns(nft memory){
        return nfts[_index];
    }

    //This "setavobe5" Function Takes on Argument Which is "_num"
    //This argument "_num" also used in modifier "greaterthan5"
    //To Check The Value is Greater Than Five Or Not If Yes Then 
    // Set "above5" value Else Revert The Funciton Execution.
    function setavobe5(uint _num) public greaterthan5(_num){
        above5 = _num;
    }

    // This "mulply" Function calculate The Result 
    // Then It will Use Modifier "sumgreatherthan10"
    function mulply(uint _a, uint _b) public pure sumgreatherthan10(_a,_b) returns(uint){

        uint result = _a * _b;
        return result;
    }
    // this function uses two modifiers one Only The 
    // Owner of This Contract Call this fucntiontion as used "onlyOwner"
    // Again the Value Passed By The owner Must be Greater Than 5 
    // As used "greaterthan5"
    // for this reson Two Condition Must be macthed To exected this Function

    function setAbove52(uint _num) public onlyOwner greaterthan5(_num){
        above5 = _num;
    }


    
}

// Inherited Modifier
contract B is A {

    uint public id;

    // As Contract B Is Inherited From Contract B 
    // Contarct b Can Use Contarct a Modifiers 
    // Example Below "onlyOwner" Is Not Defined in Contract B
    // But It Uses The Modifier From the Nature Of Contract A 
    
    function setId(uint _id) public onlyOwner{
        id = _id;
    }
    
}
