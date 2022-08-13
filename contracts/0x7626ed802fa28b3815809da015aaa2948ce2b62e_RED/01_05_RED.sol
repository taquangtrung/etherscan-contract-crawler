// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

/// @title: Red swan
/// @author: manifold.xyz

import "./ERC721Creator.sol";

////////////////////////////////////////////////////////////////////////
//                                                                    //
//                                                                    //
//                                                                    //
//      ____          _                                               //
//     |  _ \ ___  __| |  _____      ____ _ _ __                      //
//     | |_) / _ \/ _` | / __\ \ /\ / / _` | '_ \                     //
//     |  _ <  __/ (_| | \__ \\ V  V / (_| | | | |                    //
//     |_| \_\___|\__,_| |___/ \_/\_/ \__,_|_| |_|  _                 //
//     | |__  _   _    __ _| |__ | | ___ __ (_) ___| | _____ _ __     //
//     | '_ \| | | |  / _` | '_ \| |/ / '_ \| |/ __| |/ / _ \ '__|    //
//     | |_) | |_| | | (_| | |_) |   <| | | | | (__|   <  __/ |       //
//     |_.__/ \__, |  \__,_|_.__/|_|\_\_| |_|_|\___|_|\_\___|_|       //
//            |___/                                                   //
//                                                                    //
//                                                                    //
//                                                                    //
////////////////////////////////////////////////////////////////////////


contract RED is ERC721Creator {
    constructor() ERC721Creator("Red swan", "RED") {}
}