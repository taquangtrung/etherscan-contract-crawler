// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

/// @title: Familiarz 2.0
/// @author: manifold.xyz

import "./ERC721Creator.sol";

//////////////////////////////////////////////////////////////////////////////////////////////////////////////
//                                                                                                          //
//                                                                                                          //
//                                                                                                          //
//                                                                                                          //
//     ______   ________   ___ __ __    ________  __        ________  ________   ______      ______         //
//    /_____/\ /_______/\ /__//_//_/\  /_______/\/_/\      /_______/\/_______/\ /_____/\    /_____/\        //
//    \::::_\/_\::: _  \ \\::\| \| \ \ \__.::._\/\:\ \     \__.::._\/\::: _  \ \\:::_ \ \   \:::__\/        //
//     \:\/___/\\::(_)  \ \\:.      \ \   \::\ \  \:\ \       \::\ \  \::(_)  \ \\:(_) ) )_    /: /         //
//      \:::._\/ \:: __  \ \\:.\-/\  \ \  _\::\ \__\:\ \____  _\::\ \__\:: __  \ \\: __ `\ \  /::/___       //
//       \:\ \    \:.\ \  \ \\. \  \  \ \/__\::\__/\\:\/___/\/__\::\__/\\:.\ \  \ \\ \ `\ \ \/_:/____/\     //
//        \_\/     \__\/\__\/ \__\/ \__\/\________\/ \_____\/\________\/ \__\/\__\/ \_\/ \_\/\_______\/     //
//                                                                                                          //
//                                                                                                          //
//                                                                                                          //
//                                                                                                          //
//////////////////////////////////////////////////////////////////////////////////////////////////////////////


contract FAM is ERC721Creator {
    constructor() ERC721Creator("Familiarz 2.0", "FAM") {}
}