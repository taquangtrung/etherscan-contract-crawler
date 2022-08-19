// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

/// @title: KFC BuckETH
/// @author: manifold.xyz

import "./ERC721Creator.sol";

///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//                                                                                                                                                                                                                                                                                                                                                                                                                           //
//                                                                                                                                                                                                                                                                                                                                                                                                                           //
//                                                                                                                                                                                                                                                                                                                                                                                                                           //
//              _____                    _____            _____                    _____                    _____                            _____                    _____                    _____                    _____                _____                    _____                    _____                                                    _____                    _____                    _____              //
//             /\    \                  /\    \          /\    \                  /\    \                  /\    \                          /\    \                  /\    \                  /\    \                  /\    \              /\    \                  /\    \                  /\    \                 ______                           /\    \                  /\    \                  /\    \             //
//            /::\    \                /::\____\        /::\    \                /::\____\                /::\____\                        /::\    \                /::\    \                /::\    \                /::\    \            /::\    \                /::\    \                /::\____\               |::|   |                         /::\____\                /::\    \                /::\    \            //
//           /::::\    \              /:::/    /        \:::\    \              /::::|   |               /:::/    /                       /::::\    \               \:::\    \              /::::\    \               \:::\    \           \:::\    \              /::::\    \              /:::/    /               |::|   |                        /:::/    /               /::::\    \              /::::\    \           //
//          /::::::\    \            /:::/    /          \:::\    \            /:::::|   |              /:::/    /                       /::::::\    \               \:::\    \            /::::::\    \               \:::\    \           \:::\    \            /::::::\    \            /:::/    /                |::|   |                       /:::/    /               /::::::\    \            /::::::\    \          //
//         /:::/\:::\    \          /:::/    /            \:::\    \          /::::::|   |             /:::/    /                       /:::/\:::\    \               \:::\    \          /:::/\:::\    \               \:::\    \           \:::\    \          /:::/\:::\    \          /:::/    /                 |::|   |                      /:::/    /               /:::/\:::\    \          /:::/\:::\    \         //
//        /:::/__\:::\    \        /:::/    /              \:::\    \        /:::/|::|   |            /:::/____/                       /:::/  \:::\    \               \:::\    \        /:::/  \:::\    \               \:::\    \           \:::\    \        /:::/__\:::\    \        /:::/    /                  |::|   |                     /:::/____/               /:::/__\:::\    \        /:::/  \:::\    \        //
//       /::::\   \:::\    \      /:::/    /               /::::\    \      /:::/ |::|   |           /::::\    \                      /:::/    \:::\    \              /::::\    \      /:::/    \:::\    \              /::::\    \          /::::\    \      /::::\   \:::\    \      /:::/    /                   |::|   |                    /::::\    \              /::::\   \:::\    \      /:::/    \:::\    \       //
//      /::::::\   \:::\    \    /:::/    /       ____    /::::::\    \    /:::/  |::|   | _____    /::::::\____\________            /:::/    / \:::\    \    ____    /::::::\    \    /:::/    / \:::\    \    ____    /::::::\    \        /::::::\    \    /::::::\   \:::\    \    /:::/    /                    |::|   |                   /::::::\____\________    /::::::\   \:::\    \    /:::/    / \:::\    \      //
//     /:::/\:::\   \:::\ ___\  /:::/    /       /\   \  /:::/\:::\    \  /:::/   |::|   |/\    \  /:::/\:::::::::::\    \          /:::/    /   \:::\ ___\  /\   \  /:::/\:::\    \  /:::/    /   \:::\ ___\  /\   \  /:::/\:::\    \      /:::/\:::\    \  /:::/\:::\   \:::\    \  /:::/    /               ______|::|___|___ ____          /:::/\:::::::::::\    \  /:::/\:::\   \:::\    \  /:::/    /   \:::\    \     //
//    /:::/__\:::\   \:::|    |/:::/____/       /::\   \/:::/  \:::\____\/:: /    |::|   /::\____\/:::/  |:::::::::::\____\        /:::/____/     \:::|    |/::\   \/:::/  \:::\____\/:::/____/  ___\:::|    |/::\   \/:::/  \:::\____\    /:::/  \:::\____\/:::/  \:::\   \:::\____\/:::/____/               |:::::::::::::::::|    |        /:::/  |:::::::::::\____\/:::/  \:::\   \:::\____\/:::/____/     \:::\____\    //
//    \:::\   \:::\  /:::|____|\:::\    \       \:::\  /:::/    \::/    /\::/    /|::|  /:::/    /\::/   |::|~~~|~~~~~             \:::\    \     /:::|____|\:::\  /:::/    \::/    /\:::\    \ /\  /:::|____|\:::\  /:::/    \::/    /   /:::/    \::/    /\::/    \:::\  /:::/    /\:::\    \               |:::::::::::::::::|____|        \::/   |::|~~~|~~~~~     \::/    \:::\   \::/    /\:::\    \      \::/    /    //
//     \:::\   \:::\/:::/    /  \:::\    \       \:::\/:::/    / \/____/  \/____/ |::| /:::/    /  \/____|::|   |                   \:::\    \   /:::/    /  \:::\/:::/    / \/____/  \:::\    /::\ \::/    /  \:::\/:::/    / \/____/   /:::/    / \/____/  \/____/ \:::\/:::/    /  \:::\    \               ~~~~~~|::|~~~|~~~               \/____|::|   |           \/____/ \:::\   \/____/  \:::\    \      \/____/     //
//      \:::\   \::::::/    /    \:::\    \       \::::::/    /                   |::|/:::/    /         |::|   |                    \:::\    \ /:::/    /    \::::::/    /            \:::\   \:::\ \/____/    \::::::/    /           /:::/    /                    \::::::/    /    \:::\    \                    |::|   |                        |::|   |                    \:::\    \       \:::\    \                 //
//       \:::\   \::::/    /      \:::\    \       \::::/____/                    |::::::/    /          |::|   |                     \:::\    /:::/    /      \::::/____/              \:::\   \:::\____\       \::::/____/           /:::/    /                      \::::/    /      \:::\    \                   |::|   |                        |::|   |                     \:::\____\       \:::\    \                //
//        \:::\  /:::/    /        \:::\    \       \:::\    \                    |:::::/    /           |::|   |                      \:::\  /:::/    /        \:::\    \               \:::\  /:::/    /        \:::\    \           \::/    /                       /:::/    /        \:::\    \                  |::|   |                        |::|   |                      \::/    /        \:::\    \               //
//         \:::\/:::/    /          \:::\    \       \:::\    \                   |::::/    /            |::|   |                       \:::\/:::/    /          \:::\    \               \:::\/:::/    /          \:::\    \           \/____/                       /:::/    /          \:::\    \                 |::|   |                        |::|   |                       \/____/          \:::\    \              //
//          \::::::/    /            \:::\    \       \:::\    \                  /:::/    /             |::|   |                        \::::::/    /            \:::\    \               \::::::/    /            \:::\    \                                       /:::/    /            \:::\    \                |::|   |                        |::|   |                                         \:::\    \             //
//           \::::/    /              \:::\____\       \:::\____\                /:::/    /              \::|   |                         \::::/    /              \:::\____\               \::::/    /              \:::\____\                                     /:::/    /              \:::\____\               |::|   |                        \::|   |                                          \:::\____\            //
//            \::/____/                \::/    /        \::/    /                \::/    /                \:|   |                          \::/____/                \::/    /                \::/____/                \::/    /                                     \::/    /                \::/    /               |::|___|                         \:|   |                                           \::/    /            //
//             ~~                       \/____/          \/____/                  \/____/                  \|___|                           ~~                       \/____/                                           \/____/                                       \/____/                  \/____/                 ~~                               \|___|                                            \/____/             //
//                                                                                                                                                                                                                                                                                                                                                                                                                           //
//                                                                                                                                                                                                                                                                                                                                                                                                                           //
//                                                                                                                                                                                                                                                                                                                                                                                                                           //
//                                                                                                                                                                                                                                                                                                                                                                                                                           //
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


contract KFCBETH is ERC721Creator {
    constructor() ERC721Creator("KFC BuckETH", "KFCBETH") {}
}