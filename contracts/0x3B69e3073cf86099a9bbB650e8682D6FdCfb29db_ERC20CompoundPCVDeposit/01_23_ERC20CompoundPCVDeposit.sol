// SPDX-License-Identifier: GPL-3.0-or-later
pragma solidity ^0.8.0;

import {IERC20} from "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import {CompoundPCVDepositBase} from "./CompoundPCVDepositBase.sol";
import {CErc20} from "./CErc20.sol";
import {SafeERC20} from "@openzeppelin/contracts/token/ERC20/utils/SafeERC20.sol";

/// @title ERC-20 implementation for a Compound PCV Deposit
/// @author Fei Protocol
contract ERC20CompoundPCVDeposit is CompoundPCVDepositBase {
    /// @notice the token underlying the cToken
    IERC20 public immutable token;

    /// @notice Compound ERC20 PCV Deposit constructor
    /// @param _core Volt Core for reference
    /// @param _cToken Compound cToken to deposit
    constructor(address _core, address _cToken)
        CompoundPCVDepositBase(_core, _cToken)
    {
        token = IERC20(CErc20(_cToken).underlying());
    }

    /// @notice deposit ERC-20 tokens to Compound
    function deposit() external override whenNotPaused {
        uint256 amount = token.balanceOf(address(this));

        token.approve(address(cToken), amount);

        // Compound returns non-zero when there is an error
        require(
            CErc20(address(cToken)).mint(amount) == 0,
            "ERC20CompoundPCVDeposit: deposit error"
        );

        emit Deposit(msg.sender, amount);
    }

    function _transferUnderlying(address to, uint256 amount) internal override {
        SafeERC20.safeTransfer(token, to, amount);
    }

    /// @notice display the related token of the balance reported
    function balanceReportedIn() public view override returns (address) {
        return address(token);
    }
}