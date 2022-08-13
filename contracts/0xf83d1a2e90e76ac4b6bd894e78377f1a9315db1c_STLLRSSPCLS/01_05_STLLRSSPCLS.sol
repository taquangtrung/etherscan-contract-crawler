// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

/// @title: Stellars Specials
/// @author: manifold.xyz

import "./ERC1155Creator.sol";

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//                                                                                                                  //
//                                                                                                                  //
//    [size=9px][font=monospace]                                                                                    //
//                                     ,     ;░      ⌐                                                              //
//                              ≥     ╔ ░   ,  ≥   «       «⌐                                                       //
//                                ░       ,,░   ≥ ░   ⌐  «░ ⌐                                                       //
//                         ░,       ░≤     ░    ╔░    ░;    ⌐  ,=░░                                                 //
//                        ⌠   ░»     ░░╓  ░░░, φ░░╕ ,φ░⌐    µ≥░                                                     //
//                  `░≥=,       ░░≥ ]░░░░╬░░░░╬░░░░φ░░░░ ╓φ░⌐    ░ ,»=░░                                            //
//                   └    ░░≥╓  ░░░░╠╬╬░╬░░╬╬░░╬╦╬░░░░╦╬░░░░⌐ ,╔φ░    ░                                             //
//              =-,   "    ▐░░░░╬╬╦░░░░╬╬╬░╬╬╬╬╬╬╬░╬╬╬░░╬░╬╬░░░░░        ,,«=                                       //
//               ░     ╠░φ≥╦░░░░╬░░╠╬╬╬╬╬╬╬▓▓▓▓▓▓▓▓╬╬▓╬╬╬░░╬░░░╠░╦φ░░      `                                        //
//                "     ░░░░░░░░╬╬╬▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓╬▓▓╬╬╬░░╬░░░░     ░                                          //
//          "≥≥≥≥≥≥░φφφφφ╠╬╬╬╬▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓╬╬╬╬░φφφφ"≥≥≥≥≥≥=                                    //
//            "░     ╙░░░░╠╬░╠╣╢▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓╬╬╬░░░░░░      ░                                      //
//              `.,╓╦φ░╬╬╬░╬╬╬╬▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓╬╬╬░╬╬╩φ╦╦,,░                                        //
//        ⁿ≥░░     ░░░░░╠╬╢╬▓╬▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓╬▓╬╬╬╬░░░░░"    ░░░=                                  //
//           "░    ,╓╠╬╬░╬╬╣╬▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓╬╠╬░░╬╬░,     ░                                     //
//            ,«^░░░░░░╠╠╬╬╬▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓╠╬╬╬░░░░░░░░,                                      //
//       .«≥░      `░╠╬░░╬╬▓╬▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓╬▓╬░░╬╬░"       ░=,                                 //
//          `"╚  ,φ░░░░╠╬╬╬╬▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓╬╬╬╬╬░░░░░╦  ░┴"                                    //
//            ,≥  "╚░░╠╬░░╠▓╬▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓╬╬▓░░░╬░░░╨^ ░=                                      //
//         «░      ,φ░░░╬╬╬╬╬╬▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓╬╬╬╬╬╬░░░╦      ░≥,                                  //
//           `""┴»φ░░░░░╬░░╠╬╬▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓╬╬░░░╬░░░░░≥░┘"`                                     //
//             ;░     ░░░░╠╬╬▓╬▓▓╬▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓╬▓╬╬╬╩░░░,     ≥                                       //
//           «░     ;░░░░╠░░░╬╬╬╬╬▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓╢╬╬╬╬░░░╬░░░░░      ░                                     //
//                 ░    ,░░░░░░░╬╬╬╠╬▓╬▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓╬╬▓╬╬╬░░╬░░░░     ,                                          //
//               ,░    ,░░░░╠╬╬╬╬╬░╬╬╬▓▓▓▓╬▓▓▓▓▓▓▓╬▓╬▓╬╬╬░╬╬╬╬╬░░░░░░     ≥                                         //
//              ≥ ░╚┴┘░"    ░░░░░░░╬╬╠░╬╬╬▓╬╬╬▓╠╬╬▓╬╬╬╬╬╬╬░░░░░░░    ░"┴░░ ░                                        //
//                    ░    ▐░░╩"░░░░░░╬╩░░░╬╬░░╬╬░░░╬╠░░░░░░░╙░░░     ,                                             //
//                   ░  ░┴`     ░░░░╚░░░░░╩░░╬░╩░░╬╬░░░░╚░░░⌐    ░"╚   ⌐                                            //
//                  "     ╒     ╩    ░░░"└░░░░╙░░░░ ░░░░   ╙∩    ░     "                                            //
//                        ░ ░"       ╚    ╚░░   ╬░    ╚     ⌐ "╚                                                    //
//                        "        ╚      ░╚     └    ░ "░  ⌐    `─                                                 //
//                               ░    ░  ░  ░      ░      "░⌐                                                       //
//                                    `░     ╚      "░                                                              //
//                                                                                                                  //
//                                                                                                                  //
//    [/font][/size]                                                                                                //
//                                                                                                                  //
//                                                                                                                  //
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


contract STLLRSSPCLS is ERC1155Creator {
    constructor() ERC1155Creator() {}
}