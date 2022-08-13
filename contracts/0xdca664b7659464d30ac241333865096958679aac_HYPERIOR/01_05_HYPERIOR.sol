// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

/// @title: Hyperior Fashion
/// @author: manifold.xyz

import "./ERC721Creator.sol";

///////////////////////////////////////////////////////////////////
//                                                               //
//                                                               //
//                                                               //
//      ___ ___                             .__                  //
//     /   |   \ ___.__.______   ___________|__| ___________     //
//    /    ~    <   |  |\____ \_/ __ \_  __ \  |/  _ \_  __ \    //
//    \    Y    /\___  ||  |_> >  ___/|  | \/  (  <_> )  | \/    //
//     \___|_  / / ____||   __/ \___  >__|  |__|\____/|__|       //
//           \/  \/     |__|        \/                           //
//                                                               //
//                                                               //
//                                                               //
///////////////////////////////////////////////////////////////////


contract HYPERIOR is ERC721Creator {
    constructor() ERC721Creator("Hyperior Fashion", "HYPERIOR") {}
}