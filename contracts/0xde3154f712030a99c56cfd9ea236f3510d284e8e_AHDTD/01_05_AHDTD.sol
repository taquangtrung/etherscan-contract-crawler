// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

/// @title: At Home During The DAY
/// @author: manifold.xyz

import "./ERC721Creator.sol";

/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//                                                                                                                         //
//                                                                                                                         //
//                                                                                                                         //
//                                                                                                                         //
//                                                                                                                         //
//       _   _                                     ___            _               _____ _               ___                //
//      /_\ | |_    /\  /\___  _ __ ___   ___     /   \_   _ _ __(_)_ __   __ _  /__   \ |__   ___     /   \__ _ _   _     //
//     //_\\| __|  / /_/ / _ \| '_ ` _ \ / _ \   / /\ / | | | '__| | '_ \ / _` |   / /\/ '_ \ / _ \   / /\ / _` | | | |    //
//    /  _  \ |_  / __  / (_) | | | | | |  __/  / /_//| |_| | |  | | | | | (_| |  / /  | | | |  __/  / /_// (_| | |_| |    //
//    \_/ \_/\__| \/ /_/ \___/|_| |_| |_|\___| /___,'  \__,_|_|  |_|_| |_|\__, |  \/   |_| |_|\___| /___,' \__,_|\__, |    //
//                                                                        |___/                                  |___/     //
//                                                                                                                         //
//                                                                                                                         //
//                                                                                                                         //
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


contract AHDTD is ERC721Creator {
    constructor() ERC721Creator("At Home During The DAY", "AHDTD") {}
}