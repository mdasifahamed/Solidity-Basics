// SPDX-License-Identifier: MIT
pragma solidity >= 0.7.0 <0.9.0;

// Structs Are Special Type Of Data Type 
// Which Are Likes Objects In Other Language
// It Can Contain Different Data Type.
// It A User Dfined data type
// we can declare as it as data to delacre another Vararibale

// Mapping are special type Of Data Type 
// That Contain Data Key-Value Pair
// it is used keep track of sequecne 

contract A {
    // nft struct is structure
    // it contains data relete dto a nft 
    // it has diffrenent of data type
    //whic creat ca new data data type 
    struct NFT{
        string  name; 
        uint id;
        uint qunatity;
    }

    // we have decalre a dynamic sized array of
    // nft type which is hold eact nft struct in nfts arrays
    NFT[] public NFTS;

    // We Have A Maaping Callled nftToQuantity
    // Which Have key type String anD value type Uint
    // This mapping Will Keep track Of Which nft 
    // has How Many Quantity By Their Name 
    // In this The Nft Value Will Be The Key 
    // and The Quantiy Of That Nft Will Be The Value
    // Throg This We Can Get Quntiy Of A Nft by Their name 
    mapping(string => uint)  NFTToQunatity;

    function setNft(string memory _name, uint _id, uint _qunatity) public {
        NFT memory newnft = NFT(_name,_id,_qunatity);
        //or we can do 
        // NFTS.psuh(NFT(_name,_id,_qunatity))
        // But Add its Value To Mapping we Have To Do 
        // NFT memory newnft = NFT(_name,_id,_qunatity);
        // This gain So we Are Using NFT memory newnft = NFT(_name,_id,_qunatity) &
        // NFTS.push(newnft);
        NFTS.push(newnft);

        // Now Add the mapping Of Newly Craeted Nft 
        // with Its Name as Key And Its Quantity As Its Value

        NFTToQunatity[newnft.name] = newnft.qunatity;
        
        
    }

    function getNFTQuantiy(string memory _name) public view returns (uint){

        // Our Mapping Return Values is uint type so Our return Value type Is uint

        return NFTToQunatity[_name];
    }
    
}
