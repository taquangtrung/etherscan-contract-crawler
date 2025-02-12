pragma solidity ^0.8.1;

import "@openzeppelin/contracts/token/ERC721/presets/ERC721PresetMinterPauserAutoId.sol";

contract DryadesNFT is ERC721PresetMinterPauserAutoId {
  constructor() ERC721PresetMinterPauserAutoId('DryadesNFT', 'DRY', 'https://dryades-dao.s3.amazonaws.com/erc721-token-metadata/') {}

  function tokenURI(uint256 tokenId) public view virtual override returns (string memory) {
    return string(abi.encodePacked(super.tokenURI(tokenId), ".json"));
  }
}