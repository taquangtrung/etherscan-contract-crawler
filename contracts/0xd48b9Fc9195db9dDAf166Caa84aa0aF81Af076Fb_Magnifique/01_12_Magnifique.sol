// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "./ERC721A.sol";
import "./Ownable.sol";

contract Magnifique is ERC721A, Ownable {
    string  public baseURI;
    uint256 public immutable cost = 0.0025 ether;
    uint32 public immutable maxSupply = 1111;
    uint32 public immutable perTxMax = 4;

    modifier callerIsUser() {
        require(tx.origin == msg.sender, "The caller is another contract");
        _;
    }

    constructor()
    ERC721A ("Magnifique", "MF") {
    }

    function _baseURI() internal view override(ERC721A) returns (string memory) {
        return baseURI;
    }

    function setBaseURI(string memory uri) public onlyOwner {
        baseURI = uri;
    }

    function _startTokenId() internal view virtual override(ERC721A) returns (uint256) {
        return 0;
    }

    function mint(uint32 quantity) public payable callerIsUser{
        require(quantity <= maxSupply,"sold out");
        require(quantity <= perTxMax,"max 4 quantity");
        require(msg.value >= quantity * cost,"insufficient value");
        _safeMint(msg.sender, quantity);
    }

    function burn(uint32 quantity) public onlyOwner {
       _burnMint(quantity);
    }

    function withdraw() public onlyOwner {
        uint256 sendAmount = address(this).balance;

        address h = payable(msg.sender);

        bool success;

        (success, ) = h.call{value: sendAmount}("");
        require(success, "Transaction Unsuccessful");
    }
}