// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

/// @title: Low Effort Robbies
/// @author: manifold.xyz

import "./ERC721Creator.sol";

////////////////////////////////////////////////////////////////////////////////////////////
//                                                                                        //
//                                                                                        //
//    .,,,,............(#*(/*/#,,./*%(**/**,*,.*/#(*.,,,,,##/*,,*,.,*/&%%%%%%#((#((*#*    //
//    ...............,/(#(((/*,*,,*/%*,*(///,..*.#(*,,..,,,.///*,.,.*/&%%#(((((#((((((    //
//     ..............//((//((**/*,,#%//*##%#((/**./#*,..*,..,*(/*...*/%#(#(#(((#(/((((    //
//     ............./(/#%///*////,*(%%//#(%###((*,/%%**,*/...,,//*,./(%###(#(((((((/(/    //
//     ............///##(/#/((###(%#&*##%#&#*##%%##&%&%/(,,.,**.,/,.**#(((((((((((((/(    //
//     ............**(/(((((#%#%#/&(**#%#*/,/%#(%#*/*(%&%%/(,.,,,**,,/%%#(#((#((((((#*    //
//     ............*#((%#//&&(&#&(%/,*(%/(%%,(#/(#%#((#%&&%&*,,..,/*.*###*#(/(/#(/*(((    //
//     ...........,/(##(((&@&@@&/***,*/*,/#(((#(/*(((%%%#%&&@#*,.,*(,,/#(#((#(((((((#*    //
//     ...........//((##%%##&&&@/(%(/*#/#,*(%((/*/*//(%%###%&#%(##(*,*/#&#((#(((((((//    //
//     ...........%(&&@###&#(@@&&#%%,/#%%##%*####((&##/(/(%&&&%%#/*.,,(##(##/#((#(((#/    //
//    ............&&&@(###%#&&%&(&#(*/#%###%&##%##%#(/*/*/%&@&&%%(/,,*%%##((((((##(#/#    //
//    ............/(####%*/#@%#(#%#%#/%(/#%/((/(*((/%(/**/(&&#/****(((%%%##((###(((((*    //
//    ............(/#///(/%&/###&/#/*(((((%,//(/*,//((((*,,((/&%%(#(/(&%#%######((((##    //
//    ............,//(///(%@@%//**,%#/#/(//*,///**///(////(#%(///*.*/(&%#%%%##%(((((#(    //
//    ............./(##(///(/(#(,*###((/%*/(*///*/*,,**/(/#%&#/,,..,(%&%%%%##((((((##(    //
//    ,............//(//%/%%#((*/(/%#(##(##///(//,**/###%#//&/*....,(%#(%*#(*(/*(#((((    //
//    ,............(/#((((%%((#/*,#%%%#&#&#(#/#%#&%#((%**/(%(*.....*#&%%#####%/##(#((#    //
//    ..............*(####%%#(((/(#&###%%%&#(/##(*((#%*/(/(&/,,...,/#&%%%%#%###/#/##(/    //
//    ..............,/(#%%&##(#(///%%%%(%(#%%(#(%%/#(((//(%(/*....,##%&@%&##&###%(/###    //
//    ...............//##%%&##(#(&#&%%&&%(&#%&**#%##(/*/*&&&//*...*#%&%%%%%#%##/###((/    //
//    ................((((%#%####(&%%%%%(*/###*%&%((#//(%@&#/(*..,#&%&&&#&%&%%%#####(*    //
//    ,,,,.......,,,....*/(%%%%#%%&&%%#%%%//#&&#%&&%(##&&%#(///.*/#&%#%%%###%###%###/*    //
//    ,,,.,....,.,,,,....(/(#%%%##%&&##%#(%&(#%#&@%/&&%&&(/(/(/,.*(&&&%%%(%%#%(##(####    //
//    ,,,,,,,,,,,,,,,,.....(((#(#%&%(/((#&%(((#%&//&(%(@@*//#&/,,*(&%&&&%&&%&%%(#(**#(    //
//    ,,,,,,,,,,,,,,,,,.....,(((##%#%%#%%(##%#@@&@##&#%&#///%%/,*/(&#%@&&%%#%#((######    //
//    **,*,,,**,*,*,,,,,,.....,//(#%%&%%%%%%#@@%%%&%#(&##/*(/%/,,#%&&%%%%###########/(    //
//    ***,***,****,,,,,,,,,.....((/(###%%%##(/%#&/#(@&%&&(#/&%&//(%@&&&%%#########(((#    //
//    ****,****,*****,,,,,,,,,....(//(((###((%#&#%#&&&&&&&%(%&%*/#(&&&&%&&%&%%&%((#(##    //
//    ,************,******,,,,...,%//(((###%#%%/&#%@@&&&&&%&%&/**(#&&&&%%%#(####((####    //
//    ////*/*/***********,,,*,,...%%((((######&%%##(@@&@&&&&///**##&&&&##%##((//(###((    //
//    /(///**//////*/*******,,,..,&&&&(((#(((##%%#%#(((@@&&#(/**##&&&&&&&&%#######(###    //
//    (((/////////////******,,,,./&@@@@@%#&&@(%%%%%%(##/@@&#(**/%@&&&&&&&&&&%%%%###(##    //
//                                                                                        //
//                                                                                        //
//                                                                                        //
////////////////////////////////////////////////////////////////////////////////////////////


contract LEROBBIES is ERC721Creator {
    constructor() ERC721Creator("Low Effort Robbies", "LEROBBIES") {}
}