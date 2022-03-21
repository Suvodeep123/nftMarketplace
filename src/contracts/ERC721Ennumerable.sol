// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "./ERC721.sol";

contract ERC721Ennumerable is ERC721{

    mapping(uint256 =>uint256) private _allTokensIndex; // tokenId to position
    mapping(address=>uint256[]) private _onwedTokens; //owner to the all tokens([])
    mapping(uint256=>uint256) private _onwedTokensIndex; // tokenId to index the onwer (token) list !

    uint256 [] public _allTokens;

    function _mint(address to,uint256 tokenId)internal override(ERC721){
        super._mint(to,tokenId);
        addTokenToOnwerEnumeration(tokenId);
        addTokenToOnwerEnumeration(to, tokenId);
    }

    function addTokenToOnwerEnumeration(uint256 tokenId) internal{
        _allTokensIndex[tokenId] = _allTokens.length;
        _allTokens.push(tokenId); 
    }

    function addTokenToOnwerEnumeration(address to,uint256 tokenId) internal {
        _onwedTokensIndex[tokenId] = _onwedTokens[to].length;
        _onwedTokens[to].push(tokenId);
    }

    function tokenByIndex(uint256 tokenId) public view returns(uint256){
        require(tokenId < totalSupply());
        return _allTokens[tokenId];
    }

    function totalSupply() public view returns(uint256){
        return _allTokens.length;
    }

   function tokenByOnwerEnumeration(address to,uint256 tokenId) public view returns(uint256){
       require(onwerOf(tokenId) == to);
       return  _onwedTokens[to][tokenId];
   }














/*


// a function that help us to get the token from the _allTokens array
    function tokenByIndex(uint256 _index) external view returns (uint256){
        require(_index < totalSupply());
        return _allTokens[_index];
    }


// a function that returns token onwer index
    function tokenOfOwnerByIndex(address _owner, uint256 _index) external view returns (uint256){
        require(_index < balanceOf(_owner));
        require(_owner != address(0));
            return _onwedTokens[_owner][_index] ;

    }

    function _mint(address to ,uint256 _tokenId) internal override(ERC721){
         super._mint(to,_tokenId); 

         //1 add token to the onwer

         //2 add tokens to all tokens (totakSupply)
         addTokensToTokenEnumeration(_tokenId);
         addTokenToOnwerEnumeration(_tokenId,to);
    }


// add tokens to the _alltokens array and set the positions of the tokens indexes
    function addTokensToTokenEnumeration(uint256 tokenId) private {
        _allTokensIndex[tokenId] = _allTokens.length;
        _allTokens.push(tokenId);
    }

//return the total Supply of the all token array
    function totalSupply() public view returns (uint256){
        return _allTokens.length;
    }

    function addTokenToOnwerEnumeration(uint256 tokenID,address to) private{
    //add address and token id to the _onwedTokens;
    _onwedTokens[to].push(tokenID);
    //2. _onwedTokensIndex tokenId set to address of onwedTokens position
    _onwedTokensIndex[tokenID] = _onwedTokens[to].length; // .length is for the position
    // we want to execute the function with mintting
}




*/













   

    


   





}