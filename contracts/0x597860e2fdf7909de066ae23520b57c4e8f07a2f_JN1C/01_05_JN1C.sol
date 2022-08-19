// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

/// @title: Jimmyn1c
/// @author: manifold.xyz

import "./ERC721Creator.sol";

/////////////////////////////////////////////////////////////////////////////////////////////
//                                                                                         //
//                                                                                         //
//     @@&@@@@@@%@@@@@@@@@@%((((((((#@@@@@@@@@@@@@@@@@&#((#(((((((#&.*&@&@@@@@@@@@@@@@@    //
//    @@%@&@@%@@@@@@#((((%@@@@@@@@@@@@@@@@@@@@@@@@&&&&&&&&&#@@@@#((((#( #@@@@@@@@@@@@@     //
//    @@@&@@&@@#%((@@@@@@@@@@%@@@@@@&&&&&&&&&&@&&&&&&&&&&&&&&&&&&&&@@@&((( (#(%@@@@@@@     //
//    @&@@&(((%@@@@@@@@@@@@@@@%%%%%%%&%####&%&&&&%&&&&&&&@@@@@@@@&&&&&@&@@@#(. (#(&@@@     //
//    @#((%@@@@@@@@@@@@@@@@@&&#%%%%&&%%%%&@@&&@&%@&@@@@@@@@@@%%@&%%%@%&@&&@@&&@((/((((     //
//    (@@@@@@@@@@@%%%&##&@%%&@@@@@%%%&@@&%%%&&%%&@@%@@%@%%@@@@@@&@&&%%@@%@&&&@%&@@@#((     //
//    @@@@@@@@@@@&&%%%%@@@@@@@@@@@@@#((#%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%&@&@&&@@&@&@     //
//    @@@@@@@@&@@@@@@&&@@@@@@#((((((((((((((((###(#(#(((#%%%%%%%%%%%%%%%%%@@%%%@@&&&&@     //
//    @@@@&&@@@@@@@@&@@@%(((((((((((#%%((((((((((((((((((((((((((((((((&&@#@&@&@%&@@&&     //
//    @@&@@@@@@(&&&&&((((((#(((((((#%%%%%%%%@@&%%((((((((((((((((((((((((((@@@@@@&@%@@     //
//    #@@@@@@@@@(#(((((((((((((((&&&&&&&&&(**,,,,,**#@@&&&&####%%%%%%%##((((((@@@@@@@%     //
//    @@@@@@@@@(((%%%%%##(((&&#&&&,*#&/,,,,,,,,,,,,,,(@%/*,,%@@@%%%%%((((((((((((@@@@@     //
//    @@@@@@@((#%%%%%%%&&&@@@**&,,,(**,,,,,,,,,,,,/,,,,*(,,,@*//&&@&(((((((((((((((&&&     //
//    @@@@@((%%%%%%%%%@@@@@@,,**,*,**&&&&&&&&&&&/&&&&&&%*****/#*@(**,&&((((((((((((((&     //
//    @@@((#%%%%%%%%@@@@@@@*&,,,%&&&&&&%&@#(#@@@%@@@@&&&&&&&&**/&*#@@&**&((((((#%%%%%%     //
//    @@(#%%%%%%%%@&&#@,#/,,*&&&&&@@@%#%##&&#&##%%@@@%##%@&(&&&&**@#&@@**#&((%%%%%%%%%     //
//    @(%%%%%%%%@@@%@,*/**@&&&%%@%#@&##%%#@%&##%#@@%%%&#%%%&@@&&&&@/@((@@&@&&%%%%%%%%%     //
//    (%%%%%%%%@@@@@#(*((&&&%%%#%#(#%#(#%#%%&@%@@%(###%@%%#&@##@&&&&&&@&@@@@&@%%%%%%%%     //
//    %%%%%%%%@@@@&&@&@@&&&%%#%%#%%(#%%@%%%%%%%%%%%%@@%##(%%#%&%%&&&&@&&&&@&&&@%%%%%%%     //
//    %%%%%%%@@@@@@@&@&&&%%##%(#%(#(@%%%%%%%%%%%%%%%%&%%%(((%##%%#@&&&@&&&@@&&&@%%%%%%     //
//    @%%%%%%@@@@@@@@@@&%(##%(#%(#%&%%%%%%%%%%%%%%%%%%%%%%#(((%@@@@@@&&(&@&&@&&&%%%%%#     //
//    %%%%%%@@@@@@@@@@@@@@@@@@@#((%%%%%%%%%%%%%%%%%%%%%%%%%#((@(%@#@&&/&,,**%*%&@%%%%(     //
//    %%%%%%@@@@@@@&@@&&@@@@@@@@@@@@@%%%%%%%%%%%%%%%%%%%%@*%(((@(&&&&&&&,,*,*,,,*(((((     //
//    %%%%%%@@@@@@@@@@&@@%#(((((##%%%,..........*%%%%%*../.%((&&#@@&&&&&*,,**,,,,#((((     //
//    %%%%%%@@@&&&&&@&&&#%##%(&#%(@@&*................,[email protected]%@((#&#&@&@&&&&*,(,#%,,*%%#((     //
//    %%%%%%%@@*@,**,**&&#&(#&#&#((%@%%%%.........../,#@@((((@##@#%&&&&/,/*&@*,%@%%%%%     //
//    ((((((#&&/*#**,,*%&&#&(#@((#(((&@%#((#%&#@@@#@@(@/(((&@&#&#&@&&&&%,(&@&&&&@%%%%%     //
//    %%%%%%%%@@@@@%&&(/&&@&&%#(#(#%#((((@@@%##%@@#@(((((&&@#@&#@@&&&&##@&&@&&&@((((((     //
//    %%%%%%%%%@@@@@@@@@##@&@@@@@@@@&@@@@@@@@@@@@@@&###%((%@%#@&&&&&&&&@((/,,,@(((((#(     //
//    %%%%%%%%%%@@@@@@@@@@@@@&@@@@@@@@@@@@@@@@&@@@@@@%#%%##@%@&&&&@*(/*,@&,*,@(((((#%#     //
//    %%%%%%%%%%%&@@*@@@&&&&@@&&&@#(%#%@@@@@@@@%(#%###%@&%&&&&&&@*,*#*%*,,(*@%%%%%%%%%     //
//    @%%%%%%%%%%%%@@((@@*,@*#*&&&&&&&&&%#%%%%%@%&&%&&&&%&&&*&*#@&,,@*@%@(@%%%%%%%%%(#     //
//    &&&((((((((((((&&/,(*@*(#(*,,%#(&*&&&&&&&*&#%&(&&(***,*#/#&&%@*#@@@%%%%%%#((((((     //
//    @@@@#%%%%%%%%##(((&&(,,&#%,*,%/*,,,*,,,,,,*,,,,,,*,(*/&#&%&,@@&@@%%%%%((((%(((#%     //
//    @@@@@@%%%%%%%%%%%%#((&&,,/,,**&/*,,**#@@@@@@@@@,**%&**%**@&&@@%%%%%((((%%((((%%%     //
//    @@@@@@@@#%%%(((((((((#(((%@(@@@@@@@@%@@@@@@*#/,*,*,**@/@@%%%%%%(#%(((%%%%@           //
//    @@@@@@@@@@(%%%%%%%%%%%%%%%%%%%@(#%%%@@(%%%%%%%%%%%%%((%%%%%%%%%@@%                   //
//    @@@@@@@@(#%%%%%%%(((%%%%%%%%%@@@@                                                    //
//    @@@@@@@@((%%%%%%%%%%%(((((((((((%%%%%%%%%%%%%%(((((((%%%%&&&@%%%%%@&                 //
//    @@@@@@@@@@@@@@@@@@@@@@@@%(((#%%%%(((((((((((%%%%%%%%%%%%%%%%#(@@@@@@@%%&@@@&&&&&     //
//    @@@@@@&@@@@@@@@@@@@@@@@@@@@@@@@%(((((((((((((#%%%%%%%%%&%&%@@&%@@@@@@@&&&&&@&&&&     //
//    @@@@@@@@@@&@@@@@@@@@@@@@@@@@@@@@@@@#&&&&&&&&&@&@@@&&&&&%%%@@%@@@@&&@&&&&@&&&@@@@     //
//    #((&@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@(&@&&&&&&&&&@@@@@@@@&@&@@&&@&@@@@#((     //
//    ###%(((@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@%&&&@&&&&&@@@@@&@@@@&@@@@@@(@@@@((((%#     //
//    ((((((#((((@@@@@@@@@@@@@@%@@@@@@%(&&&&&&&&&&&&@@@@&@&&@@@@@@@@@@@@@@@@##%%%%(((#     //
//    &@&(((((((((((((@@@@%(&&&&&&&&&&&&&@@@&&&%&&&&%&&&@@@@@@@@@@@@@@@((%%%%%%#((((((     //
//    @@@@@@((((((((((((((%%#&@@@@@@&&@@@@&@@@@@@@@@@@@@@@@@@@@@((((#%%%%%%%#((#((((#@     //
//    @@@@@@@@@@#((((((((((#((((((#####((#/(&&&&&&%#((((((((((((#%%%%%%%%((#((((#@@@@@     //
//                                                                                         //
//                                                                                         //
//                                                                                         //
//                                                                                         //
/////////////////////////////////////////////////////////////////////////////////////////////


contract JN1C is ERC721Creator {
    constructor() ERC721Creator("Jimmyn1c", "JN1C") {}
}