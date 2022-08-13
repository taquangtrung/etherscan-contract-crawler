// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

/// @title: Julie-Mae
/// @author: manifold.xyz

import "./ERC721Creator.sol";

////////////////////////////////////////////////////////////////////////////////////////
//                                                                                    //
//                                                                                    //
//                                                                                    //
//                                           ░                                        //
//                                                                                    //
//                                           ░                                        //
//                                                                                    //
//                                  ▄        ░    █          ]▄                       //
//                                   ▀█   ╓   ▐  ]█▌    ▐    ██        ░              //
//                                    ▓█     ░¬  ║██      ,¢█▌ `  ,                   //
//                                 N  ║▓▌  ▐   ▌ ▌╟▓ [ ▐ ƒ░▓▀ ╛  ¿    ,▄▀             //
//                        ▀█▄   Y   ╙ ▌▐▓N  µ░ ▓▐░▐▓▌▌ ▌ ▌▓█ ╛  Æ   ▄▓█▀ ¿            //
//                          ▀██▄▄ N   ▐φ░▒▒▓█, ▐▌░▐▓▓⌐ '▐░▓▓▄  ╛ ▄¢▄▓█ a              //
//                       w   `▀▀▀█▓▄N  ▀▀░░▓▒▒▓▄▌░▐▒▒▄▐▀░░▀▓▌,,4░░▓█▀æ'    .*         //
//                          ═, "Ñ░▀▒▒▓N▄ █░░▓▓██░▄▐▓▓█░░▄▓▒▓▄▀░░▓██X`  ,∞"    ,¢r     //
//                     ∞⌂      "═▐▄░░▓▓▓▓▓▄φ▒░░░░░▒▒▒░▒▀▀▀█░░░▒▒█▀  ,═`,,,,,╦$█▀      //
//                  P▀▀█▄▄, "ⁿ═w,  ▀▄░░▀▓░░░░░░░░░░░░░░╨░▒▒▀▓▓▓█,▄▄▄m▒▄φ▓▓▓▀"         //
//                       ▀▀▓▓▓▓▓▒▓▒▓██▄░╣░▄▄▄▄▄░░░░░░▄▄█NN▄▒▒▓▌░░░░▄Æ▓▒▀  , ═         //
//                      ^═w▄▀"*╧w░░░▀█░░#░▒╣▒▒▒▒▓░░░█▒╝░▄░░╫▒▒▓██▓▓▒▒█═"-             //
//                  ., ,,,     `"*▀░░▓░░╜▓▀███▓░▓░░▐▒░▓███▐░░░╣▐████▄▄═══*ⁿ ""        //
//                   ,▄▄▄▄▄▄▄█▓▀▀▀███▒░░░░░▒░░░░╬░░▓▒░░░░▄▄g░░╠▓▌▄▄▄▄▄▄▄▄▄▓▓▄▄▄▄▄▄    //
//                ▀▀▀▀▀▀▀▓▓▓▓░░░░░░▀▀▒░░╣▒▒▓▓░░░▐░░▐░░░░╣▒╣▒▓░▒▓█▓▓▄▄▓▓▓▀▀▀▀` ,       //
//                   "ⁿ ⁿⁿ****╜▀▀▀█▓▓▌░░▓▒▒▓▓░░░░░f░░░░░▓▒▒▓▓░▒▓░▀▄⌐,,                //
//                           ,.▄▓▒▒▓██░░░░░░░░░░▄╦╫@▄░░░░░░░░▒▒█▄▄░░░M╤≡▄▄`" ═¬       //
//                    , ═*"   Æ▓▓░░░░░░▄░░░░░░░░▓▓▓▓▀░░░░░░▒▒▓▀█▓▒▒▒▒▒▀▓▓@▄8          //
//                      ▄╦@▓▓▓▀░▄▀` ▄▄███▄░░░░░░░░░░░░░░░░▒▄█▄░░▀▌▄ ▀═w   ╙▓▓▄,       //
//                    ▄█▀▀**╨╧▀▄═"  ▄▀▓▓▀░▐█▄░░░░░░░░░░░▓M██▓█▓▄░░N-*,   "═.,▀▀▀▀▀    //
//                    ▀  ,  "    ,¢█▒▓░░▄██▓▀░▐███▌░░███░░█▀▀▀▓▒▒▓░░▄ "w              //
//                            ,∞ ▄▌▓░░▀▌█▒▒░░▄ █▓▓▌░░██▓▓▄░▄╙. ▀█▓▒▓▄▀,  ⁿ⌐           //
//                          ⌐   █▌░P▀Æ' █▓▌░█▌ █▒▒▌░▐║ ▀▒▓▓░▀▄,  "▄▀▀█▄▄              //
//                            ▄█▌▀,*  ╓▀█▒▌▐▐  ▌▌▒▌░▌║  ▄╙▓▓▓░▌╗   "  "▀█▄            //
//                          ,█▀ ,    ƒ ▄▓▀▄` ░ ▌▐▓▌▐ ▌  ╘  █▒░▌      "                //
//                                 ,` ▓▓╝' ▐   ▌"█▌█ ▌   ╚ ▐▓░▌  *                    //
//                                   ▐█`   ` ░ L █▌▌ ▌    L ▀▓▌                       //
//                                    █        ` ▐█          '▀█w                     //
//                                           ░    ▀                                   //
//                                                                                    //
//                                           ░                                        //
//                                                                                    //
//                                  JULIE-MAE-------SUNCHILD                          //
//                                                                                    //
//                                                                                    //
////////////////////////////////////////////////////////////////////////////////////////


contract JM95 is ERC721Creator {
    constructor() ERC721Creator("Julie-Mae", "JM95") {}
}