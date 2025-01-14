// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

/// @title: 8xx8
/// @author: manifold.xyz

import "./ERC721Creator.sol";

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//                                                                                                                                      //
//                                                                                                                                      //
//                                                                                                                                      //
//                                                                                                                                      //
//                                                                                                                                      //
//                                                                                                                                      //
//                                                                                                                                      //
//                                                                                                                                      //
//                                                                                                                                      //
//                                                                                                                                      //
//                                                                                                                                      //
//                                                                                                                                      //
//                                                                                                                                      //
//                                                                                                                                      //
//                                                                                                                                      //
//                     ╔╗╗╗╗╗╗╗╗╗╗╗╗╗╗╗╗╗    ▄▓█▓▄                          ▄▓██▓▄                                                      //
//                     █````````````````█  ██▀▀╙▀▀██   ██⌐ ╫██ ]██ ╡ ╫█⌐  ▓██▀╙╙▀██▌                                                    //
//                     █                ╫ ██       ██  ╙█▌ Γ█└ ▐╟█µ▌ █⌐⌐ ╟█        █▌                                                   //
//                     █                ╫▐█▌       ██   ╟█ ▐▌  ▐ ██▌▓█ ⌐ ██        █▌                                                   //
//              ▄█████▄██▌-██φ███φ███   ╫ ██▄     ▄██    █▌█   ▐ ╟███⌐ ⌐ ███      ██                                                    //
//             ▐█▌   ███▀  ██  ██  ██   ╫  █████████     ██▌   ▐  ███  ⌐  █████████▀                                                    //
//             ██     ██   ██  ██  ██   ╫   ▀█████▀      "█▌   ▐  ╟⌡Γ  ⌐    █████▌                                                      //
//             ███   ███   ██  ██  ██   ╫  ▓████████     ]██   ▐  ▓▓█  ⌐  ▄████████▄                                                    //
//              █████▀ █   ██  ██  ██   ╫▄██▀     ▀██▄   █╝█µ  ▐  ███⌐ ⌐ ██▀      ███                                                   //
//             █▌      █                ╫██         ██   █ ██  ▐ ╫█▓██ ⌐▓█▌        ██▌                                                  //
//             █████████                ╫██         ██  ╫⌐ ╟█  ▐ █▌▌██ ⌐██▌        ██▌                                                  //
//             ▓█▀▀╙╙▀██▌▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄████       ███ ,█   ██⌐▐▐█ ▌▐██⌐███▄      ▄██                                                   //
//            ▐█▌      █▀╙╙╙╙╙╙╙╙╙╙╙╙╙╙╙╙ █████▓█████  ██▌  ╟█⌐▐█▌ Γ ██⌐ ███████████Γ                                                   //
//             ▀███████                    ▀███████▀                       ▀██████▀                                                     //
//                                                                                                                                      //
//                                                                                                                                      //
//                                                                                                                                      //
//                                                                                                                                      //
//                                                                                                                                      //
//                                                                  █████████╠                                                          //
//                                           ╠╬██████████████▀▀▀▀▀▀▀╙╙└└└└└└└╙▀███╠                                                     //
//                                ║████▀▀▀▀▀▀▀╙╙╙└└─'   ,,▄▄▄▄▄▄▄███▀▀▀▀▀▀▀▀▌▐██▄╙▀███╠                                                 //
//                                ║▌▄▄▄▄▄▄φÆ█▀▀▀▀▀▀▀╙╙╙╙└└ ▄▄▄▄▄▄▄▄ gm8xx8 ▌█▐██████▄╙▀███                                              //
//                                ╟▌█ 8xx8xx8xx8xx8xx8xx8xx8xx8xx8xx8xx8xx8▌█▐██████████▄█                                              //
//                                ╟▌█gmgmgmgmgmgmgmgmgmgmgmgmgmgmgmgmgmgmgm▌█▐████████████                                              //
//                                ╟▌█ 8xx8xx8xx8xx8xx8xx8xx8xx8xx8xx8xx8xx8▌█▐████████████                                              //
//                                ╟▌█gmgmgmgmgmgmgmgmgmgmgmgmgmgmgmgmgmgmgm▌█▐████████████                                              //
//                                ╫▌█ 8xx8xx8xx8xx8xx8xx8xx8xx8xx8xx8xx8xx8▌█▐████████████                                              //
//                                ▓▌█gmgmgmgmgmgmgmgmgmgmgmgmgmgmgmgmgmgmgm▌█▐████████████                                              //
//                                █▌█ 8xx8xx8xx8xx8xx8xx8xx8xx8xx8xx8xx8xx8▌█▐████████████                                              //
//                                █▌█gmgmgmgmgmgmgmgmgmgmgmgmgmgmgmgmgmgmgm▌█▐████████████                                              //
//                                █▌█ 8xx8xx8xx8xx8xx8xx8xx8xx8xx8xx8xx8xx8▌█▐████████████                                              //
//                                █▌▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀╙╙╙╙╙╙╙╙└╙╙╙╙╙ ╙▀▀██████████                                              //
//                                ██████████████████████████████████████████████▄▄▄▄│╙▀▀▀█                                              //
//                                ██╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╠╢╢╢╢╢╣╣╣╣╣╣╣▒▒▒▒▒██╠╠╠╠╠╠███████                                              //
//                                ██▒▒▒▒▒▒▒▒▒╢███████████████████▒▒▒▒▒▒▒▒▒▒██▒▒▒▒╣╣╣╣╣╣▒╣█                                              //
//                                ██▒▒▒▒▒▒▒▒▒╢█ φφφφφO╟▌ #####φ╟█▒▒▒▒▒▒▒▒▒▒██▒▒▒▒█░╬╬╬╬╫▒█                                              //
//                                ██▒▒▒▒▒▒▒▒▒╢█ ╬╬╬╬╬░╟▌ ╬╬╬╬╬╠╟█▒▒▒▒▒▒▒▒▒▒██▒▒▒▒█▒╬╬╬╬╫▒█                                              //
//                                ██▒▒▒▒▒▒▒▒▒╢█ ╬╬╬╬╬░╟▌ ╬╬╬╬╬╠╟█▒▒▒▒▒▒▒▒▒▒██▒▒▒▒█▒╬╬╬╬╫▒█                                              //
//                                ██▒▒▒▒▒▒▒▒▒╢█ ╬╬╬╬╬░╟▌ ╬╬╬╬╬╠╟█▒▒▒▒▒▒▒▒▒▒██▒▒▒▒█▒╬╬╬╬╫▒█                                              //
//                                ██▒▒▒▒▒▒▒▒▒╢█ ╬╬╬╬╬░╟▌ ╬╬╬╬╬╠╟█▒▒▒▒▒▒▒▒▒▒██▒▒▒▒█▒╬╬╬╬╫▒█                                              //
//                                ██▒▒▒▒▒▒▒▒▒╢█ ╬╬╬╬╬░╟▌ ╬╬╬╬╬╠╟█▒▒▒▒▒▒▒▒▒▒██▒▒▒▒█▒╬╬╬╬╫▒█                                              //
//                                ██▒▒▒▒▒▒▒▒▒╢█ ╝╝╝╝╝⌐╟▌ ╝╝╝╝╝╩╟█▒▒▒▒▒▒▒▒▒▒██▒▒▒▒█▒╬╬╬╬╫▒█                                              //
//                               ╣██▒▒▒▒▒╣▒▒▒║███████████████████▒▒▒▒▒▒▒▒╣▒██▒▒▒▒███████▒█                                              //
//                               ╣██╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬██╬╣███████████                                              //
//                               ╢████████████████████████████████████████████████████████                                              //
//                               ╙▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀                                              //
//                                 gm8xx8gm8xx8gm8xx8gm8xx8gm8xx8gm8xx8gm8xx8gm8xx8gm8xx8                                               //
//                                                                                                                                      //
//                                                                                                                                      //
//                                                                                                                                      //
//                                                                                                                                      //
//                                                                                                                                      //
//                                                                                                                                      //
//                                                                                                                                      //
//                                                                                                                                      //
//                                                                                                                                      //
//                                                                                                                                      //
//                                                                                                                                      //
//                                                                                                                                      //
//                                                                                                                                      //
//                                                                                                                                      //
//                                                                                                                                      //
//                                                                                                                                      //
//                                                                                                                                      //
//                                                                                                                                      //
//                                                                                                                                      //
//                                                                                                                                      //
//                                                                                                                                      //
//                                                                                                                                      //
//                                                                                                                                      //
//                                                                                                                                      //
//                                                                                                                                      //
//                                                                                                                                      //
//                                                                                                                                      //
//                                                                                                                                      //
//                                                                                                                                      //
//                                                                                                                                      //
//                                                                                                                                      //
//                                                                                                                                      //
//                                                                                                                                      //
//                                                                                                                                      //
//                                                                                                                                      //
//                                                                                                                                      //
//                                                                                                                                      //
//                                                                                                                                      //
//                                                                                                                                      //
//                                                                                                                                      //
//                                                                                                                                      //
//                                                                                                                                      //
//                                                                                                                                      //
//                                                                                                                                      //
//                                                                                                                                      //
//                                                                                                                                      //
//                                                                                                                                      //
//                                                                                                                                      //
//                                                                                                                                      //
//                                                                                                                                      //
//                                                                                                                                      //
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


contract gm8xx8 is ERC721Creator {
    constructor() ERC721Creator("8xx8", "gm8xx8") {}
}