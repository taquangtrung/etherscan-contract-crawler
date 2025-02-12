// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

/// @title: Forces of Nature
/// @author: manifold.xyz

import "./ERC721Creator.sol";

////////////////////////////////////////////////////////////////////////////////////////////////
//                                                                                            //
//                                                                                            //
//     ________________________________________________________________________________       //
//        ________________________________________________________________▄ ______________    //
//        ____________________________________________________________ __]█µ______________    //
//        ____________________________________________________________█__██▌______________    //
//        ______,___█µ_______________________________________________▓█_▓██_▄█____________    //
//        _____ ██  ██ _▐█ _________________________________________]██▓███▄██_ __________    //
//        ______███_███_▐█▌_█▌______________________________________█████████▌▄█▌_________    //
//        ______╫██████µ╟██▐██_____________________________________█████████████_▄▓ ______    //
//        ____╓▄▐██████▌╫█████_┌█▌________________________________▐████████████▄███_______    //
//        ____╟███████████████_██⌐____________________________ █ ╓████████████████________    //
//        ____╘███████████████▓██_╓▄__________________________▐█████████████████▀_,▄█▌____    //
//        _____█████████████████▌▓█▀ _________________________████████████████▌▄████▀_____    //
//        _____└████████████████████▌________________________████████████████████████▌____    //
//        ______╟████████████████████▀______________________███████████████████████▀└_____    //
//        _______█████████████████████¬___________________▄████████████████████▀▀,,,▄,____    //
//        _______ ████████████████████▌_________________▄████████████████████████████¬____    //
//        _________╙██████████████████ _______________▄█████████████████████████████▌_____    //
//        ____________└╙▀████████████▀__________ ___▓██████████████████████████████▀`_____    //
//        _______________▐█████████████▄_______  _▄████████████████████████████████`______    //
//        _______________ ███████████████µ_____╓▓████████████████████████████████▀▀_______    //
//        _________________╙█████████████████████████████████████████████████████▀________    //
//        __________________╓██████████████████████████████████████████████████╙─_________    //
//        __________________█████████████████████████████████████████████████┘____________    //
//        _________________███▀▀▀▀▀▀████████████████████████████████████▀▀▀_______________    //
//        _________________╙▀________╙█████████████████████████████▀▀╙____________________    //
//        ____________________________╙███████████████████▄,╙╙╙╙└_________________________    //
//        _____________________________╙██████████████████████▓▄▄,________________________    //
//        _____________________________▐███████████████████████████████▓▄▄▄,______________    //
//        _____________________________███████████████████████████████████████▀\__________    //
//        ________________________▄██▌▄███████████████▀██████████████████▀╙_______________    //
//        ___________________▀██▄╙▀█████████████__________╙▀█████████▀▀___________________    //
//        __________________]█████▓▓████▀╙███▀╙___________________________________________    //
//        ___________________└____╠█▌_█▌__________________________________________________    //
//        _______________________▄█▀_██▀__________________________________________________    //
//        ________________________________________________________________________________    //
//        ________________________________________________________________________________    //
//                                                                                            //
//                                                                                            //
//                                                                                            //
////////////////////////////////////////////////////////////////////////////////////////////////


contract WILD is ERC721Creator {
    constructor() ERC721Creator("Forces of Nature", "WILD") {}
}