// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

/// @title: JASON BALDUCCI
/// @author: manifold.xyz

import "./ERC721Creator.sol";

//////////////////////////////////////////
//                                      //
//                                      //
//                                      //
//       $$$$$\ $$$$$$$\   $$$$$$\      //
//       \__$$ |$$  __$$\ $$  __$$\     //
//          $$ |$$ |  $$ |$$ /  \__|    //
//          $$ |$$$$$$$\ |$$ |          //
//    $$\   $$ |$$  __$$\ $$ |          //
//    $$ |  $$ |$$ |  $$ |$$ |  $$\     //
//    \$$$$$$  |$$$$$$$  |\$$$$$$  |    //
//     \______/ \_______/  \______/     //
//                                      //
//                                      //
//                                      //
//                                      //
//                                      //
//                                      //
//////////////////////////////////////////


contract JBC is ERC721Creator {
    constructor() ERC721Creator("JASON BALDUCCI", "JBC") {}
}