// SPDX-License-Identifier: MIT
//------------------------------------------------------------------========================
//-----------------------------------------------------------------=========================
//-----------------------------------------------------------------=========================
//-----------------------------------=+++++=------------------------========================
//--------------------------------++=-:...:-+*--------------==++==-----=====================
//-----------------------------=*=........:::-#------==++==--:..:-=++-------------==========
//----------------------------*=..........::::=*=++==-:.............:+*-----------==========
//--------------------------=*...........::::::=-...................::=*----------==========
//--------------------------*...........::::::::::................:::::#----------==========
//-------------------------#..........:::::::::::::::.........:::::::::#---------===========
//------------------------+=.........:::::::::::::::::::::::::::::::::-#---------===========
//-----------------+=====+#.:::::::::::::::::::::::::::::::::::::::::-%+---------===========
//---------------+*.......::::::::::::::::::::::::::::::::::::::::::::.:-=+=-----===========
//---------------#::....::::::::::::::::::::::::::::::::::::::::::::::.....=*---------------
//---------------*=::::::::::::::::::::::::::::::::::::::::::::::::::.......=+--------------
//----------------+*=::::::::::::::::::::::::::::::::::::::::::::::::.......:*--------------
//----------------++-::::::::::::::::::::::::::-#++-::::::::::::::::::......==--------------
//----------------#...:::::::::::::::-=-===-==+*:::=+++-========::::::::::.:*---------------
//======----------*+==::::::::::::-+*:.......:#:::::::-*:.......==::::--=+++----------------
//========-::::::::--%:::::::::::.==*==+======+:::::::-*=======-=#::: #=--::::::::::::::::::
//========-:::::::::=#=+++++::::..+=::::::::::::::::::::::::::---#::. %:::::::::::::::::::::
//========-:::::::-*-:-==---*::...+-:::::-=-=+::::::::::::-=-::::#:.. #:::::::::::::::::::::
//=======-::::::::*::++--#--#::...*::::::*   -+:::::::::-*. .*-::#:..:*:::::::::::::::::::::
//======-::::::::-*.:*-:-*=-+=:.. #::::::*: .+-:::::::::-+   =-::*-..=+::::::::::::::::::..: 
//=====-::::::::::#.::++=----*--=+=:::::::-==::::::::::::=====::::*--*::::::::::::::::::::::      
//====-:::::::::::*:::#--==---==----::::::::::::::::::::::::::::::*--:::::::::::::::::::::::      
//===-:::::::::::::*-::==-----------+-:::::::::::::::::::::::::::*::::::::::::::::::::::::::        
//===-::::::::::::::=+=++=++--------=*+=-:::::::::::::::::::::::*:::::::::::::::::::::::::::        
//====-::::::::::::::::::::=*----------=+++++:::::::::::::::::++:::::::::::::::.....::::::::        
//======---::::::::::::::::::+*-------------::::::::::::::::=+-:::::::::::::.:::::::::::::::              
//===========---:::::::::::::::+*+-------------::::::::::-=+-::::::::::::::.::::::::::::::::                
//===============--::::::::::::::=#*+=--------------:-=++*+++=-::::::::::::.::::::::::::::::                
//=================-::::::::-=+++-:::-+++*++++++=====:*::::::-=++-:::::::::::::.............
//=================-:::::=++=::::::::::::-*-:........*-  ...::::.*-:::::::::::::::::::::::::
//=================-::::-#:::::::::::::::::++=-:::=++........::::.*-::::::::::::::::::::::::
//================-:::::*:  .:::::::::::::::::-===:::::::::::--:...*::::::::::::::::::::::::
//=============--::::::-*.     .:::-=:::::::::::::::::::::::::*::. .*:::::::::::::::::::::::
//=======-----:::::::::*-::::.....:==:::::::::::::::::::::....#:.   :*::::::::::::::::::::::
//--::::::::::::::::::-*::::.......*-:::::::::................*:..   -+:::::::::::::::::::::
//::::::::::::::::::::#-::::.......#......:::...............  ==::.-==%:::::::::::::::-----:
//::::::::::::::::::::**+===------:#     ................     .#++=-:.+=:::::::::::---------
//::::::::::::::::::::=+::::::-----+...        .....           #::.....*-:::::::::----------
//::::::::::::::::::::#::.........-+:::::::::......            +:.......#::::::::-----------
//:::::::::::::::::::-*::.........+-:::::::::..................-=:......:*:::::::-----------
//:::::::::::::::::::#-:......... *::::::::::...................*:...... ==::::::-----------


pragma solidity ^0.8.9;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/utils/Counters.sol";
import "@openzeppelin/contracts/security/ReentrancyGuard.sol";

contract SBNFTX is ERC721, Ownable, ReentrancyGuard {
    string private _collectionURI;
    string public baseURI;

    uint256 public supply = 0;
    uint256 public cost = 0.00 ether;

    mapping(uint256 => string) internal tokenUris;
    mapping(address => uint256) internal walletCap;

    using Counters for Counters.Counter;
    Counters.Counter private _tokenSupply;

    constructor(string memory _baseURI, string memory collectionURI) ERC721("SmallBrosNFT Exclusive", "SBNFT-X") {
        baseURI = _baseURI;
        _collectionURI = collectionURI;
    }

    // ============ PUBLIC READ-ONLY FUNCTIONS ============
    function tokenURI(uint256 tokenId)
      public
      view
      virtual
      override
      returns (string memory)
    {
      require(_exists(tokenId), "ERC721Metadata: query for nonexistent token");
      
      // Custom tokenURI exists
      if (bytes(tokenUris[tokenId]).length != 0) {
        return tokenUris[tokenId];
      }
      else {
        return string(abi.encodePacked(baseURI, Strings.toString(tokenId), ".json"));
      }
    }

    function totalSupply() public view returns (uint256) {
        return _tokenSupply.current();
    }

    function contractURI() public view returns (string memory) {
        return _collectionURI;
    }

    function numMintedForAddress(address addr) external view returns (uint256) {
        return walletCap[addr];
    }

    // ============ OWNER-ONLY ADMIN FUNCTIONS ============
    function mintToAddress(address _to, uint256 _mintAmount) external onlyOwner {
        require(_mintAmount > 0, "Error: You must mint more than 0 tokens.");
        require(_tokenSupply.current() + _mintAmount <= supply, "Error: Can't mint more than the max supply.");
        for (uint256 i = 0; i < _mintAmount; i++) {
            _tokenSupply.increment();
            _mint(_to, _tokenSupply.current());
        }
    }

    function setBaseURI(string memory _baseURI) external onlyOwner {
        baseURI = _baseURI;
    }

    function setCollectionURI(string memory collectionURI) internal virtual onlyOwner {
        _collectionURI = collectionURI;
    }

    function setTokenURI(uint256 _tokenId, string memory _uri) external onlyOwner {
        tokenUris[_tokenId] = _uri;
    }

    function setSupply(uint256 _newSupply) external onlyOwner {
        require(supply < _newSupply, "Error: You can only increase the supply.");
        supply = _newSupply;
    }

    function withdraw() public onlyOwner {
        uint256 balance = address(this).balance;
        payable(msg.sender).transfer(balance);
    }
}