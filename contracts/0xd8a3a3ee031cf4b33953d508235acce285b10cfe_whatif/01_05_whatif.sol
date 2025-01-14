// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

/// @title: what IF art
/// @author: manifold.xyz

import "./ERC1155Creator.sol";

////////////////////////////////////////////////////////////////////////////////////////////////
//                                                                                            //
//                                                                                            //
//     █     █░ ██░ ██  ▄▄▄     ▄▄▄█████▓    ██▓  █████▒    ▄▄▄       ██▀███  ▄▄▄█████▓       //
//    ▓█░ █ ░█░▓██░ ██▒▒████▄   ▓  ██▒ ▓▒   ▓██▒▓██   ▒    ▒████▄    ▓██ ▒ ██▒▓  ██▒ ▓▒       //
//    ▒█░ █ ░█ ▒██▀▀██░▒██  ▀█▄ ▒ ▓██░ ▒░   ▒██▒▒████ ░    ▒██  ▀█▄  ▓██ ░▄█ ▒▒ ▓██░ ▒░       //
//    ░█░ █ ░█ ░▓█ ░██ ░██▄▄▄▄██░ ▓██▓ ░    ░██░░▓█▒  ░    ░██▄▄▄▄██ ▒██▀▀█▄  ░ ▓██▓ ░        //
//    ░░██▒██▓ ░▓█▒░██▓ ▓█   ▓██▒ ▒██▒ ░    ░██░░▒█░        ▓█   ▓██▒░██▓ ▒██▒  ▒██▒ ░        //
//    ░ ▓░▒ ▒   ▒ ░░▒░▒ ▒▒   ▓▒█░ ▒ ░░      ░▓   ▒ ░        ▒▒   ▓▒█░░ ▒▓ ░▒▓░  ▒ ░░          //
//      ▒ ░ ░   ▒ ░▒░ ░  ▒   ▒▒ ░   ░        ▒ ░ ░           ▒   ▒▒ ░  ░▒ ░ ▒░    ░           //
//      ░   ░   ░  ░░ ░  ░   ▒    ░          ▒ ░ ░ ░         ░   ▒     ░░   ░   ░             //
//        ░     ░  ░  ░      ░  ░            ░                   ░  ░   ░                     //
//                                                                                            //
//     ▄▄▄           ██████  ▄▄▄       █    ██     ▄████▄      ███▄    █   █████▒▄▄▄█████▓    //
//    ▒████▄       ▒██    ▒ ▒████▄     ██  ▓██▒   ▒██▀ ▀█      ██ ▀█   █ ▓██   ▒ ▓  ██▒ ▓▒    //
//    ▒██  ▀█▄     ░ ▓██▄   ▒██  ▀█▄  ▓██  ▒██░   ▒▓█    ▄    ▓██  ▀█ ██▒▒████ ░ ▒ ▓██░ ▒░    //
//    ░██▄▄▄▄██      ▒   ██▒░██▄▄▄▄██ ▓▓█  ░██░   ▒▓▓▄ ▄██▒   ▓██▒  ▐▌██▒░▓█▒  ░ ░ ▓██▓ ░     //
//     ▓█   ▓██▒   ▒██████▒▒ ▓█   ▓██▒▒▒█████▓    ▒ ▓███▀ ░   ▒██░   ▓██░░▒█░      ▒██▒ ░     //
//     ▒▒   ▓▒█░   ▒ ▒▓▒ ▒ ░ ▒▒   ▓▒█░░▒▓▒ ▒ ▒    ░ ░▒ ▒  ░   ░ ▒░   ▒ ▒  ▒ ░      ▒ ░░       //
//      ▒   ▒▒ ░   ░ ░▒  ░ ░  ▒   ▒▒ ░░░▒░ ░ ░      ░  ▒      ░ ░░   ░ ▒░ ░          ░        //
//      ░   ▒      ░  ░  ░    ░   ▒    ░░░ ░ ░    ░              ░   ░ ░  ░ ░      ░          //
//          ░  ░         ░        ░  ░   ░        ░ ░                  ░                      //
//                                                ░                                           //
//     ▄████▄   ▒█████   ███▄ ▄███▓ ███▄ ▄███▓ █    ██  ███▄    █  ██▓▄▄▄█████▓▓██   ██▓      //
//    ▒██▀ ▀█  ▒██▒  ██▒▓██▒▀█▀ ██▒▓██▒▀█▀ ██▒ ██  ▓██▒ ██ ▀█   █ ▓██▒▓  ██▒ ▓▒ ▒██  ██▒      //
//    ▒▓█    ▄ ▒██░  ██▒▓██    ▓██░▓██    ▓██░▓██  ▒██░▓██  ▀█ ██▒▒██▒▒ ▓██░ ▒░  ▒██ ██░      //
//    ▒▓▓▄ ▄██▒▒██   ██░▒██    ▒██ ▒██    ▒██ ▓▓█  ░██░▓██▒  ▐▌██▒░██░░ ▓██▓ ░   ░ ▐██▓░      //
//    ▒ ▓███▀ ░░ ████▓▒░▒██▒   ░██▒▒██▒   ░██▒▒▒█████▓ ▒██░   ▓██░░██░  ▒██▒ ░   ░ ██▒▓░      //
//    ░ ░▒ ▒  ░░ ▒░▒░▒░ ░ ▒░   ░  ░░ ▒░   ░  ░░▒▓▒ ▒ ▒ ░ ▒░   ▒ ▒ ░▓    ▒ ░░      ██▒▒▒       //
//      ░  ▒     ░ ▒ ▒░ ░  ░      ░░  ░      ░░░▒░ ░ ░ ░ ░░   ░ ▒░ ▒ ░    ░     ▓██ ░▒░       //
//    ░        ░ ░ ░ ▒  ░      ░   ░      ░    ░░░ ░ ░    ░   ░ ░  ▒ ░  ░       ▒ ▒ ░░        //
//    ░ ░          ░ ░         ░          ░      ░              ░  ░            ░ ░           //
//    ░                                                                         ░ ░           //
//                                                                                            //
//                                                                                            //
////////////////////////////////////////////////////////////////////////////////////////////////


contract whatif is ERC1155Creator {
    constructor() ERC1155Creator() {}
}