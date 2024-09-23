// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721Burnable.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract MyToken is ERC721, ERC721URIStorage, ERC721Burnable, Ownable {
    uint256 private _tokenIds;  

    constructor(address initialOwner)
        ERC721("MyNft", "MNT")
        Ownable(initialOwner)
    {}

    function safeMint(address to, uint256 tokenId, string memory uri)
        public
        onlyOwner
    {
        _safeMint(to, tokenId);
        _setTokenURI(tokenId, uri);
    }

    // function mint() public returns (uint) {
    //     require(_tokenIds < 10000, "No more NFTs can be minted");
    //     _tokenIds++;
    //     uint256 newItemId = _tokenIds;
        
    //     string memory tookenURI = "[[[https://ipfs.io/ipfs/Qmby76dXQbt7Dyt8xCcZRkSv9fXKiVs8Zv7hkTt6GsAQd1]]]";
    //     _mint(msg.sender, newItemId);
    //     _setTokenURI(newItemId, tookenURI);
    //     return newItemId;
    // }

    // function safeMint()
    //     public
        
    // {
    //     string memory uri = "https://ipfs.io/ipfs/Qmby76dXQbt7Dyt8xCcZRkSv9fXKiVs8Zv7hkTt6GsAQd1";
    //     require(_tokenIds < 10000, "No more NFTs can be minted");
    //     _tokenIds++;
    //     uint256 newItemId = _tokenIds;

    //     _safeMint(msg.sender, newItemId);
    //     _setTokenURI(newItemId, uri);
    // }


    // The following functions are overrides required by Solidity.

    function tokenURI(uint256 tokenId)
        public
        view
        override(ERC721, ERC721URIStorage)
        returns (string memory)
    {
        return super.tokenURI(tokenId);
    }

    function supportsInterface(bytes4 interfaceId)
        public
        view
        override(ERC721, ERC721URIStorage)
        returns (bool)
    {
        return super.supportsInterface(interfaceId);
    }
}