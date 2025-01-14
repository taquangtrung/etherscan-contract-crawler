// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

/// @title: Powerfull women
/// @author: manifold.xyz

import "./ERC721Creator.sol";

////////////////////////////////////////////////////////////////////////////////////////////////
//                                                                                            //
//                                                                                            //
//                                                                                            //
//         ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓███████████████    //
//         ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓██▓▓██▓█████████    //
//         ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓██▓██████████    //
//         ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓█▓▓▓▓▓████████████    //
//         ▐▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒▒▒▒▄███▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓████████████    //
//         ▐▓▓▓▓▓▓▓▓▓▓▓▓█▌▒▒▓████▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓█▓▓▓██████████████    //
//         j▓▓▓▓▓▓▓▓▓▓▓█████████▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓█▓▓▓██▓███████    //
//          ▓▓▓▓▓▓▓▓▓█████████▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓██▓▓██▓███████    //
//          ▓▓▓▓▓▓▓▓█████████▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓██▓███████████    //
//        ░ ▓▓▓▓▓▓▓█████████▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓██████████████████    //
//        ░ ▐▓▓▓▓██████████▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓████████▓████████████████    //
//        ░░▐▓▓▓██████████▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓███████▓████▓███████████████████    //
//        ╙░░▓▓████████████▓▓▓▓▓▓▓▓▓▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒╢▒╢╢╢╢╢╢╢╢╣╣╣╢╢╢▓█████████    //
//        ░░░▓████████▀▒█████▓▓█▓▓▓▌▒▒▒▒╢▒▒▒╢▒▒▒▒▒▒▒╢▒▒▒▒▒▒▒▒▒▒▒╢▒╫╣╣╢╢╢╫▓╣╣╣╣╣▓▓█████████    //
//        ░░░████████▓▒▒╢▓████▓██▓▓▌▒▒▒▒▒▒▒▒▒▒▒▒╢▒▒▒▒▒▒▒▒▒▒▓▓▓▓▓▓▓▓▓╣╢╣╢▓▓▓▓╢╣╫▓▓█████████    //
//        ░░▐████████▀▀▒╫▓▓████████▌▒▒╣▒▒▒▒╢╢╢╢╢▒▒▒▒▒╢▒▒▒▒▒▒▒╢▓▓▓▓▓▓▓▒╢▓▓▓▓╢╢╢╢▓▓█████████    //
//        ░░████████▓╣╣▒▓▓▓████████▌▒╢╢╢▒╢╢╢╢╣╣╣╣╢╣▒╣╢╢╢╢▒▒▒▒▒╢╢╫▓▓▓▓▓▓╣╣╣╢╣╣╣╣▓▐█████████    //
//        ▒▐█████████▓▒▓▓▓█████████▌╣╢╢▒╢╢▒╢▒▒▒▒▒▒╢▒▒▒╢╢▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓╣╢╢╢╢╣▒▐█████████    //
//        ▌▐███████████████████████▌╢╢╢╣╢▒▒╢╢╢╢╣╢╢╣╣▓▓▓╬▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒╢▒▒▒▒▒▐█████████    //
//        ▓█████████████████████████╢╢╢╢▒╢╢▒▓▒╢╣▓▓▓▓▓╫▓╣╢╢▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓╢╫▓▓╫█████████    //
//        ▓█████████████████████████╣▒╢▓▓▓▓▓▓╣▓▓▓▓╣╢╣╢╢╫▓▓▓▓▓▒▒▒▒▒▓▓╣▒▓▓▓▓▓▓▓▓▓▓▒█████████    //
//        ╫█████████████████████████╣▓▓▓▓▓▓▓▓▓▓▓██▓▓▓▓▓▓▓▒▒▒╢▓▓▓╢▓▓▓▓▓▓▓▓▓▓▓▓▓▓╣╫█████████    //
//        ▐█████████████████████████▓▓▓▓▓▓█▓▓▓▓▓████▒╢╣▒╣╢▓▓╣╢╢╢╢╢╢▓▓▓▓▓▓▓▓▓▓▓▓▓▓█████████    //
//        ▐█████████████████████████▓▓▓▓▓▓▓▓▓▒▒▒▓▓▓▓╣▓▓▓▓▓▓▓▓▒╫╢╢╢╢▓▓▓▓▓▓▓▓▓▓▓▓▓▓█████████    //
//        ▒█████████████████████████▓▓▓▓▓▓▓▓▓▓▓▓▓╢▓╣╢╢▓▓▓▓▓▓▓▓▓▓╣╢╢▓▓▓▓▓▓▓▓╫▓▓▓▓▓█████████    //
//        ╣█████████████████████████╣▓╣╢╢▓▓▓▓╣▓╢╢╢╢▓╣╢╫▓▓╣▒╫▓▓▒╢╣╢╣▒╢╢▒▒╢╣╢▓▓▓▓▓▓█████████    //
//                                                                                            //
//    ---                                                                                     //
//    ^[ [^ascii ^art ^generator](http://asciiart.club) ^]                                    //
//                                                                                            //
//                                                                                            //
//                                                                                            //
////////////////////////////////////////////////////////////////////////////////////////////////


contract MUJER is ERC721Creator {
    constructor() ERC721Creator("Powerfull women", "MUJER") {}
}