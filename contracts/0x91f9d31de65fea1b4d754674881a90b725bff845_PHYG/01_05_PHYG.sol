// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

/// @title: MM2 Lets Get Phygital
/// @author: manifold.xyz

import "./ERC721Creator.sol";

////////////////////////////////////////////////////////////////////////////////////////////
//                                                                                        //
//                                                                                        //
//    ▓▓▓▓▓▓███████▓▓▓▓▓▓▓▓▓████████▓▓▓▓▓██████▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓█▓█▓▓██▓▓███▓▓▓▓▓▓▓▓▓▓▓▓    //
//                                                                                        //
//    ▓▓████▓▓███████████▓▓▓▓▓▓▓▓▓▓▓▓▓█████████▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓    //
//                                                                                        //
//    ▓██▓▓╫██▌▓█╣▓▓▓██╣▓▓████████▓▓███████████▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓    //
//                                                                                        //
//    ███▓▓███▓█▓▓█████▓▓▓▓▓▓██████████▓▓▓▓███▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓    //
//                                                                                        //
//    ▓██▓██▓▓█▓████████████▓▓▓▓▓█▓▓▓█╣▓▓█████▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓    //
//                                                                                        //
//    ▓████▓███▓▓▓▓▓▓▓▓▓▓▓╢▓██████▓▓█▓▓█▓█▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓    //
//                                                                                        //
//    ▓▓▓▓▓███▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓█▓▓█▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓╣▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓    //
//                                                                                        //
//    ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓╣▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓    //
//                                                                                        //
//    ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓    //
//                                                                                        //
//    ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓    //
//                                                                                        //
//    ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓╣▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓█▓▓▓▓▓▓▓▓▓▓▓█▓████▓▓█▓▓▓▓▓▓▓▓█▓▓▓▓▓▓▓▓▓    //
//                                                                                        //
//    ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓██▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓████████████▓█▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓    //
//                                                                                        //
//    ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓█▓╣╢▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓██████▓██████▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓    //
//                                                                                        //
//    ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓█▓▓▓╢╣▓▓▓▓▓▓▓▓▓▓██████████████▓▓████████▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓    //
//                                                                                        //
//    ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓█▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓███▓▓▓▓██▓▓▓▓██████████▓▓██▓▓▓▓▓▓▓▓▓▓╣▓▓▓▓▓▓    //
//                                                                                        //
//    ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓╣▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓█▓▓▓▓▓▓▓▓▓▓▓██████████████╣▓▓▓▓▓▓▓▓▓▓╢▓▓▓▓▓▓    //
//                                                                                        //
//    ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓█▓╢▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓██████████████▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓    //
//                                                                                        //
//    ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓██▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓███▓▓████████████▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓    //
//                                                                                        //
//    ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓███████████████▓▓▓▓▓▓▓▓▓▓▓▓╣▓▓▓▓▓▓    //
//                                                                                        //
//    ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓██▓▓▓▓▓▓█▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓██▓███████▓█▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓    //
//                                                                                        //
//    ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓█████▓▓█▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓████████▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓    //
//                                                                                        //
//    █╣▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓█████▓▓▓█▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓███████▓▓▓▓▓▓▓▓▓▓▓▓█▓▓▓▓▓▓▓▓    //
//                                                                                        //
//    ██▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓██▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓█████▓▓▓▓▓▓▓▓▓▓▓▓████▓████▓    //
//                                                                                        //
//    ██╢▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓███▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓████████████▓▓▓▓▓▓▓▓▓█████▓█████╣    //
//                                                                                        //
//    █▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓█████▓▓▓▓▓▓▓▓▓▓▓▓█▓▓▓▓▓▓▓▓▓█████████████▓▓▓▓▓▓▓▓▓████▓███████▓    //
//                                                                                        //
//    ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓████▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓██▓▓█▓▓▓████████▓▓▓▓▓▓█▓███▓▓█████▓██╣    //
//                                                                                        //
//    ▓▓▓▓▓▓▓▓▓▓▓▓█▓▓▓▓▓██▓▓▓▓▓███▓█▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓███▓▓▓▓▓▓▓███▓▓▓▓███▓▓█▓▓    //
//                                                                                        //
//    ▓▓▓▓▓▓▓▓▓▓▓█▓▓▓▓▓▓██▓▓▓█▓████▓▓▓█▓▓▓▓▓▓▓▓▓▓▓▓█████▓▓▓▓▓▓▓▓▓╣▓▓▓█▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓    //
//                                                                                        //
//    ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓██▓█████████▓▓▓▓▓▓▓▓████████▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓    //
//                                                                                        //
//    ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓████▓▓▓▓▓▓▓▓▓█████████████▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓    //
//                                                                                        //
//    ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓█▓▓█▓▓▓▓██▓▓▓▓▓█▓▓█▓▓████████████▓▓▓█▓▓▓╣╢▓▓▓██▓█▓▓█▓▓█▓█▓▓▓▓▓    //
//                                                                                        //
//    ▓▓▓▓▓▓▓▓▓▓▓▓███████▓▓▓▓█▓█████▓▓▓▓▓████████▓█████▓█▓▓▓▓▓▓▓▓███▓▓▓▓█████▓▓██████▓    //
//                                                                                        //
//    ▓▓▓▓▓▓▓▓███████████▓█▓▓▓▓▓▓▓▓█▓▓▓▓▓▓███████████████▓▓▓▓▓▓▓▓██▓▓█████████████████    //
//                                                                                        //
//    █▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓█▓▓▓▓▓▓▓█▓█████████▓▓▓▓▓▓▓▓▓▓▓▓██████████████████▓    //
//                                                                                        //
//    █████████▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓██████████████▓▓████████▓█▓███████████    //
//                                                                                        //
//    ██████▓▓▓▓▓▓▓██▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓█▓▓██▓▓████▓▓▓▓▓▓████████▓█▓████▓▓████████████    //
//                                                                                        //
//    █████████████████████▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓█▓▓▓██▓▓▓▓▓▓▓█████████▓▓▓▓▓▓██▓████████████    //
//                                                                                        //
//    ██████████▓▓████████▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓██▓▓▓▓█████████████▓▓▓▓▓▓▓▓█████████████    //
//                                                                                        //
//    █████▓▓▓▓▓▓▓▓▓▓█████▓▓▓▓▓▓▓▓▓▓▓▓▓███▓▓███▓██▓██████████████▓▓▓██████████████████    //
//                                                                                        //
//    ████▓▓▓▓▓▓▓▓▓▓██████▓▓▓▓▓▓▓▓██▓███▓▓▓███████████████████████████████████████████    //
//                                                                                        //
//    ██▓▓▓▓▓▓▓▓▓▓▓███████▓▓▓██▓▓▓█▓████████▓▓▓▓██████████████████████████████████████    //
//                                                                                        //
//    ███▓█████████████████▓████▓▓██▓▓██▓███████████████████▓██▓██████████████████████    //
//                                                                                        //
//    ████████████████████████████▓▓▓▓███████████████████▓▓▓▓▓██▓▓▓█▓▓▓▓▓▓████████████    //
//                                                                                        //
//    █████████████████████████████████████████████████▓▓█████▓██▓█▓█████▓▓███████████    //
//                                                                                        //
//    ████████▓▓█▓▓█▓▓▓█████████████████████████████████▓█▓▓▓▓▓▓▓█▓▓▓▓▓███████████████    //
//                                                                                        //
//    ████▓▓███▓██████████▓▓▓█▓▓███████████████████████▓▓███▓█████████████████████████    //
//                                                                                        //
//    ██████▓▓███▓▓▓▓▓▓▓██▓███▓▓▓█▓███▓▓████████████████▓▓██▓▓█▓▓▓▓███████████████████    //
//                                                                                        //
//    ███████▓█▓███████████▓███████████▓▓████████████████▓▓▓▓▓▓▓██████████████████████    //
//                                                                                        //
//    ███████▓▓██▓▓▓▓▓▓▓█▓▓█▓▓▓▓▓███████████████████████████▓████▓▓▓▓▓▓███████████████    //
//                                                                                        //
//    ███████▓▓▓█████████████████████████████████████████▓▓▓█▓▓▓██████████████████████    //
//                                                                                        //
//    █████████████████▓████████████████████████████████▓▓█▓▓████▓▓██▓████████████████    //
//                                                                                        //
//    ▓▓▓██████▓▓█▓▓▓▓▓▓▓▓▓▓▓██████▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓█▓▓▓▓▓▓▓▓▓▓▓██▓██▓▓███████████▓▓▓    //
//                                                                                        //
//                                                                                        //
////////////////////////////////////////////////////////////////////////////////////////////


contract PHYG is ERC721Creator {
    constructor() ERC721Creator("MM2 Lets Get Phygital", "PHYG") {}
}