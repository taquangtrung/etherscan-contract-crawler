// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

/// @title: Pi64:Ø
/// @author: manifold.xyz

import "./ERC721Creator.sol";

/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//                                                                                                                 //
//                                                                                                                 //
//                                                                                                                 //
//                                                                                                                 //
//     ████  ██████████████████████████████████████████████████████████████████████████████████████████  ████      //
//     ██  ██                                                                                          ██  ██      //
//       ██  ██████████████████████████████████████████████████████████████████████████████████████████  ██        //
//     ██  ██                                                                                          ██  ██      //
//     ██  ██                                                                                          ██  ██      //
//     ██  ██                                                                                          ██  ██      //
//     ██  ██                                                                                          ██  ██      //
//     ██  ██                                                                                          ██  ██      //
//     ██  ██                                                                                          ██  ██      //
//     ██  ██    ████████████████████             ████████████████████             ██████████          ██  ██      //
//     ██  ██  ██                    ██         ██                    ██         ██          ██        ██  ██      //
//     ██  ██  ██      ██████████    █████████████                    ██       ██            ██        ██  ██      //
//     ██  ██  ██      ████    ██    ██        ███        ████████████       ██     ██       ██        ██  ██      //
//     ██  ██  ██      ██████████    ██        ███        ███              ██    █████       ██        ██  ██      //
//     ██  ██  ██                    █████████████        █████████████  ██    ██   ██       ██        ██  ██      //
//     ██  ██  ██        ██████████████        ███                     ██    ██     ██       ██        ██  ██      //
//     ██  ██  ██        ██████████████        ███        █████        ██  ██       ██       ██        ██  ██      //
//     ██  ██  ██        ███         ██        ███        ██ ██        ██  ███████████       ██████    ██  ██      //
//     ██  ██  ██        ███         ██        ███        ██ ██        ██                          ██  ██  ██      //
//     ██  ██  ██        ███         ██        ███        ██ ██        ██                          ██  ██  ██      //
//     ██  ██  ██        ███         ██        ███        ██ ██        ███████████████       ████████  ██  ██      //
//     ██  ██  ██        ███         ██        ███        █████        ███████████████       ████████  ██  ██      //
//     ██  ██  ██        ███         ██        ███                     ██           ██       ██        ██  ██      //
//     ██  ██  █████████████         ██        ████████████████████████               ███████          ██  ██      //
//     ██  ██    █████████             █████████  █████████████████████               ███████          ██  ██      //
//     ██  ██                                                                                          ██  ██      //
//     ██  ██                                                                                          ██  ██      //
//     ██  ██                                                                                          ██  ██      //
//     ██  ██                                                                                          ██  ██      //
//     ██  ██                                                                                          ██  ██      //
//     ██  ██                                                                                          ██  ██      //
//       ██  ██████████████████████████████████████████████████████████████████████████████████████████  ██        //
//     ██  ██                                                                                          ██  ██      //
//     ████  ██████████████████████████████████████████████████████████████████████████████████████████  ████      //
//                                                                                                                 //
//                                                                                                                 //
//                                                                                                                 //
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


contract Pi640 is ERC721Creator {
    constructor() ERC721Creator(unicode"Pi64:Ø", "Pi640") {}
}