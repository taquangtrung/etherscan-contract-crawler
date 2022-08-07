// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

/// @title: Creepy Boys & Girls
/// @author: manifold.xyz

import "./ERC721Creator.sol";

////////////////////////////////////////////////////
//                                                //
//                                                //
//                                                //
//                                                //
//      ,- _~.                                    //
//     (' /|                                      //
//    ((  ||   ,._-_  _-_   _-_  -_-_  '\\/\\     //
//    ((  ||    ||   || \\ || \\ || \\  || ;'     //
//     ( / |    ||   ||/   ||/   || ||  ||/       //
//      -____-  \\,  \\,/  \\,/  ||-'   |/        //
//                               |/    (          //
//                               '      -_-       //
//                                                //
//      ,- _~.                      ,             //
//     (' /|                       ||             //
//    ((  ||   ,._-_ '\\/\\ -_-_  =||=  /'\\      //
//    ((  ||    ||    || ;' || \\  ||  || ||      //
//     ( / |    ||    ||/   || ||  ||  || ||      //
//      -____-  \\,   |/    ||-'   \\, \\,/       //
//                   (      |/                    //
//                    -_-   '                     //
//                                                //
//                                                //
//                                                //
////////////////////////////////////////////////////


contract CREEP is ERC721Creator {
    constructor() ERC721Creator("Creepy Boys & Girls", "CREEP") {}
}