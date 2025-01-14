// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

/// @title: Piggi's paintings
/// @author: manifold.xyz

import "./ERC1155Creator.sol";

/////////////////////////////////////////////////////////////////////////////////////////////////
//                                                                                             //
//                                                                                             //
//                                                                                             //
//    ██████╗░██╗░██████╗░░██████╗░██╗██╗░██████╗                                              //
//    ██╔══██╗██║██╔════╝░██╔════╝░██║╚█║██╔════╝                                              //
//    ██████╔╝██║██║░░██╗░██║░░██╗░██║░╚╝╚█████╗░                                              //
//    ██╔═══╝░██║██║░░╚██╗██║░░╚██╗██║░░░░╚═══██╗                                              //
//    ██║░░░░░██║╚██████╔╝╚██████╔╝██║░░░██████╔╝                                              //
//    ╚═╝░░░░░╚═╝░╚═════╝░░╚═════╝░╚═╝░░░╚═════╝░                                              //
//                                                                                             //
//    ██████╗░░█████╗░██╗███╗░░██╗████████╗██╗███╗░░██╗░██████╗░░██████╗                       //
//    ██╔══██╗██╔══██╗██║████╗░██║╚══██╔══╝██║████╗░██║██╔════╝░██╔════╝                       //
//    ██████╔╝███████║██║██╔██╗██║░░░██║░░░██║██╔██╗██║██║░░██╗░╚█████╗░                       //
//    ██╔═══╝░██╔══██║██║██║╚████║░░░██║░░░██║██║╚████║██║░░╚██╗░╚═══██╗                       //
//    ██║░░░░░██║░░██║██║██║░╚███║░░░██║░░░██║██║░╚███║╚██████╔╝██████╔╝                       //
//    ╚═╝░░░░░╚═╝░░╚═╝╚═╝╚═╝░░╚══╝░░░╚═╝░░░╚═╝╚═╝░░╚══╝░╚═════╝░╚═════╝░                       //
//                                                                                             //
//                                                                                             //
//    ░█████╗░  ░██████╗███████╗██████╗░██╗███████╗  ░█████╗░███████╗                          //
//    ██╔══██╗  ██╔════╝██╔════╝██╔══██╗██║██╔════╝  ██╔══██╗██╔════╝                          //
//    ███████║  ╚█████╗░█████╗░░██████╔╝██║█████╗░░  ██║░░██║█████╗░░                          //
//    ██╔══██║  ░╚═══██╗██╔══╝░░██╔══██╗██║██╔══╝░░  ██║░░██║██╔══╝░░                          //
//    ██║░░██║  ██████╔╝███████╗██║░░██║██║███████╗  ╚█████╔╝██║░░░░░                          //
//    ╚═╝░░╚═╝  ╚═════╝░╚══════╝╚═╝░░╚═╝╚═╝╚══════╝  ░╚════╝░╚═╝░░░░░                          //
//                                                                                             //
//    ███████╗██████╗░██╗████████╗██╗░█████╗░███╗░░██╗  ███╗░░░███╗░█████╗░██████╗░███████╗    //
//    ██╔════╝██╔══██╗██║╚══██╔══╝██║██╔══██╗████╗░██║  ████╗░████║██╔══██╗██╔══██╗██╔════╝    //
//    █████╗░░██║░░██║██║░░░██║░░░██║██║░░██║██╔██╗██║  ██╔████╔██║███████║██║░░██║█████╗░░    //
//    ██╔══╝░░██║░░██║██║░░░██║░░░██║██║░░██║██║╚████║  ██║╚██╔╝██║██╔══██║██║░░██║██╔══╝░░    //
//    ███████╗██████╔╝██║░░░██║░░░██║╚█████╔╝██║░╚███║  ██║░╚═╝░██║██║░░██║██████╔╝███████╗    //
//    ╚══════╝╚═════╝░╚═╝░░░╚═╝░░░╚═╝░╚════╝░╚═╝░░╚══╝  ╚═╝░░░░░╚═╝╚═╝░░╚═╝╚═════╝░╚══════╝    //
//                                                                                             //
//    ██████╗░░█████╗░██╗░░░░░██╗░░░░░███████╗  ░█████╗░███╗░░██╗██████╗░                      //
//    ██╔══██╗██╔══██╗██║░░░░░██║░░░░░██╔════╝  ██╔══██╗████╗░██║██╔══██╗                      //
//    ██║░░██║███████║██║░░░░░██║░░░░░█████╗░░  ███████║██╔██╗██║██║░░██║                      //
//    ██║░░██║██╔══██║██║░░░░░██║░░░░░██╔══╝░░  ██╔══██║██║╚████║██║░░██║                      //
//    ██████╔╝██║░░██║███████╗███████╗███████╗  ██║░░██║██║░╚███║██████╔╝                      //
//    ╚═════╝░╚═╝░░╚═╝╚══════╝╚══════╝╚══════╝  ╚═╝░░╚═╝╚═╝░░╚══╝╚═════╝░                      //
//                                                                                             //
//    ██████╗░██╗░░██╗░█████╗░████████╗░█████╗░░██████╗██╗░░██╗░█████╗░██████╗░                //
//    ██╔══██╗██║░░██║██╔══██╗╚══██╔══╝██╔══██╗██╔════╝██║░░██║██╔══██╗██╔══██╗                //
//    ██████╔╝███████║██║░░██║░░░██║░░░██║░░██║╚█████╗░███████║██║░░██║██████╔╝                //
//    ██╔═══╝░██╔══██║██║░░██║░░░██║░░░██║░░██║░╚═══██╗██╔══██║██║░░██║██╔═══╝░                //
//    ██║░░░░░██║░░██║╚█████╔╝░░░██║░░░╚█████╔╝██████╔╝██║░░██║╚█████╔╝██║░░░░░                //
//    ╚═╝░░░░░╚═╝░░╚═╝░╚════╝░░░░╚═╝░░░░╚════╝░╚═════╝░╚═╝░░╚═╝░╚════╝░╚═╝░░░░░                //
//                                                                                             //
//                                                                                             //
/////////////////////////////////////////////////////////////////////////////////////////////////


contract AiPGG is ERC1155Creator {
    constructor() ERC1155Creator() {}
}