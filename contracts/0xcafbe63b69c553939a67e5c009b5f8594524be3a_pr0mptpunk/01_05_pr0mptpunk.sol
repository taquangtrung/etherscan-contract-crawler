// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

/// @title: pr0mptpunk
/// @author: manifold.xyz

import "./ERC721Creator.sol";

/////////////////////////////////////////////////////////
//                                                     //
//                                                     //
//    (((((((((((((((((((((@@((((((((((((((((((((((    //
//    (((((((((((((((((((@@%%@@((((((((((((((((((((    //
//    (((((((((((((((((((@@,,@@((((((((((((((((((((    //
//    (((((((((((((((@@@@@@//@@@@@@((((((((((((((((    //
//    (((((((((((((#@/,,,,,,,,,,,,,@#((((((((((((((    //
//    ((((((((((((@&,. ,,,,,,,,,,,,,&@(((((((((((((    //
//    ((((((((((((@&,,,,,,,,,,,,,,,,&@(((((((((((((    //
//    ((((((((((((@&,,,             %@(((((((((((((    //
//    ((((((((((@@@&,/(@@@@@@@@@@@@@@@(((((((((((((    //
//    ((((((((@@  ,,,,,(((((((((((((&@(((((((((((((    //
//    ((((((((((@@@&,,,,,,,,,,,,,,,,&@(((((((((((((    //
//    ((((((((((((@&,,,,,,,,,,,,,,,,&@(((((((((((((    //
//    ((((((((((((@&,,,,,//@@//@@//,&@(((((((((((((    //
//    ((((((((((((@&,,,,,@@//@@//@@,&@(((((((((((((    //
//    ((((((((((((@&,,,,,,,,,,,,,,,&%#(((((((((((((    //
//    ((((((((((((@&,,,,,@@@@@@@@@@((((((((((((((((    //
//    ((((((((((((@&,,,,,@@((((((((((((((((((((((((    //
//                                                     //
//                                                     //
/////////////////////////////////////////////////////////


contract pr0mptpunk is ERC721Creator {
    constructor() ERC721Creator("pr0mptpunk", "pr0mptpunk") {}
}