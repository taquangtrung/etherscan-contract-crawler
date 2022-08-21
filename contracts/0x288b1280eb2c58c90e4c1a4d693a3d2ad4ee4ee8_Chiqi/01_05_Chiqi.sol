// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

/// @title: Chiqis
/// @author: manifold.xyz

import "./ERC721Creator.sol";

////////////////////////////////////////////////////////////////////////////////////////////
//                                                                                        //
//                                                                                        //
//                                                                                        //
//                                                                                        //
//                         ,,▄▄▄▄▄██████████▄▄▄▄,            ▄▄,                          //
//                                                                                        //
//       ¬  -        ,▄▄███████████████████▀`  ▀███4▄,      █████▄                        //
//                                                                                        //
//          ═.-   ▄██████████████████████▀      █    ▀██▄▄  ▀█████▌ ▄▄▄███▄▄▄             //
//                                                                                        //
//            ,▄████████████████████████▌      ▄⌐     ██████▄▐█████████████████▄          //
//                                                                                        //
//          ▄███████████████████████████W     ▄█W     ▐██████████████████████████▄        //
//                                                                                        //
//        ▄██████████████████████████████▄▄▄█████     █████████████████████████████       //
//                                                                                        //
//        ▀████████████████████████████████████████▄▄█████████████▀'`▀▀████████████       //
//                                                                                        //
//          ▀█████████████████████████████████████████████████████W     '▀████████▀       //
//                                                                                        //
//            ▀████████████████████████████████████████████████████         └▀▀▀▀         //
//                                                                                        //
//              '▀█████████████████████████████████████████████████⌐                      //
//                                                                                        //
//                 ▀▀██████████████████████████████████████████████▌                      //
//                                                                                        //
//                    ▀▀███████████████████████████████████████████▌                      //
//                                                                                        //
//                       `▀▀███████████████████████████████████████▌  ▄██▄,               //
//                                                                                        //
//                            '▀▀▀█████████████████████████████████▌,███████              //
//                                                                                        //
//                             ▄▄████████████████████████████████████████████▄            //
//                                                                                        //
//                            `"▀▀└`███████████████████████████████████████████,          //
//                                                                                        //
//                                 ▐██ ▀████████████████████████████████████████▄         //
//                                                                                        //
//                   ▄▄▄▄▄▄,        ▀    ▀███████████████████████████████████████▄        //
//                                                                                        //
//                 ▄████████████▄▄,       ▀███████████████████████████████████████▄       //
//                                                                                        //
//               ,███████████████████▄▄     ▀██████████████████████████████▀▀██████       //
//                                                                                        //
//              ▄███▀▐██████▀█████████████▄, '██████████████████████████████   ▀▀▀█       //
//                                                                                        //
//             ████┘ ███"███   "▀█████████████▄▄█████████████████████████████             //
//                                                                                        //
//            ███▀   ██▀ ██▀       ▀▀██████████████████████████████████ ▀█████            //
//                                                                                        //
//           ▐█▀     "'                ▀▀▀█████████████████████████████   "▀██.           //
//                                                                                        //
//                                     ▄███████████████████████████▌████     ▀            //
//                                                                                        //
//                                    █████████████████████████████▌ "▀█                  //
//                                                                                        //
//                                    ▀████████████████████████████                       //
//                                                                                        //
//                                      ▀▀████████████████████████▀                       //
//                                                                                        //
//                                          "▀▀████████████████▀▀                         //
//                                                                                        //
//                                   ▄▄███████████████████▄,                              //
//                                                                                        //
//                                ▄██████████████████████████                             //
//                                                                                        //
//                              ▄███████████████████████████▀▀                            //
//                                                                                        //
//                            ,███████████████████████▀▀▀└                                //
//                                                                                        //
//                            "▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀''''`                                       //
//                                                                                        //
//                                                                                        //
//                                                                                        //
//                                                                                        //
////////////////////////////////////////////////////////////////////////////////////////////


contract Chiqi is ERC721Creator {
    constructor() ERC721Creator("Chiqis", "Chiqi") {}
}