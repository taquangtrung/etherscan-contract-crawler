// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

/// @title: Orphea
/// @author: manifold.xyz

import "./ERC721Creator.sol";

////////////////////////////////////////////////////////////
//                                                        //
//                                                        //
//       ___                    __                        //
//     .'   `.                 [  |                       //
//    /  .-.  \ _ .--.  _ .--.  | |--.  .---.  ,--.       //
//    | |   | |[ `/'`\][ '/'`\ \| .-. |/ /__\\`'_\ :      //
//    \  `-'  / | |     | \__/ || | | || \__.,// | |,     //
//     `.___.' [___]    | ;.__/[___]|__]'.__.'\'-;__/     //
//                     [__|                               //
//                                                        //
//                                                        //
////////////////////////////////////////////////////////////


contract OPH is ERC721Creator {
    constructor() ERC721Creator("Orphea", "OPH") {}
}