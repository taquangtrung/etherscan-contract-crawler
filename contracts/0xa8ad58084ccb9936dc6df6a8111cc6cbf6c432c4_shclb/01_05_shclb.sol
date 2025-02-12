// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

/// @title: collabs
/// @author: manifold.xyz

import "./ERC721Creator.sol";

///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//                                                                                                                                                                                           //
//                                                                                                                                                                                           //
//       .-'''-..---.  .---.    ,-----.      ____   .-------.,---------.  .-'''-..---.  .---.    ,-----.       _______     ,-----.     .---.    .---.       ____    _______     .-'''-.      //
//      / _     |   |  |_ _|  .'  .-,  '.  .'  __ `.|  _ _   \          \/ _     |   |  |_ _|  .'  .-,  '.    /   __  \  .'  .-,  '.   | ,_|    | ,_|     .'  __ `.\  ____  \  / _     \     //
//     (`' )/`--|   |  ( ' ) / ,-.|  \ _ \/   '  \  | ( ' )  |`--.  ,---(`' )/`--|   |  ( ' ) / ,-.|  \ _ \  | ,_/  \__)/ ,-.|  \ _ \,-./  )  ,-./  )    /   '  \  | |    \ | (`' )/`--'     //
//    (_ o _).  |   '-(_{;}_;  \  '_ /  | |___|  /  |(_ o _) /   |   \ (_ o _).  |   '-(_{;}_;  \  '_ /  | ,-./  )     ;  \  '_ /  | \  '_ '`)\  '_ '`)  |___|  /  | |____/ /(_ o _).        //
//     (_,_). '.|      (_,_)|  _`,/ \ _/  |  _.-`   | (_,_).' __ :_ _:  (_,_). '.|      (_,_)|  _`,/ \ _/  \  '_ '`)   |  _`,/ \ _/  |> (_)  ) > (_)  )     _.-`   |   _ _ '. (_,_). '.      //
//    .---.  \  | _ _--.   |: (  '\_/ \   .'   _    |  |\ \  |  |(_I_) .---.  \  | _ _--.   |: (  '\_/ \   ;> (_)  )  _: (  '\_/ \   (  .  .-'(  .  .-'  .'   _    |  ( ' )  .---.  \  :     //
//    \    `-'  |( ' ) |   | \ `"/  \  ) /|  _( )_  |  | \ `'   (_(=)_)\    `-'  |( ' ) |   | \ `"/  \  ) /(  .  .-'_/  \ `"/  \  ) / `-'`-'|__`-'`-'|___|  _( )_  | (_{;}_) \    `-'  |     //
//     \       /(_{;}_)|   |  '. \_/``".' \ (_ o _) |  |  \    / (_I_)  \       /(_{;}_)|   |  '. \_/``".'  `-'`-'     / '. \_/``".'   |        |        \ (_ o _) |  (_,_)  /\       /      //
//      `-...-' '(_,_) '---'    '-----'    '.(_,_).'''-'   `'-'  '---'   `-...-' '(_,_) '---'    '-----'      `._____.'    '-----'     `--------`--------`'.(_,_).'/_______.'  `-...-'       //
//                                                                                                                                                                                           //
//                                                                                                                                                                                           //
//                                                                                                                                                                                           //
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


contract shclb is ERC721Creator {
    constructor() ERC721Creator("collabs", "shclb") {}
}