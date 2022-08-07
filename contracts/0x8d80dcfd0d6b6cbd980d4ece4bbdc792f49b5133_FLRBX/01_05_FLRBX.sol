// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

/// @title: FLA-VOR-BOX
/// @author: manifold.xyz

import "./ERC721Creator.sol";

/////////////////////////////////////////////////////////////////////////////////////////////////////
//                                                                                                 //
//                                                                                                 //
//      _____   _        _         __     __    U  ___ u  ____        ____    U  ___ u__  __       //
//     |" ___| |"|   U  /"\  u     \ \   /"/u    \/"_ \U |  _"\ u  U | __")u   \/"_ \/\ \/"/       //
//    U| |_  U | | u  \/ _ \/ U  u  \ \ / //     | | | |\| |_) |U  u\|  _ \/   | | | |/\  /\       //
//    \|  _|/ \| |/__ / ___ \ /___\ /\ V /_,-.-,_| |_| | |  _ < /___\| |_) .-,_| |_| U /  \ u      //
//     |_|     |_____/_/   \_|__"__U  \_/-(_/ \_)-\___/  |_| \_|__"__|____/ \_)-\___/ /_/\_\       //
//     )(\\,-  //  \\ \\    >>       //            \\    //   \\_   _|| \\_      \\ ,-,>> \\_      //
//    (__)(_/ (_")("_(__)  (__)     (__)          (__)  (__)  (__) (__) (__)    (__) \_)  (__)     //
//      _____   _        _         __     __    U  ___ u  ____        ____    U  ___ u__  __       //
//     |" ___| |"|   U  /"\  u     \ \   /"/u    \/"_ \U |  _"\ u  U | __")u   \/"_ \/\ \/"/       //
//    U| |_  U | | u  \/ _ \/ U  u  \ \ / //     | | | |\| |_) |U  u\|  _ \/   | | | |/\  /\       //
//    \|  _|/ \| |/__ / ___ \ /___\ /\ V /_,-.-,_| |_| | |  _ < /___\| |_) .-,_| |_| U /  \ u      //
//     |_|     |_____/_/   \_|__"__U  \_/-(_/ \_)-\___/  |_| \_|__"__|____/ \_)-\___/ /_/\_\       //
//     )(\\,-  //  \\ \\    >>       //            \\    //   \\_   _|| \\_      \\ ,-,>> \\_      //
//    (__)(_/ (_")("_(__)  (__)     (__)          (__)  (__)  (__) (__) (__)    (__) \_)  (__)     //
//      _____   _        _         __     __    U  ___ u  ____        ____    U  ___ u__  __       //
//     |" ___| |"|   U  /"\  u     \ \   /"/u    \/"_ \U |  _"\ u  U | __")u   \/"_ \/\ \/"/       //
//    U| |_  U | | u  \/ _ \/ U  u  \ \ / //     | | | |\| |_) |U  u\|  _ \/   | | | |/\  /\       //
//    \|  _|/ \| |/__ / ___ \ /___\ /\ V /_,-.-,_| |_| | |  _ < /___\| |_) .-,_| |_| U /  \ u      //
//     |_|     |_____/_/   \_|__"__U  \_/-(_/ \_)-\___/  |_| \_|__"__|____/ \_)-\___/ /_/\_\       //
//     )(\\,-  //  \\ \\    >>       //            \\    //   \\_   _|| \\_      \\ ,-,>> \\_      //
//    (__)(_/ (_")("_(__)  (__)     (__)          (__)  (__)  (__) (__) (__)    (__) \_)  (__)     //
//      _____   _        _         __     __    U  ___ u  ____        ____    U  ___ u__  __       //
//     |" ___| |"|   U  /"\  u     \ \   /"/u    \/"_ \U |  _"\ u  U | __")u   \/"_ \/\ \/"/       //
//    U| |_  U | | u  \/ _ \/ U  u  \ \ / //     | | | |\| |_) |U  u\|  _ \/   | | | |/\  /\       //
//    \|  _|/ \| |/__ / ___ \ /___\ /\ V /_,-.-,_| |_| | |  _ < /___\| |_) .-,_| |_| U /  \ u      //
//     |_|     |_____/_/   \_|__"__U  \_/-(_/ \_)-\___/  |_| \_|__"__|____/ \_)-\___/ /_/\_\       //
//     )(\\,-  //  \\ \\    >>       //            \\    //   \\_   _|| \\_      \\ ,-,>> \\_      //
//    (__)(_/ (_")("_(__)  (__)     (__)          (__)  (__)  (__) (__) (__)    (__) \_)  (__)     //
//                                                                                                 //
//                                                                                                 //
/////////////////////////////////////////////////////////////////////////////////////////////////////


contract FLRBX is ERC721Creator {
    constructor() ERC721Creator("FLA-VOR-BOX", "FLRBX") {}
}