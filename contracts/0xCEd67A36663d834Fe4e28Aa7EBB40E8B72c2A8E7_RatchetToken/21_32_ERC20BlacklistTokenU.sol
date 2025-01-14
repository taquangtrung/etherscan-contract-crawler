// SPDX-License-Identifier: MIT
pragma solidity 0.8.9;

import "@openzeppelin/contracts-upgradeable/token/ERC20/ERC20Upgradeable.sol";
import "@openzeppelin/contracts-upgradeable/token/ERC20/extensions/draft-ERC20PermitUpgradeable.sol";
import "@openzeppelin/contracts-upgradeable/token/ERC20/extensions/ERC20VotesUpgradeable.sol";
import "./AuthorizableU.sol";

contract ERC20BlacklistTokenU is  AuthorizableU, ERC20Upgradeable, ERC20PermitUpgradeable, ERC20VotesUpgradeable {
    ////////////////////////////////////////////////////////////////////////
    // State variables
    ////////////////////////////////////////////////////////////////////////

    bool public isBlacklistChecking;
    mapping (address => bool) public isBlackListed; // for from address
    mapping (address => bool) public isWhiteListed; // for to address

    ////////////////////////////////////////////////////////////////////////
    // Events & Modifiers
    ////////////////////////////////////////////////////////////////////////

    event SetBlackList(address[] _users, bool _status);
    event AddedBlackList(address _user);
    event RemovedBlackList(address _user);

    event SetWhiteList(address[] _users, bool _status);
    event AddedWhiteList(address _user);
    event RemovedWhiteList(address _user);

    modifier whenBlacklistTransable(address _from, address _to) {
        require(isBlaclistTransable(_from, _to), "[email protected]: transfer isn't allowed");
        _;
    }

    ////////////////////////////////////////////////////////////////////////
    // Initialization functions
    ////////////////////////////////////////////////////////////////////////
    function __Blacklist_init() internal virtual initializer {
        __Authorizable_init();
        isBlacklistChecking = false;
    }

    ////////////////////////////////////////////////////////////////////////
    // External functions
    ////////////////////////////////////////////////////////////////////////

    function startBlacklist(bool _status) public onlyAuthorized {
        isBlacklistChecking = _status;
    }

    // Blacklist
    function setBlackList(address[] memory _addrs, bool _status) public onlyAuthorized {
        for (uint256 i; i < _addrs.length; ++i) {
            isBlackListed[_addrs[i]] = _status;
        }

        emit SetBlackList(_addrs, _status);
    }

    function addBlackList(address _toAdd) public onlyAuthorized {
        isBlackListed[_toAdd] = true;

        emit AddedBlackList(_toAdd);
    }

    function removeBlackList(address _toRemove) public onlyAuthorized {
        isBlackListed[_toRemove] = false;

        emit RemovedBlackList(_toRemove);
    }

    // Whitelist
    function setWhiteList(address[] memory _addrs, bool _status) public onlyAuthorized {
        for (uint256 i; i < _addrs.length; ++i) {
            isWhiteListed[_addrs[i]] = _status;
        }

        emit SetWhiteList(_addrs, _status);
    }

    function addWhiteList(address _toAdd) public onlyAuthorized {
        isWhiteListed[_toAdd] = true;

        emit AddedWhiteList(_toAdd);
    }

    function removeWhiteList (address _toRemove) public onlyAuthorized {
        isWhiteListed[_toRemove] = false;

        emit RemovedWhiteList(_toRemove);
    }

    function isBlaclistTransable(address _from, address _to) public view returns (bool) {
        if (isBlacklistChecking) {
            // require(!isBlackListed[_from], "[email protected]: _from is in isBlackListed");
            // require(!isBlackListed[_to] || isWhiteListed[_to], "[email protected]: _to is in isBlackListed");
            require(!isBlackListed[_from] || isWhiteListed[_to], "[email protected]: _from is in isBlackListed");
        }
        return true;
    }

    ////////////////////////////////////////////////////////////////////////
    // Internal functions
    ////////////////////////////////////////////////////////////////////////

    function _transfer(address _from, address _to, uint256 _amount) internal virtual override whenBlacklistTransable(_from, _to) {
        super._transfer(_from, _to, _amount);
    }

    function _afterTokenTransfer(address from, address to, uint256 amount)
        internal
        override(ERC20Upgradeable, ERC20VotesUpgradeable)
    {
        super._afterTokenTransfer(from, to, amount);
    }

    function _mint(address to, uint256 amount)
        internal
        override(ERC20Upgradeable, ERC20VotesUpgradeable)
    {
        super._mint(to, amount);
    }

    function _burn(address account, uint256 amount)
        internal
        override(ERC20Upgradeable, ERC20VotesUpgradeable)
    {
        super._burn(account, amount);
    }
}