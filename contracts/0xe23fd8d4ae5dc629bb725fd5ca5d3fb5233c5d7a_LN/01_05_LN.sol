// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

/// @title: Luminous night
/// @author: manifold.xyz

import "./ERC721Creator.sol";

/////////////////////////////////////////////////////////////////////////////////////
//                                                                                 //
//                                                                                 //
//                                                                                 //
//      _                    _                               _       _     _       //
//     | |   _   _ _ __ ___ (_)_ __   ___  _   _ ___   _ __ (_) __ _| |__ | |_     //
//     | |  | | | | '_ ` _ \| | '_ \ / _ \| | | / __| | '_ \| |/ _` | '_ \| __|    //
//     | |__| |_| | | | | | | | | | | (_) | |_| \__ \ | | | | | (_| | | | | |_     //
//     |_____\__,_|_| |_| |_|_|_| |_|\___/ \__,_|___/ |_| |_|_|\__, |_| |_|\__|    //
//     | |__  _   _    __ _| |__ | | ___ __ (_) ___| | _____ _ |___/               //
//     | '_ \| | | |  / _` | '_ \| |/ / '_ \| |/ __| |/ / _ \ '__|                 //
//     | |_) | |_| | | (_| | |_) |   <| | | | | (__|   <  __/ |                    //
//     |_.__/ \__, |  \__,_|_.__/|_|\_\_| |_|_|\___|_|\_\___|_|                    //
//            |___/                                                                //
//                                                                                 //
//                                                                                 //
//                                                                                 //
/////////////////////////////////////////////////////////////////////////////////////


contract LN is ERC721Creator {
    constructor() ERC721Creator("Luminous night", "LN") {}
}