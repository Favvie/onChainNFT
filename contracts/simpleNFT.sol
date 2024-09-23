// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.4;

import "@openzeppelin/contracts/utils/Strings.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
// import "@openzeppelin/contracts/utils/Counters.sol";
import "@openzeppelin/contracts/access/Ownable.sol";


contract simpleNFT is ERC721URIStorage {
    uint256 private _tokenIds;  // Token ID counter
    address public owner;

    constructor() ERC721("ContractNftTest", "CNT") {
        owner = msg.sender;
    }

    function mint() public returns (uint) {
        require(_tokenIds < 10000, "No more NFTs can be minted");
        _tokenIds++;
        uint256 newItemId = _tokenIds;
        // string memory tokenURI = "https://ipfs.io/ipfs/QmTBFrmexeAHbBMgrD81NXRretDAu9MHj5mfqW8rDm5ssf/metadata/2.json";
        string memory tokenURI = "https://ipfs.io/ipfs/Qmby76dXQbt7Dyt8xCcZRkSv9fXKiVs8Zv7hkTt6GsAQd1";
        _mint(msg.sender, newItemId);
        _setTokenURI(newItemId, tokenURI);
        return newItemId;
    }
}