// SPDX-License-Identifier: GPL-2.0-or-later
pragma solidity 0.6.12;

import "../proxy/TitanProxy.sol";
import "../storage/AuctionStorage.sol";

contract AuctionHall is TitanProxy, AuctionStorage {
    constructor(
        address _SAVIOR,
        address _implementation,
        address _shorterBone
    ) public TitanProxy(_SAVIOR, _implementation) {
        shorterBone = IShorterBone(_shorterBone);
    }
}