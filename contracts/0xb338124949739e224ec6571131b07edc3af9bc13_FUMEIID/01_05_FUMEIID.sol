// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

/// @title: fumei:IDs
/// @author: manifold.xyz

import "./ERC721Creator.sol";

///////////////////////////////////////////////////////////////////////////////////////
//                                                                                   //
//                                                                                   //
//                                                                                   //
//             ___           ___           ___           ___                    │    //
//            /\  \         /\__\         /\__\         /\  \          ___      │    //
//           /::\  \       /:/  /        /::|  |       /::\  \        /\  \     │    //
//          /:/\:\  \     /:/  /        /:|:|  |      /:/\:\  \       \:\  \    │    //
//         /::\~\:\  \   /:/  /  ___   /:/|:|__|__   /::\~\:\  \      /::\__\   │    //
//        /:/\:\ \:\__\ /:/__/  /\__\ /:/ |::::\__\ /:/\:\ \:\__\  __/:/\/__/   │    //
//        \/__\:\ \/__/ \:\  \ /:/  / \/__/~~/:/  / \:\~\:\ \/__/ /\/:/  /      │    //
//             \:\__\    \:\  /:/  /        /:/  /   \:\ \:\__\   \::/__/       │    //
//              \/__/     \:\/:/  /        /:/  /     \:\ \/__/    \:\__\       │    //
//                         \::/  /        /:/  /       \:\__\       \/__/       │    //
//                          \/__/         \/__/         \/__/                   │    //
//                                       ___           ___                      │    //
//                           ___        /\  \         /\  \                     │    //
//                          /\  \      /::\  \       /::\  \                    │    //
//                          \:\  \    /:/\:\  \     /:/\ \  \                   │    //
//                          /::\__\  /:/  \:\__\   _\:\~\ \  \                  │    //
//                       __/:/\/__/ /:/__/ \:|__| /\ \:\ \ \__\                 │    //
//                      /\/:/  /    \:\  \ /:/  / \:\ \:\ \/__/                 │    //
//                      \::/__/      \:\  /:/  /   \:\ \:\__\                   │    //
//                       \:\__\       \:\/:/  /     \:\/:/  /                   │    //
//                        \/__/        \::/__/       \::/  /                    │    //
//                                      ~~            \/__/                          //
//                                                                                   //
//                                                                                   //
///////////////////////////////////////////////////////////////////////////////////////


contract FUMEIID is ERC721Creator {
    constructor() ERC721Creator("fumei:IDs", "FUMEIID") {}
}