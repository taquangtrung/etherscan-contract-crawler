// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

/// @title: AlineSubi
/// @author: manifold.xyz

import "./ERC721Creator.sol";

/////////////////////////////////////////////////////////////////////////////////////////////////////////
//                                                                                                     //
//                                                                                                     //
//       ____      .---.    .-./`) ,---.   .--.    .-''-.     .-'''-.   ___    _  _______  .-./`)      //
//     .'  __ `.   | ,_|    \ .-.')|    \  |  |  .'_ _   \   / _     \.'   |  | |\  ____  \\ .-.')     //
//    /   '  \  \,-./  )    / `-' \|  ,  \ |  | / ( ` )   ' (`' )/`--'|   .'  | || |    \ |/ `-' \     //
//    |___|  /  |\  '_ '`)   `-'`"`|  |\_ \|  |. (_ o _)  |(_ o _).   .'  '_  | || |____/ / `-'`"`     //
//       _.-`   | > (_)  )   .---. |  _( )_\  ||  (_,_)___| (_,_). '. '   ( \.-.||   _ _ '. .---.      //
//    .'   _    |(  .  .-'   |   | | (_ o _)  |'  \   .---..---.  \  :' (`. _` /||  ( ' )  \|   |      //
//    |  _( )_  | `-'`-'|___ |   | |  (_,_)\  | \  `-'    /\    `-'  || (_ (_) _)| (_{;}_) ||   |      //
//    \ (_ o _) /  |        \|   | |  |    |  |  \       /  \       /  \ /  . \ /|  (_,_)  /|   |      //
//     '.(_,_).'   `--------`'---' '--'    '--'   `'-..-'    `-...-'    ``-'`-'' /_______.' '---'      //
//                                                                                                     //
//                                                                                                     //
//                                                                                                     //
/////////////////////////////////////////////////////////////////////////////////////////////////////////


contract ALINESUBI is ERC721Creator {
    constructor() ERC721Creator("AlineSubi", "ALINESUBI") {}
}