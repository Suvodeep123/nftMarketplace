// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "./ERC721Connector.sol";
// import "./ERC721.sol";

contract Kryptobird is ERC721Connector{

    constructor() ERC721Connector("Kryptobird","KBIRDZ") {
        
    }


   string [] public kryptobirds;

   mapping(string=>bool) public isAdded;

   function mint(string memory name) public {
       require(!isAdded[name]);
       kryptobirds.push(name);
       uint256 tokenId = kryptobirds.length - 1;
       _mint(msg.sender,tokenId);
       isAdded[name] = true;
   }





















/*
    mapping(string=>bool) public _kryptoBirdzExists;


    string[] public Kryptobirds;

    function mint(string memory _kryptoBird) public  {
        require(!_kryptoBirdzExists[_kryptoBird]);
        Kryptobirds.push(_kryptoBird);
        uint256 _id = Kryptobirds.length -1;
        _mint(msg.sender,_id);
        _kryptoBirdzExists[_kryptoBird] = true;
    }

*/

}