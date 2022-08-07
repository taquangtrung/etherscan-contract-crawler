// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

/// @title: Ziggy⚡
/// @author: manifold.xyz

import "./ERC721Creator.sol";

/////////////////////////////////////////////////////////
//                                                     //
//                                                     //
//      _______                         /\/|           //
//     |___  (_)                       |/\/            //
//        / / _  __ _  __ _ _   _ ___                  //
//       / / | |/ _` |/ _` | | | / __|                 //
//      / /__| | (_| | (_| | |_| \__ \                 //
//     /_____|_|\__, |\__, |\__, |___/                 //
//            _  __/ | __/ | __/ |    _                //
//         /\| |/\__/ |___//\___/    | |               //
//         \ ` ' /        /  \   _ __| |_              //
//        |_     _|      / /\ \ | '__| __|             //
//         / , . \  _   / ____ \| |  | |_              //
//         \/|_|\/ (_) /_/    \_|_|   \__|             //
//                                                     //
//                                                     //
/////////////////////////////////////////////////////////


contract ZIGGY is ERC721Creator {
    constructor() ERC721Creator(unicode"Ziggy⚡", "ZIGGY") {}
}