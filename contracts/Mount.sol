pragma solidity ^0.8.19;

import "./ERC721.sol";

contract mount is ERC721 {
    string public name;
    string public symbol;
    mapping (uint => string) private _tokenURIs;
    uint256 public tokenCount;
    constructor( string memory _name, string memory _symbol){
        name = _name;
        symbol = _symbol;
    }
    function tokenURI( uint256 tokenId) public view returns(string memory){
        require(ownerShip[tokenId] != address(0), "NFT is not exsit");
        return _tokenURIs[tokenId];
    }
    function mint( string memory _tokenURI) public {
        tokenCount += 1; //tokenID
        balance[msg.sender] += 1;
        ownerShip[tokenCount] = msg.sender;
        _tokenURIs[tokenCount] = _tokenURI;

        emit Transfer(address(0), msg.sender, tokenCount);
    }
    function supportInterface(bytes4 interfaceId) public pure override returns(bool){
        return interfaceId == 0x80ac58cd || interfaceId == 0x5b5e139f;
    }

}