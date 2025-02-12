// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

/// @title: THE AiPES
/// @author: manifold.xyz

import "./ERC721Creator.sol";

////////////////////////////////////////////////////////////////////////////////////////////
//                                                                                        //
//                                                                                        //
//    $$$$$$$$\ $$\   $$\ $$$$$$$$\        $$$$$$\  $$\ $$$$$$$\  $$$$$$$$\  $$$$$$\      //
//    \__$$  __|$$ |  $$ |$$  _____|      $$  __$$\ \__|$$  __$$\ $$  _____|$$  __$$\     //
//       $$ |   $$ |  $$ |$$ |            $$ /  $$ |$$\ $$ |  $$ |$$ |      $$ /  \__|    //
//       $$ |   $$$$$$$$ |$$$$$\          $$$$$$$$ |$$ |$$$$$$$  |$$$$$\    \$$$$$$\      //
//       $$ |   $$  __$$ |$$  __|         $$  __$$ |$$ |$$  ____/ $$  __|    \____$$\     //
//       $$ |   $$ |  $$ |$$ |            $$ |  $$ |$$ |$$ |      $$ |      $$\   $$ |    //
//       $$ |   $$ |  $$ |$$$$$$$$\       $$ |  $$ |$$ |$$ |      $$$$$$$$\ \$$$$$$  |    //
//       \__|   \__|  \__|\________|      \__|  \__|\__|\__|      \________| \______/     //
//                                                                                        //
//                                                                                        //
//                                                                                        //
////////////////////////////////////////////////////////////////////////////////////////////


contract AiPE is ERC721Creator {
    constructor() ERC721Creator("THE AiPES", "AiPE") {}
}