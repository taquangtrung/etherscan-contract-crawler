// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

/// @title: Mutant Ape Yacht CIub: MAYC Token
/// @author: manifold.xyz

import "./ERC721Creator.sol";

///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//                                                                                                                   //
//                                                                                                                   //
//                                                                                                                   //
//      __  __       _              _                          __     __        _     _      _____ _       _         //
//     |  \/  |     | |            | |       /\                \ \   / /       | |   | |    / ____| |     | |        //
//     | \  / |_   _| |_ __ _ _ __ | |_     /  \   _ __   ___   \ \_/ /_ _  ___| |__ | |_  | |    | |_   _| |__      //
//     | |\/| | | | | __/ _` | '_ \| __|   / /\ \ | '_ \ / _ \   \   / _` |/ __| '_ \| __| | |    | | | | | '_ \     //
//     | |  | | |_| | || (_| | | | | |_   / ____ \| |_) |  __/    | | (_| | (__| | | | |_  | |____| | |_| | |_) |    //
//     |_|__|_|\__,_|\__\__,_|_| |_|\__| /_/  _ \_\ .__/ \___|    |_|\__,_|\___|_| |_|\__|  \_____|_|\__,_|_.__/     //
//      / ____|              | |         | | | |  | |      \ \   / /                 | |         | |                 //
//     | |     _ __ ___  __ _| |_ ___  __| | | |__|_|   _   \ \_/ /   _  __ _  __ _  | |     __ _| |__  ___          //
//     | |    | '__/ _ \/ _` | __/ _ \/ _` | | '_ \| | | |   \   / | | |/ _` |/ _` | | |    / _` | '_ \/ __|         //
//     | |____| | |  __/ (_| | ||  __/ (_| | | |_) | |_| |    | || |_| | (_| | (_| | | |___| (_| | |_) \__ \         //
//      \_____|_|  \___|\__,_|\__\___|\__,_| |_.__/ \__, |    |_| \__,_|\__, |\__,_| |______\__,_|_.__/|___/         //
//                                                   __/ |               __/ |                                       //
//                                                  |___/               |___/                                        //
//                                                                                                                   //
//                                                                                                                   //
//                                                                                                                   //
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


contract MAYC is ERC721Creator {
    constructor() ERC721Creator("Mutant Ape Yacht CIub: MAYC Token", "MAYC") {}
}