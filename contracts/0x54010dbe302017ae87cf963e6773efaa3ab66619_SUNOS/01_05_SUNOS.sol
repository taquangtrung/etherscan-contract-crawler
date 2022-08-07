// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

/// @title: SUMMER NOSTALGIA
/// @author: manifold.xyz

import "./ERC721Creator.sol";

////////////////////////////////////////////////////////////////////////////////////////////
//                                                                                        //
//                                                                                        //
//                                                                                        //
//                                                                                        //
//       d888888o.   8 8888      88 b.             8     ,o888888o.       d888888o.       //
//     .`8888:' `88. 8 8888      88 888o.          8  . 8888     `88.   .`8888:' `88.     //
//     8.`8888.   Y8 8 8888      88 Y88888o.       8 ,8 8888       `8b  8.`8888.   Y8     //
//     `8.`8888.     8 8888      88 .`Y888888o.    8 88 8888        `8b `8.`8888.         //
//      `8.`8888.    8 8888      88 8o. `Y888888o. 8 88 8888         88  `8.`8888.        //
//       `8.`8888.   8 8888      88 8`Y8o. `Y88888o8 88 8888         88   `8.`8888.       //
//        `8.`8888.  8 8888      88 8   `Y8o. `Y8888 88 8888        ,8P    `8.`8888.      //
//    8b   `8.`8888. ` 8888     ,8P 8      `Y8o. `Y8 `8 8888       ,8P 8b   `8.`8888.     //
//    `8b.  ;8.`8888   8888   ,d8P  8         `Y8o.`  ` 8888     ,88'  `8b.  ;8.`8888     //
//     `Y8888P ,88P'    `Y88888P'   8            `Yo     `8888888P'     `Y8888P ,88P'     //
//                                                                                        //
//                                                                                        //
//                                                                                        //
////////////////////////////////////////////////////////////////////////////////////////////


contract SUNOS is ERC721Creator {
    constructor() ERC721Creator("SUMMER NOSTALGIA", "SUNOS") {}
}