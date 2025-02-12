// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

/// @title: The Experiment
/// @author: manifold.xyz

import "./ERC721Creator.sol";

///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//                                                                                                                                                   //
//                                                                                                                                                   //
//     ______   __  __     ______        ______     __  __     ______   ______     ______     __     __    __     ______     __   __     ______      //
//    /\__  _\ /\ \_\ \   /\  ___\      /\  ___\   /\_\_\_\   /\  == \ /\  ___\   /\  == \   /\ \   /\ "-./  \   /\  ___\   /\ "-.\ \   /\__  _\     //
//    \/_/\ \/ \ \  __ \  \ \  __\      \ \  __\   \/_/\_\/_  \ \  _-/ \ \  __\   \ \  __<   \ \ \  \ \ \-./\ \  \ \  __\   \ \ \-.  \  \/_/\ \/     //
//       \ \_\  \ \_\ \_\  \ \_____\     \ \_____\   /\_\/\_\  \ \_\    \ \_____\  \ \_\ \_\  \ \_\  \ \_\ \ \_\  \ \_____\  \ \_\\"\_\    \ \_\     //
//        \/_/   \/_/\/_/   \/_____/      \/_____/   \/_/\/_/   \/_/     \/_____/   \/_/ /_/   \/_/   \/_/  \/_/   \/_____/   \/_/ \/_/     \/_/     //
//                                                                                                                                                   //
//                                                                                                                                                   //
//                                                                                                                                                   //
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


contract EXP is ERC721Creator {
    constructor() ERC721Creator("The Experiment", "EXP") {}
}