// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

/// @title: Voyage
/// @author: manifold.xyz

import "./ERC721Creator.sol";

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//                                                                                                                                //
//                                                                                                                                //
//     .----------------.  .----------------.  .----------------.  .----------------.  .----------------.  .----------------.     //
//    | .--------------. || .--------------. || .--------------. || .--------------. || .--------------. || .--------------. |    //
//    | | ____   ____  | || |     ____     | || |  ____  ____  | || |      __      | || |    ______    | || |  _________   | |    //
//    | ||_  _| |_  _| | || |   .'    `.   | || | |_  _||_  _| | || |     /  \     | || |  .' ___  |   | || | |_   ___  |  | |    //
//    | |  \ \   / /   | || |  /  .--.  \  | || |   \ \  / /   | || |    / /\ \    | || | / .'   \_|   | || |   | |_  \_|  | |    //
//    | |   \ \ / /    | || |  | |    | |  | || |    \ \/ /    | || |   / ____ \   | || | | |    ____  | || |   |  _|  _   | |    //
//    | |    \ ' /     | || |  \  `--'  /  | || |    _|  |_    | || | _/ /    \ \_ | || | \ `.___]  _| | || |  _| |___/ |  | |    //
//    | |     \_/      | || |   `.____.'   | || |   |______|   | || ||____|  |____|| || |  `._____.'   | || | |_________|  | |    //
//    | |              | || |              | || |              | || |              | || |              | || |              | |    //
//    | '--------------' || '--------------' || '--------------' || '--------------' || '--------------' || '--------------' |    //
//     '----------------'  '----------------'  '----------------'  '----------------'  '----------------'  '----------------'     //
//                                                                                                                                //
//                                                                                                                                //
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


contract VGE is ERC721Creator {
    constructor() ERC721Creator("Voyage", "VGE") {}
}