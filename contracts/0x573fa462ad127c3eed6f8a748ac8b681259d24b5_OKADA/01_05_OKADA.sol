// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

/// @title: okada san
/// @author: manifold.xyz

import "./ERC721Creator.sol";

/////////////////////////////////////////////////////////////////////////////////////////////////////////////
//                                                                                                         //
//                                                                                                         //
//     ::::::::  :::    :::     :::     :::::::::      :::           ::::::::      :::     ::::    :::     //
//    :+:    :+: :+:   :+:    :+: :+:   :+:    :+:   :+: :+:        :+:    :+:   :+: :+:   :+:+:   :+:     //
//    +:+    +:+ +:+  +:+    +:+   +:+  +:+    +:+  +:+   +:+       +:+         +:+   +:+  :+:+:+  +:+     //
//    +#+    +:+ +#++:++    +#++:++#++: +#+    +:+ +#++:++#++:      +#++:++#++ +#++:++#++: +#+ +:+ +#+     //
//    +#+    +#+ +#+  +#+   +#+     +#+ +#+    +#+ +#+     +#+             +#+ +#+     +#+ +#+  +#+#+#     //
//    #+#    #+# #+#   #+#  #+#     #+# #+#    #+# #+#     #+#      #+#    #+# #+#     #+# #+#   #+#+#     //
//     ########  ###    ### ###     ### #########  ###     ###       ########  ###     ### ###    ####     //
//                                                                                                         //
//                                                                                                         //
/////////////////////////////////////////////////////////////////////////////////////////////////////////////


contract OKADA is ERC721Creator {
    constructor() ERC721Creator("okada san", "OKADA") {}
}