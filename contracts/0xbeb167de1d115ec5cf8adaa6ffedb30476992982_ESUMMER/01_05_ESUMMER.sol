// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

/// @title: ENDLESS SUMMER
/// @author: manifold.xyz

import "./ERC721Creator.sol";

////////////////////////////////////////////////////////////////////////////////////////////////
//                                                                                            //
//                                                                                            //
//                                                                                            //
//        ████████████████████████████████████████████████████████████████████████████████    //
//        ████████████████████████████████████████████████████████████████████████████████    //
//        ████████████████████████████████████████████████████████████████████████████████    //
//        ████████████████████████████████████████████████████████████████████████████████    //
//        ████████████████████████████████████████████████████████████████████████████████    //
//        ████████████████▌                                              j████████████████    //
//        ████████████████▌  .,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,   ████████████████    //
//        ████████████████▌  ▐▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒╛   ████████████████    //
//        ████████████████▌  ▐▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒╛   ████████████████    //
//        ████████████████▌  ▐▒▒▒▒▒▒▒▒▒▒▒▒▒▒╩▒▒▒▒▒╚▒▒▒▒╚▒▒▒▒▒▒▒▒▒▒▒▒▒▒╛   ████████████████    //
//        ████████████████▌  ▐▒▒▒▒▒▒▒▒▒▒▒▒▒▒ └▒▒▒⌐ ▒▒▒╙ φ▒▒▒▒▒▒▒▒▒▒▒▒▒╛   ████████████████    //
//        ████████████████▌  ▐▒▒▒▒▒▒▒▒▒▒╙╠▒▒▒ ╙╚╚⌐ ╚╚╙ φ▒▒▒╙╠▒▒▒▒▒▒▒▒▒╛   ████████████████    //
//        ████████████████▌  ▐▒▒▒▒▒▒▒▒▒▒≥ "╚"          "╚" ╔╠▒▒▒▒▒▒▒▒▒╛   ████████████████    //
//        ████████████████▌  ▐▒▒▒▒▒▒"╙╚▒▒╙                ╚▒▒╚╙"╚▒▒▒▒▒╛   ████████████████    //
//        ████████████████▌  ▐▒▒▒▒▒▒▒φ≡,                    ,╔φ▒▒▒▒▒▒▒╛   ████████████████    //
//        ████████████████▌  ▐▒▒▒▒▒▒▒▒▒▒                    ╠▒▒▒▒▒▒▒▒▒╛   ████████████████    //
//        ████████████████▌  ▐▒▒▒▒▒▒╓╓╓,                    ,╓╓╓φ▒▒▒▒▒╛   ████████████████    //
//        ████████████████▌  ▐▒▒▒▒▒▒▒▒▒▒                    ▒▒▒▒▒▒▒▒▒▒╛   ████████████████    //
//        ████████████████▌  ▐▒▒▒▒▒▒╙`,,╔                  ≡╓,`"╚▒▒▒▒▒╛   ████████████████    //
//        ████████████████▌  ▐▒▒▒▒▒▒▒▒▒▒▒╚                ╚▒▒▒▒▒▒▒▒▒▒▒╛   ████████████████    //
//        ████████████████▌  ▐▒▒▒▒▒▒▒▒▒▒ ,φ▒φ⌐         φ▒▒╓ ╚▒▒▒▒▒▒▒▒▒╛   ████████████████    //
//        ████████████████▌  ▐▒▒▒▒▒▒▒▒▒▒▒▒▒▒╙ δ▒▒⌐ ▒▒╠ └▒▒▒▒▒▒▒▒▒▒▒▒▒▒╛   ████████████████    //
//        ████████████████▌  ▐▒▒▒▒▒▒▒▒▒▒▒▒▒▒ φ▒▒▒ε,▒▒▒▒,╚▒▒▒▒▒▒▒▒▒▒▒▒▒╛   ████████████████    //
//        ████████████████▌  ▐▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒╛   ████████████████    //
//        ████████████████▌  ▐▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒╛   ████████████████    //
//        ████████████████▌  ▐▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒╛   ████████████████    //
//        ████████████████▌                                               ████████████████    //
//        ████████████████▌                                               ████████████████    //
//        ████████████████▌                                               ████████████████    //
//        ████████████████▌                                               ████████████████    //
//        ████████████████▌                                               ████████████████    //
//        ████████████████████████████████████████████████████████████████████████████████    //
//        ████████████████████████████████████████████████████████████████████████████████    //
//        ████████████████████████████████████████████████████████████████████████████████    //
//        ████████████████████████████████████████████████████████████████████████████████    //
//        ████████████████████████████████████████████████████████████████████████████████    //
//                                                                                            //
//                                                                                            //
////////////////////////////////////////////////////////////////////////////////////////////////


contract ESUMMER is ERC721Creator {
    constructor() ERC721Creator("ENDLESS SUMMER", "ESUMMER") {}
}