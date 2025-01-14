// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

/// @title: Gaia_G_NFT
/// @author: manifold.xyz

import "./ERC721Creator.sol";

//////////////////////////////////////////////////////////////////////////////////////////////
//                                                                                          //
//                                                                                          //
//     _______  _______ _________ _______       _______       _        _______ _________    //
//    (  ____ \(  ___  )\__   __/(  ___  )     (  ____ \     ( (    /|(  ____ \\__   __/    //
//    | (    \/| (   ) |   ) (   | (   ) |     | (    \/     |  \  ( || (    \/   ) (       //
//    | |      | (___) |   | |   | (___) |     | |           |   \ | || (__       | |       //
//    | | ____ |  ___  |   | |   |  ___  |     | | ____      | (\ \) ||  __)      | |       //
//    | | \_  )| (   ) |   | |   | (   ) |     | | \_  )     | | \   || (         | |       //
//    | (___) || )   ( |___) (___| )   ( |     | (___) |     | )  \  || )         | |       //
//    (_______)|/     \|\_______/|/     \|_____(_______)_____|/    )_)|/          )_(       //
//                                       (_____)       (_____)                              //
//                                                                                          //
//                                                                                          //
//////////////////////////////////////////////////////////////////////////////////////////////


contract kooik is ERC721Creator {
    constructor() ERC721Creator("Gaia_G_NFT", "kooik") {}
}