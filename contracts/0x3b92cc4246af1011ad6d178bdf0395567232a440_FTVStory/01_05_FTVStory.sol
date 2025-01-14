// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

/// @title: Franklin the Vampire - Story Tokens
/// @author: manifold.xyz

import "./ERC1155Creator.sol";

///////////////////////////////////////////////////////////////////////////////////////////////////////////////
//                                                                                                           //
//                                                                                                           //
//                                                                                                           //
//      ______               _    _ _          _____ _                     _______    _                      //
//     |  ____|             | |  | (_)        / ____| |                   |__   __|  | |                     //
//     | |__ _ __ __ _ _ __ | | _| |_ _ __   | (___ | |_ ___  _ __ _   _     | | ___ | | _____ _ __  ___     //
//     |  __| '__/ _` | '_ \| |/ / | | '_ \   \___ \| __/ _ \| '__| | | |    | |/ _ \| |/ / _ \ '_ \/ __|    //
//     | |  | | | (_| | | | |   <| | | | | |  ____) | || (_) | |  | |_| |    | | (_) |   <  __/ | | \__ \    //
//     |_|  |_|  \__,_|_| |_|_|\_\_|_|_| |_| |_____/ \__\___/|_|   \__, |    |_|\___/|_|\_\___|_| |_|___/    //
//                                                                  __/ |                                    //
//                                                                 |___/                                     //
//    Matthew Burns                                                                                          //
//                                                                                                           //
//                                                                                                           //
///////////////////////////////////////////////////////////////////////////////////////////////////////////////


contract FTVStory is ERC1155Creator {
    constructor() ERC1155Creator() {}
}