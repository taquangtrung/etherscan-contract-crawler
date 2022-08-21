// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

/// @title: Pepe Tarot
/// @author: manifold.xyz

import "./ERC721Creator.sol";

////////////////////////////////////////////////////////////////////////////////////////////
//                                                                                        //
//                                                                                        //
//                                                                                        //
//        ▀██▄   ████████     ██               ███   ▄███████▄    ██▄                     //
//          █████     █████    ████████████     ██████     █████    ████████████          //
//           ███        ████    ████             ████        ████   ████                  //
//           ███        ▐███    ████             ████        ████    ███                  //
//           ███        ████    ████     ▄██     ████        ████    ████     ▄█▄         //
//           ███       ████     ██████▀▀▀▀█▀     ████       ███      ██████▀▀▀▀█▀         //
//           ████▄  ████▀       ████             █████  ▄████        ███                  //
//           ████▀▀             ████             ██████              ███                  //
//           ███                ████             ████                ███                  //
//           ███                 ██████████      ▐███                ███████████          //
//           ██                   ████▀▀         ██▀                   ▀████              //
//                                                                                        //
//                                                                                        //
//         ██████████▌    ███████     ██████▀████         ███████      ███████████        //
//             ███          █████      ▓██      ███     ███     ███        ███            //
//             ██▌        ▄█   ███      ██      ███    ██▀        ███      ███            //
//             ██▌        ██    ███     ██      ██    ███         ████     ███            //
//             ██        ██     ███     ██  ▄███▀     ███         ███      ███            //
//             ██       ████████████    ██    ████     ███       ███       ███            //
//             ██       ██   ▀    ███   ██     ▀██       ███▄  ███         ███            //
//             █       ██         █              ███          ▀            ██▀            //
//                                                                                        //
//                                                                                        //
//                                                                                        //
////////////////////////////////////////////////////////////////////////////////////////////


contract Tarot is ERC721Creator {
    constructor() ERC721Creator("Pepe Tarot", "Tarot") {}
}