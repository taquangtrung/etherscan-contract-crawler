// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

/// @title: ALEJANDRA HER
/// @author: manifold.xyz

import "./ERC721Creator.sol";

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//                                                                                                                                                              //
//                                                                                                                                                              //
//                                                                                                                                                              //
//              ╖╗╗╗╗╖    ╗╗╕       ╗╗╗╗╗╗╗       ╗╗╗    ╓╗╗╗╗╖    ╔╖       ╗   ╗╗╗╗╗╗╖    ╒╗╗╗╗╗╗╖     ╓╗╗╗╗╖         ╗╗═  ╔╗╗   ╗╗╗╗╗╗╗   ╗╗╗╗╗╗╖             //
//            ╒╣╣╩ ╙╣╣╣   ╣╣╡       ╣╣╬           ╫╣╣   ╣╣╣╙ ╙╣╣═  ╟╣╣╦     ╣═  ╫╣╣  ╙╣╣╕  ╞╣╣╩  ║╣╣   ╣╣╣╙ ╙╣╣╦       ╣╣═  ╟╣╣   ╣╣╣       ╣╣╣  ╙╣╣╦           //
//            ╞╣╣─  ╟╣╣   ╣╣╡       ╣╣╬           ╫╣╣   ╣╣╬   ╣╣═  ╟╣╣╣╣╗   ╣═  ╫╣╣   ╣╣╡  ╞╣╣═  ║╣╣   ╣╣╬   ╣╣╬       ╣╣═  ╟╣╣   ╣╣╣       ╣╣╣  ┌╣╣╨           //
//            ╞╣╣╝╝╝╣╣╣   ╣╣╡       ╣╣╣╝╝╛        ╫╣╣   ╣╣╣╝╝╝╣╣═  ╟╬╙╫╣╣╣╣╦╣═  ╫╣╣   ╣╣╡  ╞╣╣╝╝╣╣╣╦   ╣╣╣╝╝╝╣╣╬       ╣╣╝╝╝╣╣╣   ╣╣╣╝╝╩    ╣╣╣╝╝╣╣╗            //
//            ╞╣╣─  ╟╣╣   ╣╣╡       ╣╣╬     ╞╣╣   ╫╣╣   ╣╣╬   ╣╣═  ╟╬   ╙╣╣╣╣═  ╫╣╣   ╣╣╡  ╞╣╣═  ╟╣╣   ╣╣╬   ╣╣╬       ╣╣═  ╟╣╣   ╣╣╣       ╣╣╣   ╣╣╬           //
//            ╞╣╣─  ╟╣╣   ╣╣╬╓╓╓╓   ╣╣╬╓╓╓╓ ╘╣╣╗╓╓╣╣╣   ╣╣╬   ╣╣═  ╟╬     ╙╣╣═  ╫╣╣╓╓╗╣╣╩  ╞╣╣═  ╟╣╣   ╣╣╬   ╣╣╬       ╣╣═  ╟╣╣   ╣╣╣╓╓╓╓   ╣╣╣   ╣╣╬           //
//             ╙╙   ╙╙╙   ╙╙╙╙╙╙╙   ╙╙╙╙╙╙╙   ╙╙╙╙╙     ╙╙└   ╙╙═  ╙╙      ╙╙   ╙╙╙╙╙╙╙    ╞╙╙   ╙╙╙   ╙╙╙   ╙╙╙       ╙╙   ╙╙╙   ╙╙╙╙╙╙╙   ╙╙╙   ╙╙            //
//                                                                                                                                                              //
//                                                                                                                                                              //
//                                                                                                                                                              //
//                                                                                                                                                              //
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


contract HER is ERC721Creator {
    constructor() ERC721Creator("ALEJANDRA HER", "HER") {}
}