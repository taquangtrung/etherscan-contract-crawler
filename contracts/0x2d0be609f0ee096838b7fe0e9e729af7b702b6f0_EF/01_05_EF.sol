// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

/// @title: Eternal Fight
/// @author: manifold.xyz

import "./ERC721Creator.sol";

////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//                                                                                                            //
//                                                                                                            //
//    **************,(%%#/,/#(/%%%######/,*/&&(,,,,///%%(*##,,,#%%#%%/////%%%######(//(((.  ****###,*///,,    //
//    ********//(##(**#%%##(#(/%%%##%####,,,,**////////%%**#%,.#%%%///(########(////((/.  .*/**####,,///*.    //
//    ****//////////##/%%%###%%%%######%#//(#%%#(/////(%%***#,,%%%#//######////////.     ,****####,,,///*,    //
//    ***////#####(/(##%%%%%%%%%#######%(*****(%%%%%%%%%%/**#,%%%%(/(####/////, .    ,****/*/####,,,*///,,    //
//    ***////##%%###//###%#%###%#####(***/(%/******(%%%%/**/%%%%%%%/(###(////     *********####(,,,*/////*    //
//    ****//(/(####%##(/#########(/***%@&&&&&&&&/,**,****,*////******####//// . .**,,,,*/%####/,,,//%%%#//    //
//    ****,*/(///#####%##(///////(#/%&&&&&&@&&&&&&&*##. //////////.,/*/###(///  ,***&&&&&&%###,,.,/%%%&&%%    //
//    **********////#########%%#%&(**/*/****/////###,  ///####%###,..,/**(###// .**/&&&&@&%###,,,,,%%&&&&&    //
//    ###***********/%%&&&&@&&&&@*//######%########   ///######%###,,..,****/###*.****&&&@&&###/,,./%&&&&&    //
//    ,,,,,/************/%%%%%%&(/#######(###((*.  ..///#####%%%###,,.,..,*/*//***(#/******%&&###/,,,(&&&(    //
//    ,,,,,,.,,,************%%%%/#%#.          . *%(///#######%%%##(,..,.,,.,,.,...,,,,,,,******###,,,#&&#    //
//    ///////,,,,,,,**********%%%#.. .%%%%%%%%%#(///#####%%%#%&%%%%#####(/**//////////////(%%%%#***#,,,&&#    //
//    //////////(//*,,,,,******#%* #%%%%%#%%%##%%%%%%%%%%##%%%%%%,..,////////////////////////##%###**,,&&/    //
//    /((##((//////////*,,,,****%%%%%%%%%%##%##%###((#(%%%%%%#,..,////////*///*((###((/////////##%%%#,%&(/    //
//    %%#%#%%&&(,,,,,,/////,,,**(%##%#*,/##(#((#%#%%%%%%%%%#...*////*,,,,,.,,,#%#################%#%#%#///    //
//    %&&@@&*,.,,,.,,,,,,,*//,,*(#(,.,*(#(##&@#.#%%%%%%%%(,.,//****,,,.,,.,(#%%#.         .%##%%%#%#(///,     //
//    &&@&%,,,,%&%(#*,,,,,,,.,*,,,,.,(#(((%&&@&...%#%%(..,,/***,,..,,,,,#%%#%.   . .  .     *#%#%%(////.      //
//    &&@&(&&&&&*/######/.,,.,,,,,,,(#(#&&&&&&&@#....,..*****,,,,,,*###%#%(.*////////////* . #%%##/////*      //
//    /////////(####%#######,,,,./(#&&&@&@&&@@#//#%%(***,*,,,,,*####%%#%(//////(((((((((////* #%%%#%////      //
//    ((/,,,..,,,,*..,,..,/**////(&&&&&&&&@&/*(%%#*,,*,(/,,,,#%###%#%%(/((((((((##%%%%%#(((((/,/(##%%#//*     //
//    ,,..,,,,,,,,,/#%%%%%#*..,**/**/(&&&&&/*%%%/****/#%#,,,#%%%#%##/((((#%%&%&%%&%%%%&%%%%%%(((#,  /#%#/*    //
//    ,.,,.,,,,##%%%%/(%#%#######%%%//*/****%%%#*,,**(#%#/.((/##%#((((#&%%%&&%%%%%%%%%%%%%%%%####*    ###/    //
//    ,.,,*###%%%#*(###/,,,,,,(####%%#*****#%%%**,**,###%%%%#((((((#%&%%%%%&%%%%&%%%%%%%%%%%#(#((.   .#%%,    //
//    (###%%%%%(//###/,,,,/////(####%%#//*/%%%%**,,*,.##(*#%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%(/###(((    .%/,,    //
//    %%%%#%(#@///###,.,,///////####%%%//*/%%%%*****,..##(*///#%%%#%%%%%%%%%%%%%%%%%%%(//*,%##(((.  /(..,,    //
//    ,,,.*&&&&*//###,,,*///////####%%%%//%%%%%(*****,,.###**//////(%%%%%%%%%%%%%#/(////..,#%##(#  (%%%%%%    //
//    &@&*/(&@&///(##,,,,///////####%%%%%%%%%%#/**,***...###*****///////////////////*.,,..,#%#%#( *///////    //
//    &&&,,//*&@//*/#,,,,///////*%###%%%%%%###,,*,*****..,####***************,........,...,##### ,//******    //
//    @&&#,,//***/*//,,,*///////**/#########*****,***/*,...(###(//*******,*#/,.,..........#####&&&&&&&#///    //
//    &&&&,,,,*/*/***,,,//////////************,***//*/**,...*#### .*///*,,**/%%#(,.....,##%%#&&&@&%/////,.    //
//    &@&&@*,,,,,,,,,,,////,,,,,,,////.,*,***//*///*///**....*####( . .///***(%%//(########&&&&&&%*//..,.,    //
//    &&&%%&&*,,,,,,,//,,,.,,,,,,,,(%%%%%%*.....*****//*,.,,.,#####(   .//***%%%/**/*/*,.,.,,#&&&(//...*(#    //
//    #(###(##((///,,,,,,,,,,,,,%%%%##%%%%%%&%,....**/,.....,*######*  ,//**%%%*/*/,...*&&&&&&#.,*/...*#(/    //
//    (/////////%#,,,,,,,,,,,(%%%%##&&%%%((#%%%%(.,,.....,..*#######/ ///%%%%////,...(&&&&&&&&&%%(**..##((    //
//    ///////**#%%,,.,,,.,,(%%%%###%%(///////(%&%%%*,,.,,#%%%######( ,//%%#/**,,...,#%&@&&&&%%%/*/**..,(##    //
//    //////*,#(%%%%#**(#%%%%%##(%&%//////////#%%%%%%%%%%%#########  //%%/,.....,(##&&&&&%%(*/***//*..,###    //
//    /////,,*###%%%%%%%%%%%##(#/(%#///*.   ///######%###########%#  ./%..,((###%%%%%%&&%%##*,,****...((##    //
//    ////*,,,#(#(#(#######(#(#.//&%(///,     *//(#############%###.  **((#*,,.,,/###%%%%%%###,.....,(#(#%    //
//    ////,,,,,(####(((######%%.,//(%%/////.   . .///////%%###%#,(,  *#(#*..,(###########%%###((###(##(#%%    //
//    /////,.,.,,,##(####%##%#*,.,/////(%%(///       /%##%#%*,,((/ *((((,,,(##,.        .##%##((######%%##    //
//                                                                                                            //
//                                                                                                            //
////////////////////////////////////////////////////////////////////////////////////////////////////////////////


contract EF is ERC721Creator {
    constructor() ERC721Creator("Eternal Fight", "EF") {}
}