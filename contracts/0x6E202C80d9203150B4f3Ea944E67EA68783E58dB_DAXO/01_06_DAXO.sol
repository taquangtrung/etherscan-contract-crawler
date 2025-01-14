// UNLICENSED
pragma solidity =0.8.6;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract DAXO is ERC20, Ownable {
    constructor(string memory name_, string memory symbol_)
        ERC20(name_, symbol_)
    {}

    function mint(address _recipient, uint256 _amount) external onlyOwner {
        _mint(_recipient, _amount);
    }
}