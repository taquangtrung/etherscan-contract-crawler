// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

/// @title: Kesara 1 of 1
/// @author: manifold.xyz

import "./ERC721Creator.sol";

///////////////////////////////////////////////////////////////////////////////////////////
//                                                                                       //
//                                                                                       //
//    88      a8P                                                                        //
//    88    ,88'                                                                         //
//    88  ,88"                                                                           //
//    88,d88'       ,adPPYba,  ,adPPYba,  ,adPPYYba,  8b,dPPYba,  ,adPPYYba,             //
//    8888"88,     a8P_____88  I8[    ""  ""     `Y8  88P'   "Y8  ""     `Y8             //
//    88P   Y8b    8PP"""""""   `"Y8ba,   ,adPPPPP88  88          ,adPPPPP88             //
//    88     "88,  "8b,   ,aa  aa    ]8I  88,    ,88  88          88,    ,88             //
//    88       Y8b  `"Ybbd8"'  `"YbbdP"'  `"8bbdP"Y8  88          `"8bbdP"Y8             //
//                                                                                       //
//          ___                   ___          ___                     ___               //
//         /  /\      ___        /__/\        /  /\                   /  /\              //
//        /  /:/_    /  /\       \  \:\      /  /:/_                 /  /:/_             //
//       /  /:/ /\  /  /:/        \  \:\    /  /:/ /\  ___     ___  /  /:/ /\            //
//      /  /:/ /::\/__/::\    _____\__\:\  /  /:/_/::\/__/\   /  /\/  /:/ /:/_           //
//     /__/:/ /:/\:\__\/\:\__/__/::::::::\/__/:/__\/\:\  \:\ /  /:/__/:/ /:/ /\          //
//     \  \:\/:/~/:/  \  \:\/\  \:\~~\~~\/\  \:\ /~~/:/\  \:\  /:/\  \:\/:/ /:/          //
//      \  \::/ /:/    \__\::/\  \:\  ~~~  \  \:\  /:/  \  \:\/:/  \  \::/ /:/           //
//       \__\/ /:/     /__/:/  \  \:\       \  \:\/:/    \  \::/    \  \:\/:/            //
//         /__/:/      \__\/    \  \:\       \  \::/      \__\/      \  \::/             //
//         \__\/       _____     \__\/        \__\/             ___   \__\/  ___         //
//         /  /\      /  /::\     ___          ___  ___        /  /\        /__/\        //
//        /  /:/_    /  /:/\:\   /  /\        /  /\/  /\      /  /::\       \  \:\       //
//       /  /:/ /\  /  /:/  \:\ /  /:/       /  /:/  /:/     /  /:/\:\       \  \:\      //
//      /  /:/ /:/_/__/:/ \__\:/__/::\      /  /:/__/::\    /  /:/  \:\  _____\__\:\     //
//     /__/:/ /:/ /\  \:\ /  /:|__\/\:\__  /  /::\__\/\:\__/__/:/ \__\:\/__/::::::::\    //
//     \  \:\/:/ /:/\  \:\  /:/   \  \:\/\/__/:/\:\ \  \:\/\  \:\ /  /:/\  \:\~~\~~\/    //
//      \  \::/ /:/  \  \:\/:/     \__\::/\__\/  \:\ \__\::/\  \:\  /:/  \  \:\  ~~~     //
//       \  \:\/:/    \  \::/      /__/:/      \  \:\/__/:/  \  \:\/:/    \  \:\         //
//        \  \::/      \__\/       \__\/        \__\/\__\/    \  \::/      \  \:\        //
//         \__\/                                               \__\/        \__\/        //
//                                                                                       //
//                                                                                       //
///////////////////////////////////////////////////////////////////////////////////////////


contract KR1 is ERC721Creator {
    constructor() ERC721Creator("Kesara 1 of 1", "KR1") {}
}