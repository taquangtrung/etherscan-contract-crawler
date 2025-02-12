// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

/// @title: Project 1
/// @author: manifold.xyz

import "./ERC721Creator.sol";

//////////////////////////////////////////////////////////////////////////////////////////////
//                                                                                          //
//                                                                                          //
//                                                                                          //
//      ▒▒▓▓░░                                                  ░░      ░░░░        ░░░░    //
//            ████░░░░░░░░░░░░████▒▒▒▒▒▒██    ██▒▒██▒▒▒▒██░░██                              //
//              ████░░░░░░░░░░░░░░██▒▒▒▒██  ██▒▒██████▒▒██░░██                              //
//                ██░░░░░░░░░░░░░░██▒▒▒▒▒▒██▒▒▒▒▒▒▒▒▒▒████░░██                              //
//                ██░░░░░░░░░░░░░░██▒▒▒▒▒▒▒▒████▒▒████▒▒▒▒████                              //
//              ██░░░░░░░░░░░░░░██████▓▓▒▒▒▒▒▒▒▒████████▒▒▒▒▒▒██    ██                      //
//              ██░░░░░░░░░░░░██▒▒▒▒██▒▒▒▒▒▒▒▒▒▒██▒▒▒▒▒▒██▒▒▒▒▒▒██  ████                    //
//            ██░░░░░░░░░░░░██▓▓▒▒████▒▒▒▒▒▒▒▒▒▒██▒▒▒▒▒▒▒▒▒▒▒▒▓▓▒▒██▒▒████                  //
//            ██░░░░░░░░░░██▒▒▒▒▒▒██▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒░░▒▒▒▒▒▒▒▒██▒▒▒▒██                  //
//            ██░░░░░░░░██▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒░░░░░░▒▒▒▒▒▒▒▒░░▒▒▒▒██                //
//            ██░░░░░░██▒▒██▒▒▒▒▒▒▓▓▒▒▒▒▒▒▒▒▒▒▒▒▓▓▒▒▒▒░░░░░░▒▒▒▒▒▒░░░░░░▒▒██                //
//              ██░░░░░░██▒▒████▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒░░░░░░░░▒▒▒▒░░░░░░▒▒██                //
//              ██░░░░░░██▒▒██▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▓▓▒▒▒▒▒▒░░░░░░░░▒▒▒▒░░░░░░▒▒██                //
//                ██░░░░░░██▒▒▒▒▒▒▒▒▒▒████████▒▒▒▒▒▒▒▒░░░░░░▒▒▒▒▒▒░░░░▒▒▒▒██                //
//                  ██░░██▒▒▒▒▒▒▒▒▒▒██▒▒▒▒▒▒▒▒██▒▒▒▒▒▒░░░░▒▒██▒▒▒▒░░▒▒██▒▒██                //
//                  ██░░██▓▓▓▓▓▓▓▓▓▓██▓▓▓▓▓▓▓▓██▓▓▓▓▓▓░░░░▓▓██▓▓▓▓░░▓▓██▓▓██                //
//                  ████▒▒▒▒▒▒▒▒▒▒▒▒▒▒██████▒▒▒▒██▒▒▒▒▒▒░░▒▒██▒▒▒▒░░▒▒██▒▒██                //
//                  ██▒▒▒▒▒▒▒▒▒▒▒▒▒▒██▒▒▒▒▒▒██▒▒▒▒████▒▒░░▒▒██▒▒▒▒░░▒▒██▒▒████████          //
//                  ██▓▓▓▓▓▓▓▓▓▓▓▓▓▓██▓▓▓▓▓▓██▓▓▓▓████▓▓░░▓▓██▓▓▓▓░░▓▓██▓▓████████          //
//                ██▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒████▒▒██████  ██████████████████████                //
//              ██▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒██    ██▒▒██              ██  ████▒▒▒▒████▓▓██        //
//              ██▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓██░░░░██▓▓██░░░░░░░░░░░░░░██░░████▓▓▓▓████████        //
//              ██▒▒████████▒▒▒▒▒▒▒▒▒▒██      ████████            ████▒▒██████              //
//                ▓▓    ██▒▒▒▒▒▒▒▒▒▒▒▒██      ██████████        ██    ██▒▒▒▒██              //
//                ██    ██▓▓▓▓▓▓▓▓▓▓▓▓██░░░░░░██████████░░░░░░░░▓▓░░░░██▓▓▓▓██              //
//                        ██████▒▒▒▒▒▒▒▒██    ██████████████      ████  ████                //
//                              ████▓▓▒▒██    ▓▓██████████████████  ████                    //
//                                    ██▒▒██  ████████████████      ██                      //
//                                      ████    ██▒▒▒▒██████    ████                        //
//                                        ████    ██▒▒▒▒██    ██                            //
//                                            ████  ████    ██                              //
//                                                                                          //
//                                                                                          //
//                                                                                          //
//////////////////////////////////////////////////////////////////////////////////////////////


contract PO1 is ERC721Creator {
    constructor() ERC721Creator("Project 1", "PO1") {}
}