// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

/// @title: Purple
/// @author: manifold.xyz

import "./ERC721Creator.sol";

////////////////////////////////////////////////////////////////////////
//                                                                    //
//                                                                    //
//                                                                    //
//      ____                   _                                      //
//     |  _ \ _   _ _ __ _ __ | | ___                                 //
//     | |_) | | | | '__| '_ \| |/ _ \                                //
//     |  __/| |_| | |  | |_) | |  __/                                //
//     |_|    \__,_|_|  | .__/|_|\___|       _      _                 //
//     | |__  _   _    _|_|| |__ | | ___ __ (_) ___| | _____ _ __     //
//     | '_ \| | | |  / _` | '_ \| |/ / '_ \| |/ __| |/ / _ \ '__|    //
//     | |_) | |_| | | (_| | |_) |   <| | | | | (__|   <  __/ |       //
//     |_.__/ \__, |  \__,_|_.__/|_|\_\_| |_|_|\___|_|\_\___|_|       //
//            |___/                                                   //
//                                                                    //
//                                                                    //
//                                                                    //
////////////////////////////////////////////////////////////////////////


contract PURPLE is ERC721Creator {
    constructor() ERC721Creator("Purple", "PURPLE") {}
}