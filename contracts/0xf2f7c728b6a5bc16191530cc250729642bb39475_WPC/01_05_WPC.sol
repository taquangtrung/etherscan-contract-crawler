// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

/// @title: Wepard Cats
/// @author: manifold.xyz

import "./ERC721Creator.sol";

/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//                                                                                                                         //
//                                                                                                                         //
//                                                                                                                         //
//    `8.`888b                 ,8' 8 8888888888   8 888888888o      .8.          8 888888888o.   8 888888888o.             //
//     `8.`888b               ,8'  8 8888         8 8888    `88.   .888.         8 8888    `88.  8 8888    `^888.          //
//      `8.`888b             ,8'   8 8888         8 8888     `88  :88888.        8 8888     `88  8 8888        `88.        //
//       `8.`888b     .b    ,8'    8 8888         8 8888     ,88 . `88888.       8 8888     ,88  8 8888         `88        //
//        `8.`888b    88b  ,8'     8 888888888888 8 8888.   ,88'.8. `88888.      8 8888.   ,88'  8 8888          88        //
//         `8.`888b .`888b,8'      8 8888         8 888888888P'.8`8. `88888.     8 888888888P'   8 8888          88        //
//          `8.`888b8.`8888'       8 8888         8 8888      .8' `8. `88888.    8 8888`8b       8 8888         ,88        //
//           `8.`888`8.`88'        8 8888         8 8888     .8'   `8. `88888.   8 8888 `8b.     8 8888        ,88'        //
//            `8.`8' `8,`'         8 8888         8 8888    .888888888. `88888.  8 8888   `8b.   8 8888    ,o88P'          //
//             `8.`   `8'          8 888888888888 8 8888   .8'       `8. `88888. 8 8888     `88. 8 888888888P'             //
//                                                                                                                         //
//                                                ,o888888o.           .8.    8888888 8888888888 d888888o.                 //
//                                               8888     `88.        .888.         8 8888     .`8888:' `88.               //
//                                            ,8 8888       `8.      :88888.        8 8888     8.`8888.   Y8               //
//                                            88 8888               . `88888.       8 8888     `8.`8888.                   //
//                                            88 8888              .8. `88888.      8 8888      `8.`8888.                  //
//                                            88 8888             .8`8. `88888.     8 8888       `8.`8888.                 //
//                                            88 8888            .8' `8. `88888.    8 8888        `8.`8888.                //
//                                            `8 8888       .8' .8'   `8. `88888.   8 8888    8b   `8.`8888.               //
//                                               8888     ,88' .888888888. `88888.  8 8888    `8b.  ;8.`8888               //
//                                                `8888888P'  .8'       `8. `88888. 8 8888     `Y8888P ,88P'               //
//                                                                                                                         //
//                                                                                                                         //
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


contract WPC is ERC721Creator {
    constructor() ERC721Creator("Wepard Cats", "WPC") {}
}