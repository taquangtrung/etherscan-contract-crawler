// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

/// @title: carmacace
/// @author: manifold.xyz

import "./ERC721Creator.sol";

////////////////////////////////////////////////////////////////////////////
//                                                                        //
//                                                                        //
//                                                                        //
//                                                                        //
//      __ __ _ _ _ _ __  __ _ __ __ _ __ ___                             //
//     / _/ _` | '_| '  \/ _` / _/ _` / _/ -_)                            //
//     \__\__,_|_| |_|_|_\__,_\__\__,_\__\___|                            //
//                                                                        //
//                                                                        //
//                                                                        //
//                                                                        //
//                                                                        //
//                                                                        //
//                                                                        //
//                                                                        //
//                                                                        //
//                                                                        //
//                                                                        //
//                                                                        //
////////////////////////////////////////////////////////////////////////////


contract CARMA is ERC721Creator {
    constructor() ERC721Creator("carmacace", "CARMA") {}
}