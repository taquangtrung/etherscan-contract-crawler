// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

/// @title: Finn's Receipts
/// @author: manifold.xyz

import "./ERC721Creator.sol";

////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//                                                                                                            //
//                                                                                                            //
//    ▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒    //
//    ▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒    //
//    ▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒    //
//    ▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒    //
//    ▒▒▒▒▒▒▓██▒██▓▓██▒██▓▓██▒██▓▓██▒▓█▓▒██▒▓█▓▒██▒▓█▓▒██▓▓██▒██▓▓██▒██▓▓██▒██▓▓██▒██▓▓██▒▓█▓▒██▒▓█▓▒▒▒▒▒▒    //
//    ▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒    //
//    ▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒    //
//    ▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒    //
//    ▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▓██▓▓▓▓▓▓▒███▓▒▒███▒██▓▒▒▒██▓▓██▓▒▒▒██▒▒▒▓██▓▓▓▓▒███▓▒▒██▓▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒    //
//    ▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▓██▒▒▒▒▒▒▒█████▒███▒█████▒██▓▓████▓▓██▓▓██▓▒▒▒▒▒▒█████▒███▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒    //
//    ▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▓██▓▓▓▓▓▒▒███▓█████▒████████▓▓██▓█████▓▓██▒▒▓███▒███▓█████▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒    //
//    ▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▓██▒▒▒▒▒▒▒███▒▒████▒██▓▒▒███▓▓██▒▒▓███▓▒▓██▓▓███▒██▓▒▒████▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒    //
//    ▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▓▓▒▒▒▒▒▒▒▒▓▒▒▒▒▒▓▒▒▓▓▒▒▒▒▓▓▒▒▓▓▒▒▒▒▓▓▒▒▒▒▓▓▓▓▓▓▒▓▓▒▒▒▒▓▓▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒    //
//    ▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒    //
//    ▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒    //
//    ▒▒▒▒▒▒▓██▒██▓▓██▒██▓▓██▒██▓▓██▒▓█▓▒██▒▓█▓▒██▒▓█▓▒██▓▓██▒██▓▓██▒██▓▓██▒██▓▓██▒██▓▓██▒██▓▓██▒▓█▓▒▒▒▒▒▒    //
//    ▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒    //
//    ▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒    //
//    ▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒    //
//    ▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒    //
//    ▒▒▒▒▒▒▓▓▓▓▓▓▒▓▓▓▒▓▓▓▓▓▓▒▓▓▒▒▒██▓█▓▒▒▒▒▒▒▒▒▒▒▓▓▓▓█▒▒▒█▓▒█▒▒▒▓█▓█▓▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒█▒▓▒▓█▓▓█▓▓▓▓▓▒▒▒▒▒▒    //
//    ▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒    //
//    ▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒    //
//    ▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒    //
//    ▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒    //
//    ▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒    //
//    ▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▓▓▓▓▒▒▒▒▒▒▒▒▒    //
//    ▒▒▒▒▒▒▒▒▒▒▓▓▒▒▒▒█▓▓▒▓▓▒▓▓▒▓▒▓▒▓▓▒▓▓▒▒▒▓▓▓▓▒▒▓▒▓▒▒▒▒▒▓▓▓▓▓▓▒▓▒▒▒▓▓▒▒▓▒▓▒▓▒▓▓▒▓▒▒▒▒▒▒▒▒▒████▓▒▒▒▒▒▒▒▒▒    //
//    ▒▒▒▒▒▒▒▓▓▓▓▓▒▒▒▒█▒▒▒▓▓▓▓▒▓▓▒▓▒▓▓▒▓▓▓▓▓█▓▒▓▒▒▒▒▓▓▓▒▒▒▓▓▓▒▓▓▓▓▒▒▓▓▓▒▒▓▒█▒▓▒▓▓▒▓▓▓▒▒▒▒▒▒▒▓▓███▓▒▒▒▒▒▒▒▒    //
//    ▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▓▒▒▒▒▒▒▒▒▒▒▒    //
//    ▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒    //
//    ▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒    //
//    ▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒    //
//    ▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▓▓▒▒▒▒▒▒▒█▒▒▒▒▒▒▒▓▓▒▒▒▒▒▒▒▒▒    //
//    ▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▓████▓▓▒▒██▓█▓▓▒▒▓████▓▓▒▒▒▒▒▒▒    //
//    ▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▓▓████▓▒▒▓▓█▓██▒▒▓▓██▓█▓▒▒▒▒▒▒    //
//    ▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▓▓▓██▓▓▒▒▓▓▓█▓▓▒▒▓▓▓██▓▓▒▒▒▒▒▒▒    //
//    ▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒    //
//    ▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒    //
//    ▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒    //
//    ▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒    //
//    ▒▒▒▒▒▒▒▒▒▓██▓▒▒▓▓▓▓▒▒▒▓██▓▒▒▓▓▓▓▒▒▒▒██▒▒▒▒█▓▒▒▒▒▒▒▒▒▒▒█▓█▓▒▒▓▓█▓▓▒▒▓▓█▓▒▒▓██▓▓▒▒▓▓█▓▒▒▓███▓▒▒▒▒▒▒▒▒▒    //
//    ▒▒▒▒▒▒▒▒▒▒██▒▒██▒▒██▒▒▒██▒▒▒▓▓▓██▒▒▒██▒▒▒▒▓▓▒▒▒▒▒▒▒▒▒▒▓▓██▓▒▓▓███▓▒▓▓██▓▒▓▓███▓▒▓▓███▒▒▓███▓▒▒▒▒▒▒▒▒    //
//    ▒▒▒▒▒▒▒▒▒▒█▓▒▒▓█▓▓█▓▒▒▒█▓▒▒▓█▓▓██▒▒▓██▓▒▒▒▓▒▒▒▒▒▒▒▒▒▒▒▓▓█▓▒▒▓▓█▓▓▒▒▓▓█▓▒▒▓▓▓▓▓▒▒▓▓█▓▒▒▓▓▓▓▓▒▒▒▒▒▒▒▒▒    //
//    ▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒    //
//    ▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒    //
//    ▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒    //
//    ▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒    //
//    ▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒██▒▓█▓▒██▒▓█▓▒██▒▓█▓▒██▒▓█▓▒██▒▓█▓▒██▒▓█▓▒██▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒    //
//    ▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▓▒▒▒▒▒▒▒▒▒▒▒▒▒▓▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒    //
//    ▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▓▒▓▓▓▓▒▓▒▓▓▒▓▓▒▓▓▒▓▓▓▒▓▓▓▒▒▒▓█▓▒▓▓▓▒▒▓▓▓█▓▓▒█▓▓▒▓▓▓▒▓▓▓▓▓▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒    //
//    ▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▓▒▓▓▓▓▒▓▒▓▓▓▓▓▒▓█▒▓▓▓▒▓▓█▒▓▒▓█▓▒▓▓▓▓▒▓▓▓█▓▓▒█▓▓▒▓█▓▒▓▓▓▓▓▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒    //
//    ▒▒▒▒▒▒▒▒▓█▒▒▒▒▒▓██▓▒▒▒▓▒▓▓▓▓▒▓▒▓▓▓▓▓▒▓█▒▓▓▓▒▓▓█▒▓▒▓█▓▒▓▓▓▓▒▓▓▓█▓▓▒█▓▓▒▓█▓▒▓▓▓▓▓▒▒▓██▓▒▒▒▒▒██▒▒▒▒▒▒▒▒    //
//    ▒▒▒▒▒▒▒▒██▓▒▓████▓▒▒▒▒▓▒▓▓▓▓▒▓▒▓▓▓▓▓▒▓█▒▓▓▓▒▓▓█▒▓▒▓█▓▒▓▓▓▓▒▓▓▓█▓▓▒█▓▓▒▓█▓▒▓▓▓▓▓▒▒▒▓████▓▒▓██▒▒▒▒▒▒▒▒    //
//    ▒▒▒▒▒▒▒▒████████▒▒▒▒▒▒▓▒▓▓▓▓▒▓▒▓▓▓▓▓▒▓█▒▓▓▓▒▓▓█▒▓▒▓█▓▒▓▓▓▓▒▓▓▓█▓▓▒█▓▓▒▓█▓▒▓▓▓▓▓▒▒▒▒▒████████▒▒▒▒▒▒▒▒    //
//    ▒▒▒▒▒▒▓███▓████▒▒▒▒▒▒▒▓▒▓▓▓▓▒▓▒▓▓▓▓▓▒▓█▒▓▓▓▓▓▓█▒▒▒▓█▓▒▓▓▓▓▒▓▓▓█▓▓▒█▓▓▒▓█▓▒▓▓▓▓▓▒▒▒▒▒▒████▓███▓▒▒▒▒▒▒    //
//    ▒▒▒▒▓█████▒███▒▒▒▒▒▒▒▒▓▒▓▓▓▓▒▓▒▓▓▓▓▓▒▓█▒▓▓▓▓▓▓█▒▓▒▓█▓▒▓▓▓▓▒▓▓▓█▓▓▒█▓▓▒▓█▓▒▓▓▓▓▓▒▒▒▒▒▒▒███▒█████▓▒▒▒▒    //
//    ▒▒▒██▓▓▓██▓███▓▒▒▒▒▒▒▒▓▒▓▓▓▓▒▓▒▓▓▓▓▓▒▓█▒▓▓▓▒▓▓█▒▓▒▓█▓▒▓▓▓▓▒▓▓▓█▓▓▒█▓▓▒▓█▓▒▓▓▓▓▓▒▒▒▒▒▒▓███▓███▓▓██▒▒▒    //
//    ▒▒▓█▒▒▒▒█████▓██▒▒▒▒▒▒▓▒▓▓▓▓▒▓▒▓▓▓▓▓▒▓█▒▓▓▓▒▓▓█▒▓▒▓█▓▒▓▓▓▓▒▓▓▓█▓▓▒█▓▓▒▓█▓▒▓▓▓▓▓▒▒▒▒▒▓█▓█████▒▒▒▒█▓▒▒    //
//    ▒▒▒▒▒▒▒▒███▓▒▓▓█▓▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▓█▓▓▒▓███▒▒▒▒▒▒▒▒    //
//    ▒▒▒▒▒▒▒▒██▓▒▒▒▒▒▒▒▒▒▒▒▒████████▒▓██▒▒▒▓██▒▒▒▒▒▒▒▓█▓▒▒▓█████▒▒▒▒██▒▒▓██▒▒▒▒███▓▒▒▒▒▒▒▒▒▒▒▒▓██▒▒▒▒▒▒▒▒    //
//    ▒▒▒▒▒▒▒▒██▒▒▒▒▒▒▒▒▒▒▒▒▓██▒▒▒▒▒▒▒▓███▓▒▓██▒▒▒▒▒▒▒███▒██▓▒▒▒██▓▒▒██▓▒▓██▒▒▒▓███▓▒▒▒▒▒▒▒▒▒▒▒▒██▒▒▒▒▒▒▒▒    //
//    ▒▒▒▒▒▒▒▒▓▒▒▒▒▒▒▒▒▒▒▒▒▒▓███████▒▒▓████████▒▒▒▒▒▒▒███▒██▓▒▒▒██▓▒▒▒█████▒▒▒▒▓██▓▒▒▒▒▒▒▒▒▒▒▒▒▒▒▓▒▒▒▒▒▒▒▒    //
//    ▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▓██▓▒▒▒▒▒▒▓██▒▓████▒▓█▓▒▒▒███▒██▓▒▒▒██▓▒▒▒▒███▒▒▒▒▒▒▓▓▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒    //
//    ▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▓▓▓▓▓▓▓▓▒▓▓▓▒▒▒▓▓▓▒▒▓▓▓▓▓▓▓▒▒▒▓▓▓▓▓▓▒▒▒▒▒▒▓▓▓▒▒▒▒▒▒▓▓▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒    //
//    ▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒    //
//                                                                                                            //
//                                                                                                            //
//                                                                                                            //
////////////////////////////////////////////////////////////////////////////////////////////////////////////////


contract FNNNGNRCPTS is ERC721Creator {
    constructor() ERC721Creator("Finn's Receipts", "FNNNGNRCPTS") {}
}