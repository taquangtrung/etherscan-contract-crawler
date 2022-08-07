// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

/// @title: Best friends forever
/// @author: manifold.xyz

import "./ERC721Creator.sol";

/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//                                                                                                                 //
//                                                                                                                 //
//                                                                                                                 //
//      ____              _      __        _                   _         __                                        //
//     |  _ \            | |    / _|      (_)                 | |       / _|                                       //
//     | |_) |  ___  ___ | |_  | |_  _ __  _   ___  _ __    __| | ___  | |_  ___   _ __  ___ __   __ ___  _ __     //
//     |  _ <  / _ \/ __|| __| |  _|| '__|| | / _ \| '_ \  / _` |/ __| |  _|/ _ \ | '__|/ _ \\ \ / // _ \| '__|    //
//     | |_) ||  __/\__ \| |_  | |  | |   | ||  __/| | | || (_| |\__ \ | | | (_) || |  |  __/ \ V /|  __/| |       //
//     |____/  \___||___/ \__| |_|  |_|   |_| \___||_| |_| \__,_||___/ |_|  \___/ |_|   \___|  \_/  \___||_|       //
//                                                                                                                 //
//                                                                                                                 //
//                                                                                                                 //
//                                                                                                                 //
//                                                                                                                 //
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


contract BFF is ERC721Creator {
    constructor() ERC721Creator("Best friends forever", "BFF") {}
}