// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

/// @title: Hanalei
/// @author: manifold.xyz

import "./ERC721Creator.sol";

/////////////////////////////////////////////////////////////////////////////////////////
//                                                                                     //
//                                                                                     //
//    .---.  .---.    ____    ,---.   .--.   ____      .---.       .-''-.  .-./`)      //
//    |   |  |_ _|  .'  __ `. |    \  |  | .'  __ `.   | ,_|     .'_ _   \ \ .-.')     //
//    |   |  ( ' ) /   '  \  \|  ,  \ |  |/   '  \  \,-./  )    / ( ` )   '/ `-' \     //
//    |   '-(_{;}_)|___|  /  ||  |\_ \|  ||___|  /  |\  '_ '`) . (_ o _)  | `-'`"`     //
//    |      (_,_)    _.-`   ||  _( )_\  |   _.-`   | > (_)  ) |  (_,_)___| .---.      //
//    | _ _--.   | .'   _    || (_ o _)  |.'   _    |(  .  .-' '  \   .---. |   |      //
//    |( ' ) |   | |  _( )_  ||  (_,_)\  ||  _( )_  | `-'`-'|___\  `-'    / |   |      //
//    (_{;}_)|   | \ (_ o _) /|  |    |  |\ (_ o _) /  |        \\       /  |   |      //
//    '(_,_) '---'  '.(_,_).' '--'    '--' '.(_,_).'   `--------` `'-..-'   '---'      //
//                                                                                     //
//                                                                                     //
//                                                                                     //
/////////////////////////////////////////////////////////////////////////////////////////


contract HANA is ERC721Creator {
    constructor() ERC721Creator("Hanalei", "HANA") {}
}