//SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/security/ReentrancyGuard.sol";
import "@openzeppelin/contracts/utils/Strings.sol";
import "erc721a/contracts/ERC721A.sol";

contract  DarkMartyrs is ERC721A, Ownable, ReentrancyGuard {
    using Strings for uint256;
    string public baseURI;
    uint256 public price = 0.007 ether;
    uint256 public maxMintPerWallet = 2;
    uint256 public maxSupply = 222;
    bool public mintEnabled = false;

    constructor() ERC721A("Dark Martyrs", "DM") {}

    modifier eligible(uint256 _quantity) {
        require(msg.value >= (price * _quantity), "Incorrect price");
        require(_numberMinted(msg.sender) + _quantity <= maxMintPerWallet, "Amount exceeded");
        require(totalSupply() + _quantity <= maxSupply, "Sold Out!");
        _;
    }

    function _baseURI() internal view virtual override returns(string memory) {
        return baseURI;
    }

    function setBaseURI(string memory _baseTokenURI) external onlyOwner {
        baseURI = _baseTokenURI;
    }

    function mint(uint256 _quantity) external payable eligible(_quantity) {
        _safeMint(msg.sender, _quantity);
    }

    function tokenURI(uint256 _tokenId) public view virtual override returns(string memory) {
        require(_exists(_tokenId), "Invalid TokenId");
        string memory currentBaseURI = _baseURI();
        return bytes(currentBaseURI).length > 0 
        ? string(abi.encodePacked(currentBaseURI, _tokenId.toString(), ".json"))
        : "";
    }

    function setMintEnabled() external onlyOwner {
        mintEnabled = !mintEnabled;
    }

    function _startTokenId() internal view virtual override returns(uint256) {
        return 1;
    }

    function setMaxMintPerWallet(uint256 _maxMintPerWallet) external onlyOwner {
        maxMintPerWallet = _maxMintPerWallet; 
    }

    function setPrice(uint256 _newPrice) external onlyOwner {
        price = _newPrice;
    }

    function setMaxSupply(uint256 _maxSupply) external onlyOwner {
        maxSupply = _maxSupply;
    }

    function withdrawETH() external onlyOwner nonReentrant {
        (bool sent, ) = payable(owner()).call{ value: address(this).balance }("");
        require(sent, "Failed Transaction");
    }

    receive() external payable {}
    fallback() external payable {}
}