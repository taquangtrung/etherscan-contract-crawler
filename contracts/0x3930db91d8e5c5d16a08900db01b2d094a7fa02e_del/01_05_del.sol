// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

/// @title: Delusions
/// @author: manifold.xyz

import "./ERC721Creator.sol";

/////////////////////////////////////////////////////////////////////////////////////////////////
//                                                                                             //
//                                                                                             //
//    @@@@@@@   @@@@@@@@  @@@       @@@  @@@   @@@@@@   @@@   @@@@@@   @@@  @@@   @@@@@@       //
//    @@@@@@@@  @@@@@@@@  @@@       @@@  @@@  @@@@@@@   @@@  @@@@@@@@  @@@@ @@@  @@@@@@@       //
//    @@!  @@@  @@!       @@!       @@!  @@@  [email protected]@       @@!  @@!  @@@  @@[email protected][email protected]@@  [email protected]@           //
//    [email protected]!  @[email protected]  [email protected]!       [email protected]!       [email protected]!  @[email protected]  [email protected]!       [email protected]!  [email protected]!  @[email protected]  [email protected][email protected][email protected]!  [email protected]!           //
//    @[email protected]  [email protected]!  @!!!:!    @!!       @[email protected]  [email protected]!  [email protected]@!!    [email protected]  @[email protected]  [email protected]!  @[email protected] [email protected]!  [email protected]@!!        //
//    [email protected]!  !!!  !!!!!:    !!!       [email protected]!  !!!   [email protected]!!!   !!!  [email protected]!  !!!  [email protected]!  !!!   [email protected]!!!       //
//    !!:  !!!  !!:       !!:       !!:  !!!       !:!  !!:  !!:  !!!  !!:  !!!       !:!      //
//    :!:  !:!  :!:        :!:      :!:  !:!      !:!   :!:  :!:  !:!  :!:  !:!      !:!       //
//     :::: ::   :: ::::   :: ::::  ::::: ::  :::: ::    ::  ::::: ::   ::   ::  :::: ::       //
//    :: :  :   : :: ::   : :: : :   : :  :   :: : :    :     : :  :   ::    :   :: : :        //
//                                                                                             //
//                                                                                             //
//                                                                                             //
/////////////////////////////////////////////////////////////////////////////////////////////////


contract del is ERC721Creator {
    constructor() ERC721Creator("Delusions", "del") {}
}