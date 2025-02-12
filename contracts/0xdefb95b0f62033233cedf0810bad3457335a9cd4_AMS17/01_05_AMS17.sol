// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

/// @title: Seventeen Hours In Amsterdam
/// @author: manifold.xyz

import "./ERC721Creator.sol";

/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//                                                                                                                                                                                                                         //
//                                                                                                                                                                                                                         //
//                                                                                                                                                                                                                         //
//          ___         ___        ___         ___         ___      ___         ___         ___         ___                                                                                                                //
//         /\  \       /\  \      /\__\       /\  \       /\__\    /\  \       /\  \       /\  \       /\__\                                                                                                               //
//        /::\  \     /::\  \    /:/  /      /::\  \     /::|  |   \:\  \     /::\  \     /::\  \     /::|  |                                                                                                              //
//       /:/\ \  \   /:/\:\  \  /:/  /      /:/\:\  \   /:|:|  |    \:\  \   /:/\:\  \   /:/\:\  \   /:|:|  |                                                                                                              //
//      _\:\~\ \  \ /::\~\:\  \/:/__/  ___ /::\~\:\  \ /:/|:|  |__  /::\  \ /::\~\:\  \ /::\~\:\  \ /:/|:|  |__                                                                                                            //
//     /\ \:\ \ \__/:/\:\ \:\__|:|  | /\__/:/\:\ \:\__/:/ |:| /\__\/:/\:\__/:/\:\ \:\__/:/\:\ \:\__/:/ |:| /\__\                                                                                                           //
//     \:\ \:\ \/__\:\~\:\ \/__|:|  |/:/  \:\~\:\ \/__\/__|:|/:/  /:/  \/__\:\~\:\ \/__\:\~\:\ \/__\/__|:|/:/  /                                                                                                           //
//      \:\ \:\__\  \:\ \:\__\ |:|__/:/  / \:\ \:\__\     |:/:/  /:/  /     \:\ \:\__\  \:\ \:\__\     |:/:/  /                                                                                                            //
//       \:\/:/  /   \:\ \/__/  \::::/__/   \:\ \/__/     |::/  /\/__/       \:\ \/__/   \:\ \/__/     |::/  /                                                                                                             //
//        \::/  /     \:\__\     ~~~~        \:\__\       /:/  /              \:\__\      \:\__\       /:/  /                                                                                                              //
//         \/__/       \/__/                  \/__/       \/__/                \/__/       \/__/       \/__/                                                                                                               //
//                                                                                                                                                                                                                         //
//                                                                                                                                                                                                                         //
//                                                                                                                                                                                                                         //
//                                                                                                                                                                                                                         //
//                                                                                                                                                                                                                         //
//                                                                                                                                                                                                                         //
//                                                                                                                                                                                                                         //
//                                                                                                                                                                                                                         //
//                                                                                                                                                                                                                         //
//                                                                                                                                                                                                                         //
//                                                                                                                                                                                                                         //
//          ___         ___         ___         ___         ___                             ___                   ___         ___         ___      ___         ___         ___         ___         ___         ___         //
//         /\__\       /\  \       /\__\       /\  \       /\  \                  ___      /\__\                 /\  \       /\__\       /\  \    /\  \       /\  \       /\  \       /\  \       /\  \       /\__\        //
//        /:/  /      /::\  \     /:/  /      /::\  \     /::\  \                /\  \    /::|  |               /::\  \     /::|  |     /::\  \   \:\  \     /::\  \     /::\  \     /::\  \     /::\  \     /::|  |       //
//       /:/__/      /:/\:\  \   /:/  /      /:/\:\  \   /:/\ \  \               \:\  \  /:|:|  |              /:/\:\  \   /:|:|  |    /:/\ \  \   \:\  \   /:/\:\  \   /:/\:\  \   /:/\:\  \   /:/\:\  \   /:|:|  |       //
//      /::\  \ ___ /:/  \:\  \ /:/  /  ___ /::\~\:\  \ _\:\~\ \  \              /::\__\/:/|:|  |__           /::\~\:\  \ /:/|:|__|__ _\:\~\ \  \  /::\  \ /::\~\:\  \ /::\~\:\  \ /:/  \:\__\ /::\~\:\  \ /:/|:|__|__     //
//     /:/\:\  /\__/:/__/ \:\__/:/__/  /\__/:/\:\ \:\__/\ \:\ \ \__\          __/:/\/__/:/ |:| /\__\         /:/\:\ \:\__/:/ |::::\__/\ \:\ \ \__\/:/\:\__/:/\:\ \:\__/:/\:\ \:\__/:/__/ \:|__/:/\:\ \:\__/:/ |::::\__\    //
//     \/__\:\/:/  \:\  \ /:/  \:\  \ /:/  \/_|::\/:/  \:\ \:\ \/__/         /\/:/  /  \/__|:|/:/  /         \/__\:\/:/  \/__/~~/:/  \:\ \:\ \/__/:/  \/__\:\~\:\ \/__\/_|::\/:/  \:\  \ /:/  \/__\:\/:/  \/__/~~/:/  /    //
//          \::/  / \:\  /:/  / \:\  /:/  /   |:|::/  / \:\ \:\__\           \::/__/       |:/:/  /               \::/  /      /:/  / \:\ \:\__\/:/  /     \:\ \:\__\    |:|::/  / \:\  /:/  /     \::/  /      /:/  /     //
//          /:/  /   \:\/:/  /   \:\/:/  /    |:|\/__/   \:\/:/  /            \:\__\       |::/  /                /:/  /      /:/  /   \:\/:/  /\/__/       \:\ \/__/    |:|\/__/   \:\/:/  /      /:/  /      /:/  /      //
//         /:/  /     \::/  /     \::/  /     |:|  |      \::/  /              \/__/       /:/  /                /:/  /      /:/  /     \::/  /              \:\__\      |:|  |      \::/__/      /:/  /      /:/  /       //
//         \/__/       \/__/       \/__/       \|__|       \/__/                           \/__/                 \/__/       \/__/       \/__/                \/__/       \|__|       ~~          \/__/       \/__/        //
//                                                                                                                                                                                                                         //
//                                                                                                                                                                                                                         //
//                                                                                                                                                                                                                         //
//                                                                                                                                                                                                                         //
//                                                                                                                                                                                                                         //
//                                                                                                                                                                                                                         //
//                                                                                                                                                                                                                         //
//                                                                                                                                                                                                                         //
//                                                                                                                                                                                                                         //
//                                                                                                                                                                                                                         //
//                                                                                                                                                                                                                         //
//          ___      ___                   ___         ___         ___         ___         ___                   ___         ___                                                                                           //
//         /\  \    |\__\                 /\  \       /\  \       /\  \       /\__\       /\  \        ___      /\__\       /\  \                                                                                          //
//        /::\  \   |:|  |               /::\  \     /::\  \     /::\  \     /::|  |     /::\  \      /\  \    /::|  |     /::\  \                                                                                         //
//       /:/\:\  \  |:|  |              /:/\:\  \   /:/\:\  \   /:/\:\  \   /:|:|  |    /:/\:\  \     \:\  \  /:|:|  |    /:/\:\  \                                                                                        //
//      /::\~\:\__\ |:|__|__           /:/  \:\__\ /::\~\:\  \ /::\~\:\  \ /:/|:|__|__ /::\~\:\  \    /::\__\/:/|:|  |__ /::\~\:\  \                                                                                       //
//     /:/\:\ \:|__|/::::\__\         /:/__/ \:|__/:/\:\ \:\__/:/\:\ \:\__/:/ |::::\__/:/\:\ \:\__\__/:/\/__/:/ |:| /\__/:/\:\ \:\__\                                                                                      //
//     \:\~\:\/:/  /:/~~/~            \:\  \ /:/  \/__\:\/:/  \:\~\:\ \/__\/__/~~/:/  \/__\:\/:/  /\/:/  /  \/__|:|/:/  \:\~\:\ \/__/                                                                                      //
//      \:\ \::/  /:/  /               \:\  /:/  /     \::/  / \:\ \:\__\       /:/  /     \::/  /\::/__/       |:/:/  / \:\ \:\__\                                                                                        //
//       \:\/:/  /\/__/                 \:\/:/  /      /:/  /   \:\ \/__/      /:/  /      /:/  /  \:\__\       |::/  /   \:\ \/__/                                                                                        //
//        \::/__/                        \::/__/      /:/  /     \:\__\       /:/  /      /:/  /    \/__/       /:/  /     \:\__\                                                                                          //
//         ~~                             ~~          \/__/       \/__/       \/__/       \/__/                 \/__/       \/__/                                                                                          //
//                                                                                                                                                                                                                         //
//                                                                                                                                                                                                                         //
//                                                                                                                                                                                                                         //
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


contract AMS17 is ERC721Creator {
    constructor() ERC721Creator("Seventeen Hours In Amsterdam", "AMS17") {}
}