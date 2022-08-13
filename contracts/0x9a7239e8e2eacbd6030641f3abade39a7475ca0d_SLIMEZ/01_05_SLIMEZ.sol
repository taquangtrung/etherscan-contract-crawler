// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

/// @title: SLIMEZNFT
/// @author: manifold.xyz

import "./ERC721Creator.sol";

////////////////////////////////////////////////////////////
//                                                        //
//                                                        //
//                                                        //
//      ██████  ██▓     ██▓ ███▄ ▄███▓▓█████ ▒███████▒    //
//    ▒██    ▒ ▓██▒    ▓██▒▓██▒▀█▀ ██▒▓█   ▀ ▒ ▒ ▒ ▄▀░    //
//    ░ ▓██▄   ▒██░    ▒██▒▓██    ▓██░▒███   ░ ▒ ▄▀▒░     //
//      ▒   ██▒▒██░    ░██░▒██    ▒██ ▒▓█  ▄   ▄▀▒   ░    //
//    ▒██████▒▒░██████▒░██░▒██▒   ░██▒░▒████▒▒███████▒    //
//    ▒ ▒▓▒ ▒ ░░ ▒░▓  ░░▓  ░ ▒░   ░  ░░░ ▒░ ░░▒▒ ▓░▒░▒    //
//    ░ ░▒  ░ ░░ ░ ▒  ░ ▒ ░░  ░      ░ ░ ░  ░░░▒ ▒ ░ ▒    //
//    ░  ░  ░    ░ ░    ▒ ░░      ░      ░   ░ ░ ░ ░ ░    //
//          ░      ░  ░ ░         ░      ░  ░  ░ ░        //
//                                           ░            //
//                                                        //
//                                                        //
////////////////////////////////////////////////////////////


contract SLIMEZ is ERC721Creator {
    constructor() ERC721Creator("SLIMEZNFT", "SLIMEZ") {}
}