// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

/// @title: Reaper 1/1 Derivative Art
/// @author: manifold.xyz

import "./ERC721Creator.sol";

/////////////////////////////////////////////////////////////////////////
//                                                                     //
//                                                                     //
//    ______ _____  ___  ______ ___________                            //
//    | ___ \  ___|/ _ \ | ___ \  ___| ___ \                           //
//    | |_/ / |__ / /_\ \| |_/ / |__ | |_/ /                           //
//    |    /|  __||  _  ||  __/|  __||    /                            //
//    | |\ \| |___| | | || |   | |___| |\ \                            //
//    \_| \_\____/\_| |_/\_|   \____/\_| \_|                           //
//                                                                     //
//                                                                     //
//    ______ ___________ _____ _   _  ___ _____ _____ _   _ _____      //
//    |  _  \  ___| ___ \_   _| | | |/ _ \_   _|_   _| | | |  ___|     //
//    | | | | |__ | |_/ / | | | | | / /_\ \| |   | | | | | | |__       //
//    | | | |  __||    /  | | | | | |  _  || |   | | | | | |  __|      //
//    | |/ /| |___| |\ \ _| |_\ \_/ / | | || |  _| |_\ \_/ / |___      //
//    |___/ \____/\_| \_|\___/ \___/\_| |_/\_/  \___/ \___/\____/      //
//                                                                     //
//                                                                     //
//      ___  ______ _____                                              //
//     / _ \ | ___ \_   _|                                             //
//    / /_\ \| |_/ / | |                                               //
//    |  _  ||    /  | |                                               //
//    | | | || |\ \  | |                                               //
//    \_| |_/\_| \_| \_/                                               //
//                                                                     //
//                                                                     //
//                                                                     //
//                                                                     //
/////////////////////////////////////////////////////////////////////////


contract RDART is ERC721Creator {
    constructor() ERC721Creator("Reaper 1/1 Derivative Art", "RDART") {}
}