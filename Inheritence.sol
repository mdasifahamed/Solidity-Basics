// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0 <0.9.0;


// Inheritence In Solidy
// In Solidity Inheritence is Like Other Languages 
// It Supports Multpile ,Linear inheritence
// It Aslo Sopport Functions Overidding As Well as modifier overridding
// To Inherit An From Base is Keywqord Is Used 
// To override a Function In The Base Contract "virtual" Keyword Must Be Used 
// In The Function That can Be Overrride from other Contract
// Keyword  "Override Must Be Used" In Derived Contract Fucntion To Ovverride 
// Base Contart function In The Derived Contrac
// "Public", "Internal" Function oF Base Contracts
// Is Accesble By Inheritence In Derived Contarcts
// But "Private" functions Are not Accesible By Inheritence To Deirved Contract
// In Multiple Inhertence Like D is B,C,A The Rightmost Contract 
// Fucntionallitys are Inherted in This Case Above A's Fucntionalilties will be used 
// And in "override" keyword order Of Contract Must Be Provided Like "orverride(B,C,A)"
// In the Derived Contract functions
// We Call Call external fucntion with inhetence
// We Have To Initiate That Contract to call the External Function
// It Does Not Matter We Have inherted That Contract For External Fucntions
contract A {
    // A Is Our Base Contarct
    function sum(uint a, uint b) public pure returns(uint){
        // Fucntion 'sum()' Is a Public function
        // So Can Accesed in Any Deriived Contract
        // But It cannot Be override bacause This Function has not
        // "virtual" Keyword 
        return a+b;
    }
    function sub(uint a, uint b) public virtual pure returns(uint){
        // This function "sub()" function is also a public fucntion
        // this fucntion has "virtual" That means it Can
        // Be override in the Derived Contract.
        return a-b;
    }
    function div(uint a, uint b) public virtual pure returns(uint){
        // Same As "sub()" fucntion
        return a/b;
    }
    function mul(uint a, uint b) private  pure returns(uint){
        // This Fucntion "mul()" has Private visibilty
        // Which it Cannot Be Accesable In the derived Contarcts
        return a*b;
    }

    function setname(string memory _name) external pure returns (string memory) {
        return string.concat(_name, " is passed as parameter in the function");
    }

}


contract B is A{
    // B Is Derived Contract Which Inherites From Contract A
    function subnum(uint a, uint b) public pure returns (uint){
        // A Simple Fucntion of Contarct B
        return sub(a,b);
    }
    function sub(uint a, uint b) public virtual  pure override returns(uint){
        // This "sub()" is 'override' from base contarct A
        // Note: To override a finction from base contract
        //       function name, parameters, viisbiltis , state mutibilty 
        //       must be same as base Contract
        // As it Is Overiiding From A's So keyword "override" is used here
        // virtual keyword in this contract specify that this function
        // can be again overrided when any contract inherties this contarct 
        // like Contract X is B
        uint r = a*a;
        uint s = b*b;

        return r-s;
    }
 
}

contract C is A{
    // Here Contract C inhertes From Contract A
    // Which Meas A is base Contract And C Is Derive Contract
    function div(uint a, uint b) public virtual pure override  returns(uint) {
        // Can Be Defined Same As Contarct B's
        // sub() Function
        uint r = a+b;
        return (a+b)/r;
    }

    function sub(uint a,uint b) public virtual pure override returns (uint){
        // Can Be Defined Same As Contarct B's
        // sub() Function
        require((a%2==0) || (b%2==0), "One Number Must Be Even To Do Subtraction");
        return a-b;
    }
}

contract D is B,C {
    // Here D Is Inherted From Both B, And C
    // But As C is righMost Contarct here
    // Fucntionalities We Want To Use Here Will be
    // Used From C
     function div(uint a, uint b) public virtual pure override(A,C)  returns(uint) {
        // This "div()" function override from both A,C because "div()"
        // is first Defined In The A and it has override features from C
        // that why we have specify override(A,C) Not be Here
        // beacuse B dose not have overrided "div()"
        // We have Also To Specify Super() here 
        // beacasue Super() deifnes The the div() from Contract C Is 
        // Used Beacsue Of C is Teh Rigth Bost Contrcat in the Inherited 
        // in Contarct D is B,C 
        // Rest of Things in This Function
        // Are Same As Conracts B And C's 
        
       return super.div(a,b);
    }

    function sub(uint a, uint b) public  override(B,C) pure returns (uint) {
        return super.sub(a,b);
    }
}
contract E is C,B {

    
    function div(uint a, uint b) public virtual pure override(A,C)  returns(uint) {
        // Same as Contradt D "div()"
        // Defination stated Above
       return super.div(a,b);
    }

    function sub(uint a, uint b) public  override(C,B) pure returns (uint) {
        // Same as Contradt D "sub()"
        // Defination stated Above
        // But Here Is Slightly Different We have Changed 
        // The Order Of Sequnce C,B 
        // B is The Rightmost Contract So
        // So B's "sub()" will be used Here .
        return super.sub(a,b);
    }

}

contract F is A{
    // F Is Inherited From A 
    // A has A External Fucntion Refrenced As "setname()"
    function getname(string memory _name) public  returns(string memory) {
        // Initiating Contract A To use Its External function
        // "setname()" in This "getname()" fucntion
        // Beacuse For External Function it Not Possile Direct call 
        // Like super.setname(), or "setname()" lIke These
        A a = new A();
        return a.setname(_name);
    }
    
}



