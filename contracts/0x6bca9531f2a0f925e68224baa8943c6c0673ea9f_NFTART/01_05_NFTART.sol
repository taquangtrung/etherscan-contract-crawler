// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

/// @title: NFTARTPR
/// @author: manifold.xyz

import "./ERC721Creator.sol";

//////////////////////////////////////////////////////////
//                                                      //
//                                                      //
//              ____                                    //
//            o8%8888,                                  //
//          o88%8888888.                                //
//         8'-    -:8888b                               //
//        8'         8888                               //
//       d8.-=. ,==-.:888b                              //
//       >8 `~` :`~' d8888                              //
//       88         ,88888                              //
//       88b. `-~  ':88888                              //
//       888b ~==~ .:88888                              //
//       88888o--:':::8888                              //
//       `88888| :::' 8888b                             //
//       8888^^'       8888b                            //
//      d888           ,%888b.                          //
//     d88%            %%%8--'-.                        //
//    /88:.__ ,       _%-' ---  -                       //
//        '''::===..-'   =  --.                         //
//                 __,aaPPPPPPPPaa,__                   //
//             ,adP"""'          `""Yb,_                //
//          ,adP'                     `"Yb,             //
//        ,dP'     ,aadPP"""""YYba,_     `"Y,           //
//       ,P'    ,aP"'            `""Ya,     "Y,         //
//      ,P'    aP'     _________     `"Ya    `Yb,       //
//     ,P'    d"    ,adP""""""""Yba,    `Y,    "Y,      //
//    ,d'   ,d'   ,dP"            `Yb,   `Y,    `Y,     //
//    d'   ,d'   ,d'    ,dP""Yb,    `Y,   `Y,    `b     //
//    8    d'    d'   ,d"      "b,   `Y,   `8,    Y,    //
//    8    8     8    d'    _   `Y,   `8    `8    `b    //
//    8    8     8    8     8    `8    8     8     8    //
//    8    Y,    Y,   `b, ,aP     P    8    ,P     8    //
//    I,   `Y,   `Ya    """"     d'   ,P    d"    ,P    //
//    `Y,   `8,    `Ya         ,8"   ,P'   ,P'    d'    //
//     `Y,   `Ya,    `Ya,,__,,d"'   ,P'   ,P"    ,P     //
//      `Y,    `Ya,     `""""'     ,P'   ,d"    ,P'     //
//       `Yb,    `"Ya,_          ,d"    ,P'    ,P'      //
//         `Yb,      ""YbaaaaaadP"     ,P'    ,P'       //
//           `Yba,                   ,d'    ,dP'        //
//              `"Yba,__       __,adP"     dP"          //
//                  `"""""""""""""'                     //
//                                                      //
//                                                      //
//////////////////////////////////////////////////////////


contract NFTART is ERC721Creator {
    constructor() ERC721Creator("NFTARTPR", "NFTART") {}
}