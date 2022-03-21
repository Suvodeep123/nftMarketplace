// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

/*
Building the mintiong functions

1. nft to point to an address
2. keep track of token ids
3. keep track of token onwer address to toekn ids
4. keep track of how many  tokens an onwer address has 
5. create an event that emits a 
transfer logs - contract address.where it is being minted to,the id 

*/

// import "./ERC721Ennumerable.sol";


contract ERC721 {
    

    //mapping from address to tokenids
    mapping(address => uint256) public _onwedTokensCount;

    //mapping from id to onwer 
    mapping(uint256 => address) private _tokenOnwer;

    //mapping from token to address
    mapping(uint256 =>address) private _tokenApprovals;

    event transfer(address indexed from ,address indexed to ,uint256 indexed tokenId);

    event approval(address indexed onwer,address indexed approvedAddress ,uint256 tokenId);

    function _isExists(uint256 tokenId) internal view returns(bool){
        address onwer = _tokenOnwer[tokenId];
        return onwer != address(0);
    }

    function _mint(address to,uint256 tokenId) internal virtual{
        require(!_isExists(tokenId));
        require(to != address(0));
        _onwedTokensCount[to] += 1;
        _tokenOnwer[tokenId] = to;
        // addTokenToOnwerEnumeration(msg.sender,tokenId);
        emit transfer(address(0), to, tokenId);
    }
    function balanceOf(address to) public view returns(uint256){
        require(to != address(0));
        return _onwedTokensCount[to];
    }
    function onwerOf(uint256 tokenId) public view returns(address){
        address onwer = _tokenOnwer[tokenId];
        require(onwer != address(0), 'owner query for non-existent token');
        return onwer;
    }

    function _send(address from,address to,uint256 tokenId) internal {
        require(onwerOf(tokenId) == from);
        require(onwerOf(tokenId) != to);
        require(from == msg.sender);
        require(to != address(0));
        _onwedTokensCount[to] += 1;
        _onwedTokensCount[from] -= 1;
        _tokenOnwer[tokenId] = to;
    
        _tokenApprovals[tokenId] = to;
        emit transfer(from, to, tokenId);
    }

    function send(address from,address to,uint256 tokenId) public {
        require(isOnwer(msg.sender,tokenId));
        _send(from, to, tokenId);
    }

/*
    //mapping from address to tokenids
    mapping(address => uint256) public _onwedTokensCount;

    //mapping from id to onwer 
    mapping(uint256 => address) private _tokenOnwer;

    //mapping from token to address
    mapping(uint256 =>address) private _tokenApprovals;

    event transfer(address indexed from ,address indexed to ,uint256 indexed tokenId);

    event approval(address indexed onwer,address indexed approvedAddress ,uint256 tokenId);
    */

    function isOnwer(address spender,uint256 tokenId) internal view returns(bool){
        address onwer = onwerOf(tokenId);
        require(onwer == msg.sender);
        return (onwer == spender);
    }



    function approve(address to,uint256 tokenId) public{
        require(to != address(0));
        require(onwerOf(tokenId) == msg.sender);
        _tokenApprovals[tokenId] = to;
        emit transfer(address(0), to, tokenId);
    }

    

























/*

    function exists(uint256 tokenId) internal view returns(bool){
        //setting the address of nft onwer to check the mapping 
        //of the address from tokenOnwer at the tokenId
        address onwer = _tokenOnwer[tokenId];
        //return truthiness that the address is not zero
        return onwer != address(0);
    }


    function _mint(address to ,uint256 _tokenId) internal  {
        require(to != address(0),"ERC721: minting to the zero address");
        require(!exists(_tokenId));
        _tokenOnwer[_tokenId] = to;
        _onwedTokensCount[to] +=1;
        emit tranferlogs(address(0), to, _tokenId);
    }

    function balanceof(address _of) public view returns(uint256){
        require(_of != address(0));
        return _onwedTokensCount[_of];
    }

    function onwerOf(uint256 tokenId) public view returns(address){
        address onwer = _tokenOnwer[tokenId];
        require(onwer != address(0));
        return onwer;
    }

    function approve(address to,uint256 tokenId) public {
        address onwer = onwerOf(tokenId);
        require(msg.sender == onwer);
        require(to != onwer,"Self transfer id not possible");
        _tokenApprovals[tokenId]  = to;

        emit approval(onwer, to, tokenId);

    }

*/

    



}