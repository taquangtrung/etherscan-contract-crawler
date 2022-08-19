// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

/// @title: Balam Cats
/// @author: manifold.xyz

import "./ERC721Creator.sol";

//////////////////////////////////////////////////////////////////////
//                                                                  //
//                                                                  //
//     ███████████            ████                                  //
//    ░░███░░░░░███          ░░███                                  //
//     ░███    ░███  ██████   ░███   ██████   █████████████         //
//     ░██████████  ░░░░░███  ░███  ░░░░░███ ░░███░░███░░███        //
//     ░███░░░░░███  ███████  ░███   ███████  ░███ ░███ ░███        //
//     ░███    ░███ ███░░███  ░███  ███░░███  ░███ ░███ ░███        //
//     ███████████ ░░████████ █████░░████████ █████░███ █████       //
//    ░░░░░░░░░░░   ░░░░░░░░ ░░░░░  ░░░░░░░░ ░░░░░ ░░░ ░░░░░        //
//                                                                  //
//                                                                  //
//                                                                  //
//       █████████    █████████   ███████████  █████████            //
//      ███░░░░░███  ███░░░░░███ ░█░░░███░░░█ ███░░░░░███           //
//     ███     ░░░  ░███    ░███ ░   ░███  ░ ░███    ░░░            //
//    ░███          ░███████████     ░███    ░░█████████            //
//    ░███          ░███░░░░░███     ░███     ░░░░░░░░███           //
//    ░░███     ███ ░███    ░███     ░███     ███    ░███           //
//     ░░█████████  █████   █████    █████   ░░█████████            //
//      ░░░░░░░░░  ░░░░░   ░░░░░    ░░░░░     ░░░░░░░░░             //
//                                                                  //
//                                                                  //
//                                                                  //
//                                                                  //
//                                                                  //
//////////////////////////////////////////////////////////////////////


contract BMC is ERC721Creator {
    constructor() ERC721Creator("Balam Cats", "BMC") {}
}