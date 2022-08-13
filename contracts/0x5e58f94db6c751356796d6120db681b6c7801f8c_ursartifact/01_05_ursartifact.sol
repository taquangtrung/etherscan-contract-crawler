// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

/// @title: ursaparty artifacts
/// @author: manifold.xyz

import "./ERC721Creator.sol";

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//                                                                                                                              //
//                                                                                                                              //
//                                                                                                                              //
//                                                     __                          __  .__  _____               __              //
//     __ _________  ___________  ___________ ________/  |_ ___.__. _____ ________/  |_|__|/ ____\____    _____/  |_  ______    //
//    |  |  \_  __ \/  ___/\__  \ \____ \__  \\_  __ \   __<   |  | \__  \\_  __ \   __\  \   __\\__  \ _/ ___\   __\/  ___/    //
//    |  |  /|  | \/\___ \  / __ \|  |_> > __ \|  | \/|  |  \___  |  / __ \|  | \/|  | |  ||  |   / __ \\  \___|  |  \___ \     //
//    |____/ |__|  /____  >(____  /   __(____  /__|   |__|  / ____| (____  /__|   |__| |__||__|  (____  /\___  >__| /____  >    //
//                      \/      \/|__|       \/             \/           \/                           \/     \/          \/     //
//                                                                                                                              //
//                                                                                                                              //
//                                                                                                                              //
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


contract ursartifact is ERC721Creator {
    constructor() ERC721Creator("ursaparty artifacts", "ursartifact") {}
}