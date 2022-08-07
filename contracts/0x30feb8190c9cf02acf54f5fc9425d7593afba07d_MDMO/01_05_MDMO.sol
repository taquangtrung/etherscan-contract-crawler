// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

/// @title: Marzoh Demos
/// @author: manifold.xyz

import "./ERC721Creator.sol";

////////////////////////////////////////////////////////////////////////////////
//                                                                            //
//                                                                            //
//                                                                            //
//     __    __     __  __     ______     __     ______                       //
//    /\ "-./  \   /\ \/\ \   /\  ___\   /\ \   /\  ___\                      //
//    \ \ \-./\ \  \ \ \_\ \  \ \___  \  \ \ \  \ \ \____                     //
//     \ \_\ \ \_\  \ \_____\  \/\_____\  \ \_\  \ \_____\                    //
//      \/_/  \/_/   \/_____/   \/_____/   \/_/   \/_____/                    //
//     ______     __  __                                                      //
//    /\  == \   /\ \_\ \                                                     //
//    \ \  __<   \ \____ \                                                    //
//     \ \_____\  \/\_____\                                                   //
//      \/_____/   \/_____/                                                   //
//     __    __     ______     ______     ______     ______     __  __        //
//    /\ "-./  \   /\  __ \   /\  == \   /\___  \   /\  __ \   /\ \_\ \       //
//    \ \ \-./\ \  \ \  __ \  \ \  __<   \/_/  /__  \ \ \/\ \  \ \  __ \      //
//     \ \_\ \ \_\  \ \_\ \_\  \ \_\ \_\   /\_____\  \ \_____\  \ \_\ \_\     //
//      \/_/  \/_/   \/_/\/_/   \/_/ /_/   \/_____/   \/_____/   \/_/\/_/     //
//                                                                            //
//                                                                            //
//                                                                            //
//                                                                            //
////////////////////////////////////////////////////////////////////////////////


contract MDMO is ERC721Creator {
    constructor() ERC721Creator("Marzoh Demos", "MDMO") {}
}