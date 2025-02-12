// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

/// @title: Catology (ﾐዋ ﻌ ዋﾐ)ﾉ
/// @author: manifold.xyz

import "./ERC721Creator.sol";

//////////////////////////////////////////////////////////////////////////////////////////////////////
//                                                                                                  //
//                                                                                                  //
//    ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░▒▒▒░░░░░░░░░▒░░▒░▒░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░    //
//    ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░▒▒░▒▓██▓▓▒██▓▒▒░▒░░▒░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░    //
//    ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░▓▒█████████████▓░░░▓░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░    //
//    ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░▓▓▓▒░░░░░▒▓███▓░░░░░▒░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░    //
//    ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░▒▒░░░░▒░░▒░░░░░░░░░░░░▒░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░    //
//    ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░▓████████████████▓▓██████▓░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░    //
//    ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░▒██████▓▓████████▓▒▒▒░░░░▓░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░    //
//    ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░▒▓▒░░░░░▓███▓▓░░░░░░░░░▓░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░    //
//    ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░▒▒░▒▒▒░░░░░░░░░░░░░░░▓▓░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░    //
//    ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░▓▒▒▒▒▒▒▒▒▒░░░░░░░░░▒▓░▒▓▒░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░    //
//    ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░▓░░░▒▓▒░░░░░░░░░░░▒▒▒▓▓▓░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░    //
//    ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░▓▒░░░░░░░░░░░░▒▒▒▒▓▓▒░▒▓░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░    //
//    ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░▓▓▒░░░░░░░░▒▒▒▒▓▓▒▒░▒███▓░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░    //
//    ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░▓█▒▓▓▒░░░░░░▒▒▓▓▒░░▒▓███████░░░░░░░░░░░░░░░░░░░░░░░░░░░░░    //
//    ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░▓███▒░▒▓▓▓▓▓▓▒▒░░▒▓██████▓▓▓▓█▒░░░░░░░░░░░░░░░░░░░░░░░░░░░    //
//    ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░██████░░▓▓▓░░░░▒▓███████▓▓██████▒░░░░░░░░░░░░░░░░░░░░░░░░░░    //
//    ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░▓██▓███▓░▓▓▓▒░░▓███████▓▓█████████▓░░░░░░░░░░░░░░░░░░░░░░░░░    //
//    ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░▓████▓███▓▒▒▒▒▓█████████▓▓███▓▓▓▓▓██▓░░░░░░░░░░░░░░░░░░░░░░░░    //
//    ░░░░░░░░░░░░░░░░░░░░░░░░░░░░▒██▓▓█▓█████████████████▓▓██▓▓████▓▓▓█▓░░░░░░░░░░░░░░░░░░░░░░░    //
//    ░░░░░░░░░░░░░░░░░░░░░░░░░░░░██▓███▓▓████████████████▓▓███▓▓▓███▓▓███░░░░░░░░░░░░░░░░░░░░░░    //
//    ░░░░░░░░░░░░░░░░░░░░░░░░░░░▓███▓▓▓▓████▓▓████████████▓▓▓▓▓███▓▓▓█████░░░░░░░░░░░░░░░░░░░░░    //
//    ░░░░░░░░░░░░░░░░░░░░░░░░░░░██▓████████████████████████████▓▓▓█████████░░░░░░░░░░░░░░░░░░░░    //
//    ░░░░░░░░░░░░░░░░░░░░░░░░░░████████████████████████████████████████████▓░░░░░░░░░░░░░░░░░░░    //
//    ░░░░░░░░░░░░░░░░░░░░░░░░░████████████████████████▓▓█████▓██████████████░░░░░░░░░░░░░░░░░░░    //
//    ░░░░░░░░░░░░░░░░░░░░░░░░▓▓█▓████████▓█████████████████▓█▓████▓▓██▓▓▓▓▓▓▒░░░░░░░░░░░░░░░░░░    //
//    ░░░░░░░░░░░░░░░░░░░░░░░▓▓███████████████▓██████████████▓█████████▓████▓█░░░░░░░░░░░░░░░░░░    //
//    ░░░░░░░░░░░░░░░░░░░░░░▓▓▓▓▓▓██████████████████████▓███████████████▓▓▓▓▓█▒░░░░░░░░░░░░░░░░░    //
//    ░░░░░░░░░░░░░░░░░░░░░▓▓▓▓██▓█████████████████████████████████████████▓▓▓▓░░░░░░░░░░░░░░░░░    //
//    ░░░░░░░░░░░░░░░░░░░░▒▓▓▓▓███████▓███████████████████████████████████▓▓███░░░░░░░░░░░░░░░░░    //
//    ░░░░░░░░░░░░░░░░░░░░██▓▓▓▓█████████████████████████████▓▓▓▓▓█████▓▓▓▓████░░░░░░░░░░░░░░░░░    //
//    ░░░░░░░░░░░░░░░░░░░▓███▓█▓▓███▓██████████████████████▓▓▓█████████▓▓▓█████▒░░░░░░░░░░░░░░░░    //
//    ░░░░░░░░░░░░░░░░░░░░░▓███████████████████████████████▓▓▓▓█████████████▓▒▒▓░░░░░░░░░░░░░░░░    //
//    ░░░░░░░░░░░░░░░░░░░░░░░░░▓███▓██▓█████████████▓▓█████▓▓▓▓▓▓████▓▓▓▒▒▒░░░▒▓░░░░░░░░░░░░░░░░    //
//    ░░░░░░░░░░░░░░░░▒░░░░░░░░░▒██▓█████████████████████▓▓▓▓███▓▓███░▓░░▒▓▓▓▓▓▓▓▓░░░░░░░░░░░░░░    //
//    ░░░░░░░░░░░░░░░░▓░░░░▒▒░░▓░▓█▓█████████████████████▓▓▒█████████░▓▓▓▓▓▓▓▓▓▓▓▓░░░░░░░░░░░░░░    //
//    ░░░░░░░░░░░░░░░░▓▒▒░░▒▒░░▒░██▓███████████████████▓▓▓▓▓▓▓███████░▒▓▓▓▓▓▓▓▓▓▓░░░░░░░░░░░░░░░    //
//    ░░░░░░░░░░░░░░░░▒░░░░░░▒░░░▓██▓███████████████▓▓▓▓▓▓▓▓▓▓▓█▓▓███░░▒░░░░░░░░▓░░░░░░░░░░░░░░░    //
//    ░░░░░░░░░░░░░░░▒░░▓▓▒▒▓▒░░░▓███▓███████████████▓▓▓▓▓▓███▓██████░░▒░░░░░░░▓░░░░░░░░░░░░░░░░    //
//    ░░░░░░░░░░░░░░░▒░░░▒▒▒▓▒░░░████████████████████▓▓▓▓▓███▓▓███▓██░░▓░░░░░░▒▒░░░░░░░░░░░░░░░░    //
//    ░░░░░░░░░░░░░░░░▓▒▒▒▒▓█░░░░████████████████████▓██▓▓██████▓████░░▒░░░░░▒▒░░░░░░░░░░░░░░░░░    //
//    ░░░░░░░░░░░░░░░░░░▒░▒▒░░░░▒███▓▓█████████████████▓█▓███████████░░▒░░░░▒░░░░░░░░░░░░░░░░░░░    //
//    ░░░░░░░░░░░░░░░░░░░░░░░░░░▒███████▓▓▓▓▓▓█████████████████▓▓████░░░░░░░░░░░░░░░░░░░░░░░░░░░    //
//    ░░░░░░░░░░░░░░░░░░░░░░░░░░▒██████▓▓███▓▓███████████████████████░░░░░░░░░░░░░░░░░░░░░░░░░░░    //
//    ░░░░░░░░░░░░░░░░░░░░░░░░░░░████▓▓▓█████████████████████████████░░░░░░░░░░░░░░░░░░░░░░░░░░░    //
//    ░░░░░░░░░░░░░░░░░░░░░░░░░░░▓██▓▓▓▓▓▓▓▓▓▓█▓█████████████████████▒░░░░░░░░░░░░░░░░░░░░░░░░░░    //
//    ░░░░░░░░░░░░░░░░░░░░░░░░░░░████▓▓▓▓███▓▓▓████████████████▓██▓███░░░░░░░░░░░░░░░░░░░░░░░░░░    //
//    ░░░░░░░░░░░░░░░░░░░░░░░░░░▒███▓▓▓▒████▓▓▓███▓███▓▒▓▓█████▓▓▓█▓██░░░░░░░░░░░░░░░░░░░░░░░░░░    //
//    ░░░░░░░░░░░░░░░░░░░░░░░░░░███▓▓▓▓▓████▓▓▓███████▓▓█▒▒█████▓▓██▓█▒░░░░░░░░░░░░░░░░░░░░░░░░░    //
//                                                                                                  //
//                                                                                                  //
//                                                                                                  //
//////////////////////////////////////////////////////////////////////////////////////////////////////


contract CATO is ERC721Creator {
    constructor() ERC721Creator(unicode"Catology (ﾐዋ ﻌ ዋﾐ)ﾉ", "CATO") {}
}