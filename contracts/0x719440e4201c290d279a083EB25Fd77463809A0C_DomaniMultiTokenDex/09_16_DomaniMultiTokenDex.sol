// SPDX-License-Identifier: MIT

pragma solidity ^0.7.6;
pragma experimental "ABIEncoderV2";

import {IERC20} from "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import {IDomaniMultiTokenDex} from "./interfaces/IDomaniMultiTokenDex.sol";
import {IWNative} from "./interfaces/IWNative.sol";
import {SafeMath} from "@openzeppelin/contracts/math/SafeMath.sol";
import {SafeERC20} from "@openzeppelin/contracts/token/ERC20/SafeERC20.sol";
import {ExplicitERC20} from "../lib/ExplicitERC20.sol";
import {Address} from "@openzeppelin/contracts/utils/Address.sol";
import {DelegateCall} from "./lib/DelegateCall.sol";
import {PreciseUnitMath} from "../lib/PreciseUnitMath.sol";
import {DomaniDexConstants} from "./lib/DomaniDexConstants.sol";
import {Ownable} from "@openzeppelin/contracts/access/Ownable.sol";
import {ReentrancyGuard} from "@openzeppelin/contracts/utils/ReentrancyGuard.sol";

/**
 * @title DomaniMultiTokenDex
 * @author Domani Protocol
 *
 * DomaniMultiTokenDex is a smart contract used to swap generic native/ERC20 with multi tokens
 * and multi tokens for a generic native/ERC20
 *
 */
contract DomaniMultiTokenDex is IDomaniMultiTokenDex, Ownable, ReentrancyGuard {
  using SafeMath for uint256;
  using SafeERC20 for IERC20;
  using Address for address payable;
  using DelegateCall for address;
  using PreciseUnitMath for uint256;

  struct TempBuyArgs {
    bool isNativeInput;
    uint256 startingAmount;
    uint256 remainingInputAmount;
    Swap swap;
    bool isNativeOutput;
    address dexAddress;
    SwapParams swapParams;
    bytes result;
    ReturnValues returnValues;
    SwapToken[] tokensBought;
  }

  struct TempSellArgs {
    bool isNativeOutput;
    Swap swap;
    bool isNativeInput;
    address dexAddress;
    SwapParams swapParams;
    bytes result;
    ReturnValues returnValues;
    SwapToken[] tokensSold;
  }

  string private constant EXACT_INPUT_SIG =
    "swapExactInput(bytes,(uint256,uint256,bytes,bool,uint256,address))";

  string private constant EXACT_OUTPUT_SIG =
    "swapExactOutput(bytes,(uint256,uint256,bytes,bool,uint256,address))";

  IWNative public immutable override wNative;

  mapping(bytes32 => Implementation) private idToImplementation;

  uint64 fee;

  address feeRecipient;

  /**
   * Set initial variables
   * @param _wNative Wrapper of the native token of the blockchain
   * @param _owner Owner of the dex
   * @param _fee Fee precentage
   * @param _feeRecipient Recipient address to which receives fees
   */
  constructor(
    IWNative _wNative,
    address _owner,
    uint64 _fee,
    address _feeRecipient
  ) {
    wNative = _wNative;
    transferOwnership(_owner);
    _setFee(_fee);
    _setFeeRecipient(_feeRecipient);
  }

  receive() external payable {}

  /**
   * Register the specific implementation for a dex by owner
   * @param _identifier Name of dex identifier to register
   * @param _dexAddr Address of the dex implementation to register
   * @param _dexInfo Specific info of the dex that will be used in the swaps
   */
  function registerImplementation(
    string calldata _identifier,
    address _dexAddr,
    bytes calldata _dexInfo
  ) external onlyOwner() {
    require(_dexAddr != address(0), "Implementation address can not be the 0x00");
    Implementation storage implementation = idToImplementation[keccak256(abi.encode(_identifier))];
    implementation.dexAddr = _dexAddr;
    implementation.dexInfo = _dexInfo;
    emit ImplementationRegistered(_identifier, _dexAddr, _dexInfo);
  }

  /**
   * Remove a registered implementation
   * @param _identifier Name of dex identifier to remove
   */
  function removeImplementation(string calldata _identifier) external onlyOwner() {
    bytes32 identifierHash = keccak256(abi.encode(_identifier));
    require(
      idToImplementation[identifierHash].dexAddr != address(0),
      "Implementation with this id is not registered"
    );
    delete idToImplementation[identifierHash];
    emit ImplementationRemoved(_identifier);
  }

  /**
   * Set fee perecentage by owner
   * @param _newFee Fee percentage
   */
  function setFee(uint64 _newFee) external onlyOwner {
    _setFee(_newFee);
  }

  /**
   * Set fee recipient that receives tokens generated by the fees
   * @param _feeRecipient Address to which receive tokens
   */
  function setFeeRecipient(address _feeRecipient) external onlyOwner {
    _setFeeRecipient(_feeRecipient);
  }

  /**
   * Swap a generic ERC20/native token for a quantity of multi tokens
   * @param _inputMultiTokenDexParams See InputDexParams in IDomaniMultiTokenDex
   * @return inputAmountUsed Amount of the token used for buying the multi tokens
   * @return feeAmount Amount of fees paid for the swap
   */
  function buyMultiToken(InputMultiTokenDexParams calldata _inputMultiTokenDexParams)
    external
    payable
    override
    nonReentrant
    returns (uint256 inputAmountUsed, uint256 feeAmount)
  {
    require(block.timestamp <= _inputMultiTokenDexParams.expiration, "Transaction expired");
    require(_inputMultiTokenDexParams.swaps.length > 0, "No tokens passed");

    TempBuyArgs memory tempBuyArgs;
    tempBuyArgs.isNativeInput =
      address(_inputMultiTokenDexParams.swapToken) == DomaniDexConstants.NATIVE_ADDR;

    if (!tempBuyArgs.isNativeInput) {
      require(msg.value == 0, "Native token not required for an ERC20 transfer");
      ExplicitERC20.transferFrom(
        _inputMultiTokenDexParams.swapToken,
        msg.sender,
        address(this),
        _inputMultiTokenDexParams.maxOrMinSwapTokenAmount
      );
    }

    tempBuyArgs.startingAmount = tempBuyArgs.isNativeInput
      ? msg.value
      : _inputMultiTokenDexParams.maxOrMinSwapTokenAmount;
    tempBuyArgs.remainingInputAmount = tempBuyArgs.startingAmount;
    tempBuyArgs.tokensBought = new SwapToken[](_inputMultiTokenDexParams.swaps.length);
    Implementation storage implementation;

    for (uint256 i = 0; i < _inputMultiTokenDexParams.swaps.length; i++) {
      tempBuyArgs.swap = _inputMultiTokenDexParams.swaps[i];
      require(
        _inputMultiTokenDexParams.swapToken != tempBuyArgs.swap.token,
        "Input and output tokens are the same"
      );
      tempBuyArgs.tokensBought[i] = SwapToken(
        address(tempBuyArgs.swap.token),
        tempBuyArgs.swap.amount
      );
      tempBuyArgs.isNativeOutput =
        address(tempBuyArgs.swap.token) == DomaniDexConstants.NATIVE_ADDR;
      if (tempBuyArgs.isNativeInput && address(tempBuyArgs.swap.token) == address(wNative)) {
        wNative.deposit{value: tempBuyArgs.swap.amount}();
        tempBuyArgs.remainingInputAmount = tempBuyArgs.remainingInputAmount.sub(
          tempBuyArgs.swap.amount
        );
        tempBuyArgs.swap.token.safeTransfer(
          _inputMultiTokenDexParams.recipient,
          tempBuyArgs.swap.amount
        );
      } else if (
        tempBuyArgs.isNativeOutput &&
        address(_inputMultiTokenDexParams.swapToken) == address(wNative)
      ) {
        wNative.withdraw(tempBuyArgs.swap.amount);
        tempBuyArgs.remainingInputAmount = tempBuyArgs.remainingInputAmount.sub(
          tempBuyArgs.swap.amount
        );
        payable(_inputMultiTokenDexParams.recipient).sendValue(tempBuyArgs.swap.amount);
      } else {
        implementation = idToImplementation[keccak256(abi.encode(tempBuyArgs.swap.identifier))];
        tempBuyArgs.dexAddress = implementation.dexAddr;
        require(tempBuyArgs.dexAddress != address(0), "Implementation not supported");
        tempBuyArgs.swapParams = SwapParams(
          tempBuyArgs.swap.amount,
          tempBuyArgs.remainingInputAmount,
          tempBuyArgs.swap.swapData,
          tempBuyArgs.isNativeInput,
          _inputMultiTokenDexParams.expiration,
          tempBuyArgs.isNativeOutput ? address(this) : _inputMultiTokenDexParams.recipient
        );
        tempBuyArgs.result = tempBuyArgs.dexAddress.functionDelegateCall(
          abi.encodeWithSignature(EXACT_OUTPUT_SIG, implementation.dexInfo, tempBuyArgs.swapParams)
        );
        tempBuyArgs.returnValues = abi.decode(tempBuyArgs.result, (ReturnValues));
        require(
          tempBuyArgs.returnValues.inputToken == address(_inputMultiTokenDexParams.swapToken),
          "Wrong input token in the swap"
        );
        if (!tempBuyArgs.isNativeOutput) {
          require(
            tempBuyArgs.returnValues.outputToken == address(tempBuyArgs.swap.token),
            "Wrong output token in the swap"
          );
        } else {
          require(
            tempBuyArgs.returnValues.outputToken == address(wNative),
            "Wrong native output token in the swap"
          );
          wNative.withdraw(tempBuyArgs.swap.amount);
          payable(_inputMultiTokenDexParams.recipient).sendValue(tempBuyArgs.swap.amount);
        }
        tempBuyArgs.remainingInputAmount = tempBuyArgs.remainingInputAmount.sub(
          tempBuyArgs.returnValues.inputAmount
        );
      }
    }

    inputAmountUsed = tempBuyArgs.startingAmount.sub(tempBuyArgs.remainingInputAmount);

    feeAmount = inputAmountUsed.preciseMul(fee);

    tempBuyArgs.remainingInputAmount = tempBuyArgs.remainingInputAmount.sub(feeAmount);

    if (tempBuyArgs.isNativeInput) {
      payable(feeRecipient).sendValue(feeAmount);
      if (tempBuyArgs.remainingInputAmount > 0) {
        msg.sender.sendValue(tempBuyArgs.remainingInputAmount);
      }
    } else {
      _inputMultiTokenDexParams.swapToken.safeTransfer(feeRecipient, feeAmount);
      if (tempBuyArgs.remainingInputAmount > 0) {
        _inputMultiTokenDexParams.swapToken.safeTransfer(
          msg.sender,
          tempBuyArgs.remainingInputAmount
        );
      }
    }

    emit MultiTokenBought(
      msg.sender,
      SwapToken(address(_inputMultiTokenDexParams.swapToken), inputAmountUsed),
      _inputMultiTokenDexParams.recipient,
      tempBuyArgs.tokensBought,
      feeAmount
    );
  }

  /**
   * Swap multi tokens for generic ERC20/native token
   * @param _inputMultiTokenDexParams See InputDexParams in IDomaniMultiTokenDex
   * @return outputAmountReceived Amount of the ERC20 received from the multi-token selling
   * @return feeAmount Amount of fees paid for the swap
   */
  function sellMultiToken(InputMultiTokenDexParams calldata _inputMultiTokenDexParams)
    external
    payable
    override
    nonReentrant
    returns (uint256 outputAmountReceived, uint256 feeAmount)
  {
    require(block.timestamp <= _inputMultiTokenDexParams.expiration, "Transaction expired");
    require(_inputMultiTokenDexParams.swaps.length > 0, "No tokens passed");

    TempSellArgs memory tempSellArgs;
    tempSellArgs.isNativeOutput =
      address(_inputMultiTokenDexParams.swapToken) == DomaniDexConstants.NATIVE_ADDR;
    tempSellArgs.tokensSold = new SwapToken[](_inputMultiTokenDexParams.swaps.length);
    Implementation storage implementation;

    for (uint256 i = 0; i < _inputMultiTokenDexParams.swaps.length; i++) {
      tempSellArgs.swap = _inputMultiTokenDexParams.swaps[i];
      require(
        _inputMultiTokenDexParams.swapToken != tempSellArgs.swap.token,
        "Input and output tokens are the same"
      );
      tempSellArgs.tokensSold[i] = SwapToken(
        address(tempSellArgs.swap.token),
        tempSellArgs.swap.amount
      );
      tempSellArgs.isNativeInput =
        address(tempSellArgs.swap.token) == DomaniDexConstants.NATIVE_ADDR;
      if (!tempSellArgs.isNativeInput) {
        ExplicitERC20.transferFrom(
          tempSellArgs.swap.token,
          msg.sender,
          address(this),
          tempSellArgs.swap.amount
        );
      }
      if (tempSellArgs.isNativeOutput && address(tempSellArgs.swap.token) == address(wNative)) {
        wNative.withdraw(tempSellArgs.swap.amount);
        outputAmountReceived = outputAmountReceived.add(tempSellArgs.swap.amount);
      } else if (
        tempSellArgs.isNativeInput &&
        address(_inputMultiTokenDexParams.swapToken) == address(wNative)
      ) {
        wNative.deposit{value: tempSellArgs.swap.amount}();
        outputAmountReceived = outputAmountReceived.add(tempSellArgs.swap.amount);
      } else {
        implementation = idToImplementation[keccak256(abi.encode(tempSellArgs.swap.identifier))];
        tempSellArgs.dexAddress = implementation.dexAddr;
        require(tempSellArgs.dexAddress != address(0), "Implementation not supported");
        if (tempSellArgs.isNativeInput) {
          wNative.deposit{value: tempSellArgs.swap.amount}();
        }
        tempSellArgs.swapParams = SwapParams(
          tempSellArgs.swap.amount,
          0,
          tempSellArgs.swap.swapData,
          tempSellArgs.isNativeOutput,
          _inputMultiTokenDexParams.expiration,
          address(this)
        );
        tempSellArgs.result = tempSellArgs.dexAddress.functionDelegateCall(
          abi.encodeWithSignature(EXACT_INPUT_SIG, implementation.dexInfo, tempSellArgs.swapParams)
        );
        tempSellArgs.returnValues = abi.decode(tempSellArgs.result, (ReturnValues));
        require(
          tempSellArgs.returnValues.outputToken == address(_inputMultiTokenDexParams.swapToken),
          "Wrong output token in the swap"
        );
        !tempSellArgs.isNativeInput
          ? require(
            tempSellArgs.returnValues.inputToken == address(tempSellArgs.swap.token),
            "Wrong input token in the swap"
          )
          : require(
            tempSellArgs.returnValues.inputToken == address(wNative),
            "Wrong native input token in the swap"
          );
        outputAmountReceived = outputAmountReceived.add(tempSellArgs.returnValues.outputAmount);
      }
    }

    feeAmount = outputAmountReceived.preciseMul(fee);

    outputAmountReceived = outputAmountReceived.sub(feeAmount);

    require(
      outputAmountReceived >= _inputMultiTokenDexParams.maxOrMinSwapTokenAmount,
      "Amount received less than minimum"
    );

    if (tempSellArgs.isNativeOutput) {
      payable(feeRecipient).sendValue(feeAmount);
      payable(_inputMultiTokenDexParams.recipient).sendValue(outputAmountReceived);
    } else {
      _inputMultiTokenDexParams.swapToken.safeTransfer(feeRecipient, feeAmount);
      _inputMultiTokenDexParams.swapToken.safeTransfer(
        _inputMultiTokenDexParams.recipient,
        outputAmountReceived
      );
    }

    emit MultiTokenSold(
      msg.sender,
      tempSellArgs.tokensSold,
      _inputMultiTokenDexParams.recipient,
      SwapToken(address(_inputMultiTokenDexParams.swapToken), outputAmountReceived),
      feeAmount
    );
  }

  /**
   * Swap a quantity of a Domani fund for a generic ERC20
   * @param _token Address of the token to sweep (for native token use NATIVE_ADDR)
   * @param _recipient Address receiving the amount of token
   * @return Amount of token received
   */
  function sweepToken(IERC20 _token, address payable _recipient)
    external
    override
    nonReentrant
    returns (uint256)
  {
    bool isETH = address(_token) == DomaniDexConstants.NATIVE_ADDR;
    uint256 balance = isETH ? address(this).balance : _token.balanceOf(address(this));
    if (balance > 0) {
      if (isETH) {
        _recipient.sendValue(balance);
      } else {
        _token.safeTransfer(_recipient, balance);
      }
    }
    return balance;
  }

  /**
   * Get address and info of a supported dex
   * @param _identifier Name of dex identifier to get
   * @return See Implementation struct in IDomaniDexGeneral
   */
  function getImplementation(string calldata _identifier)
    external
    view
    override
    returns (Implementation memory)
  {
    return idToImplementation[keccak256(abi.encode(_identifier))];
  }

  /**
   * Get fee percentage charge during buying/selling
   * @return Fee percentage
   */
  function getFee() external view override returns (uint64) {
    return fee;
  }

  /**
   * Get address that will receive the fees
   * @return Address will receive fees
   */
  function getFeeRecipient() external view override returns (address) {
    return feeRecipient;
  }

  /**
   * Get the dummy address to identify native token
   * @return Address used fot native token
   */
  function nativeTokenAddress() external pure override returns (address) {
    return DomaniDexConstants.NATIVE_ADDR;
  }

  function _setFee(uint64 _newFee) internal {
    require(_newFee < 10**18, "Fee must be less than 100%");
    uint64 actualFee = fee;
    require(actualFee != _newFee, "Fee already set");
    fee = _newFee;
    emit FeeSet(actualFee, _newFee);
  }

  function _setFeeRecipient(address _feeRecipient) internal {
    require(_feeRecipient != address(0), "Fee recipient can not be 0x00");
    address actualRecipient = feeRecipient;
    require(actualRecipient != _feeRecipient, "Fee recipient already set");
    feeRecipient = _feeRecipient;
    emit FeeRecipientSet(actualRecipient, _feeRecipient);
  }
}