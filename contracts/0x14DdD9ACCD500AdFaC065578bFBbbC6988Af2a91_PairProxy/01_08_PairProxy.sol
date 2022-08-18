// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.8.4;

import "@openzeppelin/contracts/proxy/beacon/BeaconProxy.sol";
import "./IBeaconSetter.sol";

contract PairProxy is BeaconProxy {
  // Cannot pass any constructor arguments as that will affect
  // address generated by CREATE2 op, IBeaconSetter is used instead
  // to fetch the beacon address on runtime and maintain a predictable
  // address
  constructor() payable 
    BeaconProxy(IBeaconSetter(msg.sender).beacon(), "") {
      _changeAdmin(msg.sender);
     }

  /**
    * @dev Accept ETH to be transfered to this contract address
    * Does not automatically delegate
    * TODO determine the cause for this function not being delegated
    */
  receive() external payable override { }
}