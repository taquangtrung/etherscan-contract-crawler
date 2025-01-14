// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

/// @title: Simboliatt
/// @author: manifold.xyz

import "./ERC721Creator.sol";

///////////////////////////////////////////////////////////////////////////////////////////////////////////////
//                                                                                                           //
//                                                                                                           //
//                                                                                                           //
//     ________  ___  _____ ______   ________  ________  ___       ___  ________  _________  _________       //
//    |\   ____\|\  \|\   _ \  _   \|\   __  \|\   __  \|\  \     |\  \|\   __  \|\___   ___\\___   ___\     //
//    \ \  \___|\ \  \ \  \\\__\ \  \ \  \|\ /\ \  \|\  \ \  \    \ \  \ \  \|\  \|___ \  \_\|___ \  \_|     //
//     \ \_____  \ \  \ \  \\|__| \  \ \   __  \ \  \\\  \ \  \    \ \  \ \   __  \   \ \  \     \ \  \      //
//      \|____|\  \ \  \ \  \    \ \  \ \  \|\  \ \  \\\  \ \  \____\ \  \ \  \ \  \   \ \  \     \ \  \     //
//        ____\_\  \ \__\ \__\    \ \__\ \_______\ \_______\ \_______\ \__\ \__\ \__\   \ \__\     \ \__\    //
//       |\_________\|__|\|__|     \|__|\|_______|\|_______|\|_______|\|__|\|__|\|__|    \|__|      \|__|    //
//       \|_________|                                                                                        //
//                                                                                                           //
//                                                                                                           //
//                                                                                                           //
//                                                                                                           //
//                                                                                                           //
///////////////////////////////////////////////////////////////////////////////////////////////////////////////


contract SIMBOLIATT is ERC721Creator {
    constructor() ERC721Creator("Simboliatt", "SIMBOLIATT") {}
}