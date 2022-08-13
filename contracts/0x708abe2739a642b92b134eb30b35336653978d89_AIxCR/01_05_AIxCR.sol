// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

/// @title: Crowned x AI
/// @author: manifold.xyz

import "./ERC721Creator.sol";

////////////////////////////////////////////////////////////////////////////////////////////
//                                                                                        //
//                                                                                        //
//                                                                                        //
//             _                    _     _      _               _             _          //
//            / /\                 /\ \ /_/\    /\ \           /\ \           /\ \        //
//           / /  \                \ \ \\ \ \   \ \_\         /  \ \         /  \ \       //
//          / / /\ \               /\ \_\\ \ \__/ / /        / /\ \ \       / /\ \ \      //
//         / / /\ \ \             / /\/_/ \ \__ \/_/        / / /\ \ \     / / /\ \_\     //
//        / / /  \ \ \           / / /     \/_/\__/\       / / /  \ \_\   / / /_/ / /     //
//       / / /___/ /\ \         / / /       _/\/__\ \     / / /    \/_/  / / /__\/ /      //
//      / / /_____/ /\ \       / / /       / _/_/\ \ \   / / /          / / /_____/       //
//     / /_________/\ \ \  ___/ / /__     / / /   \ \ \ / / /________  / / /\ \ \         //
//    / / /_       __\ \_\/\__\/_/___\   / / /    /_/ // / /_________\/ / /  \ \ \        //
//    \_\___\     /____/_/\/_________/   \/_/     \_\/ \/____________/\/_/    \_\/        //
//                                                                                        //
//                                                                                        //
//                                                                                        //
//                                                                                        //
////////////////////////////////////////////////////////////////////////////////////////////


contract AIxCR is ERC721Creator {
    constructor() ERC721Creator("Crowned x AI", "AIxCR") {}
}