// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

/// @title: subvert's on-chain keepsakes
/// @author: manifold.xyz

import "./ERC721Creator.sol";

////////////////////////////////////////////////////////////////////////////////////////////////////////////
//                                                                                                        //
//                                                                                                        //
//                                                                                                        //
//                      _____                    _____                    _____                           //
//                     /\    \                  /\    \                  /\    \                          //
//                    /::\    \                /::\____\                /::\    \                         //
//                   /::::\    \              /:::/    /               /::::\    \                        //
//                  /::::::\    \            /:::/    /               /::::::\    \                       //
//                 /:::/\:::\    \          /:::/    /               /:::/\:::\    \                      //
//                /:::/__\:::\    \        /:::/    /               /:::/__\:::\    \                     //
//                \:::\   \:::\    \      /:::/    /               /::::\   \:::\    \                    //
//              ___\:::\   \:::\    \    /:::/    /      _____    /::::::\   \:::\    \                   //
//             /\   \:::\   \:::\    \  /:::/____/      /\    \  /:::/\:::\   \:::\ ___\                  //
//            /::\   \:::\   \:::\____\|:::|    /      /::\____\/:::/__\:::\   \:::|    |                 //
//            \:::\   \:::\   \::/    /|:::|____\     /:::/    /\:::\   \:::\  /:::|____|                 //
//             \:::\   \:::\   \/____/  \:::\    \   /:::/    /  \:::\   \:::\/:::/    /                  //
//              \:::\   \:::\    \       \:::\    \ /:::/    /    \:::\   \::::::/    /                   //
//               \:::\   \:::\____\       \:::\    /:::/    /      \:::\   \::::/    /                    //
//                \:::\  /:::/    /        \:::\__/:::/    /        \:::\  /:::/    /                     //
//                 \:::\/:::/    /          \::::::::/    /          \:::\/:::/    /                      //
//                  \::::::/    /            \::::::/    /            \::::::/    /                       //
//                   \::::/    /              \::::/    /              \::::/    /                        //
//                    \::/    /                \::/____/                \::/____/                         //
//                     \/____/                  ~~                       ~~                               //
//                                                                                                        //
//              _____                    _____                    _____                _____              //
//             /\    \                  /\    \                  /\    \              /\    \             //
//            /::\____\                /::\    \                /::\    \            /::\    \            //
//           /:::/    /               /::::\    \              /::::\    \           \:::\    \           //
//          /:::/    /               /::::::\    \            /::::::\    \           \:::\    \          //
//         /:::/    /               /:::/\:::\    \          /:::/\:::\    \           \:::\    \         //
//        /:::/____/               /:::/__\:::\    \        /:::/__\:::\    \           \:::\    \        //
//        |::|    |               /::::\   \:::\    \      /::::\   \:::\    \          /::::\    \       //
//        |::|    |     _____    /::::::\   \:::\    \    /::::::\   \:::\    \        /::::::\    \      //
//        |::|    |    /\    \  /:::/\:::\   \:::\    \  /:::/\:::\   \:::\____\      /:::/\:::\    \     //
//        |::|    |   /::\____\/:::/__\:::\   \:::\____\/:::/  \:::\   \:::|    |    /:::/  \:::\____\    //
//        |::|    |  /:::/    /\:::\   \:::\   \::/    /\::/   |::::\  /:::|____|   /:::/    \::/    /    //
//        |::|    | /:::/    /  \:::\   \:::\   \/____/  \/____|:::::\/:::/    /   /:::/    / \/____/     //
//        |::|____|/:::/    /    \:::\   \:::\    \            |:::::::::/    /   /:::/    /              //
//        |:::::::::::/    /      \:::\   \:::\____\           |::|\::::/    /   /:::/    /               //
//        \::::::::::/____/        \:::\   \::/    /           |::| \::/____/    \::/    /                //
//         ~~~~~~~~~~               \:::\   \/____/            |::|  ~|           \/____/                 //
//                                   \:::\    \                |::|   |                                   //
//                                    \:::\____\               \::|   |                                   //
//                                     \::/    /                \:|   |                                   //
//                                      \/____/                  \|___|                                   //
//                                                                                                        //
//                                                                                                        //
//                                                                                                        //
//                                                                                                        //
////////////////////////////////////////////////////////////////////////////////////////////////////////////


contract SOCK is ERC721Creator {
    constructor() ERC721Creator("subvert's on-chain keepsakes", "SOCK") {}
}