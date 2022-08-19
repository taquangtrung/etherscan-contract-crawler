// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

/// @title: MULE
/// @author: manifold.xyz

import "./ERC1155Creator.sol";

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//                                                                                                                                                                                                                //
//                                                                                                                                                                                                                //
//                                                                                                                                                                                                                //
//                                                                                     @@@@@@@@@@@@@@                       @@@@@@@@@@@@@@@@                                                                      //
//                                                                       @@@%@@ @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@         @@@@@@@@@@@@@@@@@@@@@@@@@                                                               //
//                                                                      @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@    @@@@@@@@@@@@@@@@@@@@@@@@@@                                                               //
//                                                                      @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@*@@@@@@@@@@@@@@@@@@@@@@@@@@@                                                               //
//                                                                       @@@@                       @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@                                                                //
//                                                                                                      @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@                                                                //
//                                                                                                       @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@                                                                  //
//                                                                                                    @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@                                                                   //
//                                                                                                  @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@  @@@@@@@                                                         //
//                                                                                                @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@                                                       //
//                                                                                             ,@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@                                                      //
//                                                                                          *@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@    @@@@@@@@@@@@@@                                                     //
//                                                                                        @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@  @@@@@@@@@           @@@@@@@@@                                                     //
//                                                                                     @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@  @        @@@#                                                                          //
//                                                                                  @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@                                                                                             //
//                                                                             @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@                                                                                                //
//                                                                           @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@.                                                                                  //
//                                                                          @@@@  @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@                                                                                 //
//                                                                               @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@                                                                                //
//                                  ,@@@@.                                       @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@                                                                              //
//                         @@@@@@@@@@@@@@@@@                                  @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@                                                                             //
//                      @@@@@@@@@@@@@@@@@@@@@@@@@                           @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@                                                                            //
//                     %@@@&          @ @@@@@@@@@@@@@@                   @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@                                                                           //
//                                      @@@@@@@@@@@@@@@@@@           @@@@@@@@@@@@@@@@@@@@@%                                @@@@@@@@@@@@@                                                                          //
//                                          @@@@@@@@@@@@@@@@@@@ @ @@@@@@@@@@@@@@@@@@@@@                                      @@@@@@@@@@@@                                                                         //
//                                             @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@,                                          @@@@@@@@@@@                                                                        //
//                                                 @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@                                               @@@@@@@@@@                                                                       //
//                                                    @@@@@@@@@@@@@@@@@@@@@@@@@                                                   @@@@@@@@@@                                                                      //
//                                                       @@@@@@@@@@@@@@@@@@@@                                                      @@@@@@@@@    @@@@@@@@@                                                         //
//                                                          @@@@@@@@@@@@@@@                                                         @@@@@@@@@@@@@@@@@@@@@@                                                        //
//                                                             @@@@@@@@@@                                                              @@@@@@@@@@@@@@@@@                                                          //
//                                                                  @@                                                                 @@@@@@@@@@@@@                                                              //
//                                                                                                                                       @@@                                                                      //
//                                                                                                                                                                                                                //
//                                                                                                                                                                                                                //
//                                                                                                                                                                                                                //
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


contract MULE is ERC1155Creator {
    constructor() ERC1155Creator() {}
}