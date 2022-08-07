// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

/// @title: FTP (For The People)
/// @author: manifold.xyz

import "./ERC721Creator.sol";

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//                                                                                                                                      //
//                                                                                                                                      //
//                                                          ### ###  #### ##  ### ##                                                    //
//                                                           ##  ##  # ## ##   ##  ##                                                   //
//                                                           ##        ##      ##  ##                                                   //
//                                                           ## ##     ##      ##  ##                                                   //
//                                                           ##        ##      ## ##                                                    //
//                                                           ##        ##      ##                                                       //
//                                                          ####      ####    ####                                                      //
//                                                                                                                                      //
//    ### ###   ## ##   ### ##            #### ##  ###  ##  ### ###           ### ##   ### ###   ## ##   ### ##   ####     ### ###      //
//     ##  ##  ##   ##   ##  ##           # ## ##   ##  ##   ##  ##            ##  ##   ##  ##  ##   ##   ##  ##   ##       ##  ##      //
//     ##      ##   ##   ##  ##             ##      ##  ##   ##                ##  ##   ##      ##   ##   ##  ##   ##       ##          //
//     ## ##   ##   ##   ## ##              ##      ## ###   ## ##             ##  ##   ## ##   ##   ##   ##  ##   ##       ## ##       //
//     ##      ##   ##   ## ##              ##      ##  ##   ##                ## ##    ##      ##   ##   ## ##    ##       ##          //
//     ##      ##   ##   ##  ##             ##      ##  ##   ##  ##            ##       ##  ##  ##   ##   ##       ##  ##   ##  ##      //
//    ####      ## ##   #### ##            ####    ###  ##  ### ###           ####     ### ###   ## ##   ####     ### ###  ### ###      //
//                                                                                                                                      //
//                                                                                                                                      //
//                                                                                                                                      //
//                                                                                                                                      //
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


contract FTP is ERC721Creator {
    constructor() ERC721Creator("FTP (For The People)", "FTP") {}
}