// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

/// @title: the Regenerates
/// @author: manifold.xyz

import "./ERC721Creator.sol";

/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//                                                                                                                                                                                         //
//                                                                                                                                                                                         //
//                                                                                                                                                                                         //
//    ,---------. .---.  .---.     .-''-.          .-------.        .-''-.    .-_'''-.       .-''-.  ,---.   .--.    .-''-.  .-------.       ____   ,---------.    .-''-.     .-'''-.      //
//    \          \|   |  |_ _|   .'_ _   \         |  _ _   \     .'_ _   \  '_( )_   \    .'_ _   \ |    \  |  |  .'_ _   \ |  _ _   \    .'  __ `.\          \ .'_ _   \   / _     \     //
//     `--.  ,---'|   |  ( ' )  / ( ` )   '        | ( ' )  |    / ( ` )   '|(_ o _)|  '  / ( ` )   '|  ,  \ |  | / ( ` )   '| ( ' )  |   /   '  \  \`--.  ,---'/ ( ` )   ' (`' )/`--'     //
//        |   \   |   '-(_{;}_). (_ o _)  |        |(_ o _) /   . (_ o _)  |. (_,_)/___| . (_ o _)  ||  |\_ \|  |. (_ o _)  ||(_ o _) /   |___|  /  |   |   \  . (_ o _)  |(_ o _).        //
//        :_ _:   |      (_,_) |  (_,_)___|        | (_,_).' __ |  (_,_)___||  |  .-----.|  (_,_)___||  _( )_\  ||  (_,_)___|| (_,_).' __    _.-`   |   :_ _:  |  (_,_)___| (_,_). '.      //
//        (_I_)   | _ _--.   | '  \   .---.        |  |\ \  |  |'  \   .---.'  \  '-   .''  \   .---.| (_ o _)  |'  \   .---.|  |\ \  |  |.'   _    |   (_I_)  '  \   .---..---.  \  :     //
//       (_(=)_)  |( ' ) |   |  \  `-'    /        |  | \ `'   / \  `-'    / \  `-'`   |  \  `-'    /|  (_,_)\  | \  `-'    /|  | \ `'   /|  _( )_  |  (_(=)_)  \  `-'    /\    `-'  |     //
//        (_I_)   (_{;}_)|   |   \       /         |  |  \    /   \       /   \        /   \       / |  |    |  |  \       / |  |  \    / \ (_ o _) /   (_I_)    \       /  \       /      //
//        '---'   '(_,_) '---'    `'-..-'          ''-'   `'-'     `'-..-'     `'-...-'     `'-..-'  '--'    '--'   `'-..-'  ''-'   `'-'   '.(_,_).'    '---'     `'-..-'    `-...-'       //
//                                                                                                                                                                                         //
//                                                                                                                                                                                         //
//                                                                                                                                                                                         //
//                                                                                                                                                                                         //
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


contract REGEN is ERC721Creator {
    constructor() ERC721Creator("the Regenerates", "REGEN") {}
}