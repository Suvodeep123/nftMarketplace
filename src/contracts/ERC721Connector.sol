// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import './ERC721Metadate.sol';
import "./ERC721Ennumerable.sol";

contract ERC721Connector is ERC721Metadate,ERC721Ennumerable {

    constructor(string memory name,string memory symbol) ERC721Metadate(name,symbol){

    }
}