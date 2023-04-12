// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721Enumerable.sol";

contract NFTCollection is ERC721Enumerable, Ownable {

    // 1000 NFT
    // unique metadata for each NFT
    // pay ETH to mint NFT
    using Strings for uint256;
    uint256 maxSupply = 1000;
    uint256 cost = 0.001 ether;
    string baseURI = "https://ipfs.io/ipfs/QmRqvh78ub1NFoFQVmp1Xyj3HGs1zi54YN57Sne9UEwbRk/";
    constructor() ERC721("Students", "NFTCollection") {}

    function _baseURI() internal view override returns (string memory) {
        return baseURI;
    }

    function changeBaseURI(string memory _newBaseURI) onlyOwner public{
        baseURI = _newBaseURI;
    }

    function tokenURI(uint256 tokenId) public view virtual override returns (string memory) {
        _requireMinted(tokenId);
        require(tokenId >= 1 && tokenId <= 5);
        return bytes(baseURI).length > 0 ? string(abi.encodePacked(baseURI, tokenId.toString(), ".json")) : "";
    }

    function safeMint(address _to) public payable {
        uint256 _currentSupply = totalSupply();
        require(_currentSupply < maxSupply);
        require(msg.value == cost);
        _safeMint(_to, _currentSupply+1);
    }

    function withdraw() public onlyOwner {
        //payable(this).transfer(address(this).balance);
        (bool success, ) = payable(msg.sender).call{value:address(this).balance}("");
        require(success);
    } 
}