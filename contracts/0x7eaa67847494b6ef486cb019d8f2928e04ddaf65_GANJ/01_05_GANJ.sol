// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

/// @title: Journey - Gannon.eth
/// @author: manifold.xyz

import "./ERC721Creator.sol";

/////////////////////////////////////////////////////////////////////////////////////////
//                                                                                     //
//                                                                                     //
//         ██▀▀    ███▌  ▄█▄ ▄█▀ ▄█▄ ▄█▀  ▄████▄  ▄█▄ ▄█▀    ▄█▀▀▀ ▀▀██▀▀ ▄█ █▀        //
//       ▐█▀  ▄▄ ███▄█▌ ██ ███  ▄█▌ ███  ▐█▀ ▄▄█ ▄█▌ ███    ▀██▀▀    █▀  ▄████▀        //
//        ▀▀███▌ ██▀ ▐▌ ██  ██▀  █▀  ██   ▀███▀▀  █▀  ██  █▄ ▀█▄▄▄   █    █  █         //
//                                                                                     //
//                                                                                     //
/////////////////////////////////////////////////////////////////////////////////////////


contract GANJ is ERC721Creator {
    constructor() ERC721Creator("Journey - Gannon.eth", "GANJ") {}
}