// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

/// @title: Magical Places
/// @author: manifold.xyz

import "./ERC721Creator.sol";

//////////////////////////////////////////////////////////////////////////////
//                                                                          //
//                                                                          //
//                                                                          //
//      __  __             _           _   _____  _                         //
//     |  \/  |           (_)         | | |  __ \| |                        //
//     | \  / | __ _  __ _ _  ___ __ _| | | |__) | | __ _  ___ ___  ___     //
//     | |\/| |/ _` |/ _` | |/ __/ _` | | |  ___/| |/ _` |/ __/ _ \/ __|    //
//     | |  | | (_| | (_| | | (_| (_| | | | |    | | (_| | (_|  __/\__ \    //
//     |_|  |_|\__,_|\__, |_|\___\__,_|_| |_|    |_|\__,_|\___\___||___/    //
//                    __/ |                                                 //
//                   |___/                                                  //
//                                                                          //
//                                                                          //
//                                                                          //
//////////////////////////////////////////////////////////////////////////////


contract Places is ERC721Creator {
    constructor() ERC721Creator("Magical Places", "Places") {}
}