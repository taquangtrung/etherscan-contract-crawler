// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

/// @title: Limit3d
/// @author: manifold.xyz

import "./ERC1155Creator.sol";

////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//                                                                                                            //
//                                                                                                            //
//    WWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWW    //
//    WWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWW    //
//    WWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWW    //
//    WWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWNXKK000kOKXXOk000KXXNWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWW    //
//    WWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWNXK0Oxdlc:;:;;:cc;;::clodxO0KXNWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWW    //
//    WWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWNXK0Oxdollllcc:;,;,'..';;:clllllloodkO0KNWWWWWWWWWWWWWWWWWWWWWWWWWWWW    //
//    WWWWWWWWWWWWWWWWWWWWWWWWWWWNNKOdoolllllcccc::;;,,'',,,;::::::::cclllloodk0NNWWWWWWWWWWWWWWWWWWWWWWWW    //
//    WWWWWWWWWWWWWWWWWWWWWWWWWNXOol::llcccc:cclolccc:;,',,,:llllllcc:;:::cclc:lokXNNWWWWWWWWWWWWWWWWWWWWW    //
//    WWWWWWWWWWWWWWWWWWWWWWWN0kkl',;:::;:clcccc:;;,;;;;;:::::;;,;::cc:cc:;;:::;'ckOOXWWWWWWWWWWWWWWWWWWWW    //
//    WWWWWWWWWWWWWWWWWWWWWNKdc:,'.';cccccc:,,;:coxk0KKKXXXXKKOkxdoc:;,;ccllclc,'',:cd0NWWWWWWWWWWWWWWWWWW    //
//    WWWWWWWWWWWWWWWWWWWWKxl;;;,''',:cc;;;ldkKNWWWWWWWWWWWWWWWWWWWNXOxl:;;cll;,,',;;:lxKNWWWWWWWWWWWWWWWW    //
//    WWWWWWWWWWWWWWWWWWN0dcclc:;::,,,,;cxKNWWWWWWWWWWWWWWWWWWWWWWWWWWWWXko:::;;::::clllo0NWWWWWWWWWWWWWWW    //
//    WWWWWWWWWWWWWWWWWNOocclc:ccll:,;o0NWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWNKxc:cllcc::llloONWWWWWWWWWWWWWW    //
//    WWWWWWWWWWWWWWWWNOo:::::ccc:,;oKWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWXxc;:lolcccccokXWWWWWWWWWWWWW    //
//    WWWWWWWWWWWWWWWNOocc:;:ccc;,c0NWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWKd;:ccc:::cllkXWWWWWWWWWWWW    //
//    WWWWWWWWWWWWWWXklcc:,:cc:;;dXWWWWWWWWWWWWWWWW @MRSWEMUSIC1 WWWWWWWWWWWWWWWNkc;::::;:cllxKWWWWWWWWWWW    //
//    WWWWWWWWWWWWWNkc:cc;;:cc;:kNWWWWWWWWWWWWWWWWWWWWW__  __WWWWWWWWWWWWWWWWWWWWW0l:ccc:;:c:cxXWWWWWWWWWW    //
//    WWWWWWWWWWWWWKo;;:;;:cc::xNWWWWWWWWWWWWWWWWWWWWWWWW  WWWWWWWWWWWWWWWWWWWWWWWW0l:ccc:;:;;ckNWWWWWWWWW    //
//    WWWWWWWWWWWWNxc::;;;;:::dXWWWWWWWWWWWWWWWWWWWWWWWWW  WWWWWWWWWWWWWWWWWWWWWWWWNOl:::::;;::l0WWWWWWWWW    //
//    WWWWWWWWWWWWKo:::;;::::oKWWWWWWWWWWWWWWWWWWWWWWWWW    WWWWWWWWWWWWWWWWWWWWWWWWNkc::::;;:cckNWWWWWWWW    //
//    WWWWWWWWWWWW0lc:;;:cc::xXWWWWWWWWWWWWWWWWWWWWWWWWWW  WWWWWWWWWWWWWWWWWWWWWWWWWOl:::;,,;:;oXWWWWWWWW     //
//    WWWWWWWWWWWNkcc:;:::::ckNWWWWWWWWWWWWWWWWWWWWWWWW  WW  WWWWWWWWWWWWWWWWWWWWWWWWKo::::,,;::lKWWWWWWWW    //
//    WWWWWWWWWWWXdccc:;;;;::kWWWWWWWWWWWWWWWWWWWWWWWWWWW  WWWWWWWWWWWWWWWWWWWWWWWWWWKl;;::;,;c:l0WWWWWWWW    //
//    WWWWWWWWWWWXd;,,,,;;::ckNWWWWWWWWWWWWWWWWWWWWWWW        WWWWWWWWWWWWWWWWWWWWWWKl:::;,,,;;c0WWWWWWWW     //
//    WWWWWWWWWWWNx;,'''',:c:dNWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWOc:;,'''',;l0WWWWWWWW    //
//    WWWWWWWWWWWNOdc'...,:c:oKWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWNx:::;'''';okKWWWWWWWW    //
//    WWWWWWWWWWWWX0o,'',ccc::kNWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWKl::cc:;,':kKNWWWWWWWW    //
//    WWWWWWWWWWWWXkl;;;;:ccc;cOWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWXd;:clc;;;;:l0WWWWWWWWW    //
//    WWWWWWWWWWWWWXx:;::;:cc:;lKWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWNkc:ccc:;::;l0NWWWWWWWWW    //
//    WWWWWWWWWWWWWWKdccc;,:cc:,c0NWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWXx:::cc:;ccclONWWWWWWWWWW    //
//    WWWWWWWWWWWWWWWKxlcc;;ccc:,;kNWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWKo;:c:c:;clldONWWWWWWWWWWW    //
//    WWWWWWWWWWWWWWWNKxlc:;;ccc:;,o0NWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWXkc;cllc::cccoONWWWWWWWWWWWW    //
//    WWWWWWWWWWWWWWWWWKxc:cc::ccc:,;dKNWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWXkl::cllc:clcld0NWWWWWWWWWWWWW    //
//    WWWWWWWWWWWWWWWWWWXklcllc:cllc;,;oOXWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWNKxc::colc::clclxKNWWWWWWWWWWWWWW    //
//    WWWWWWWWWWWWWWWWWWWXOoc::;,;,,,;:;;:oOXNWWWWWWWWWWWWWWWWWWWWWWWWN0xl:;cc;;;;;;:cclxKNWWWWWWWWWWWWWWW    //
//    WWWWWWWWWWWWWWWWWWWWNKxc;,,'',;cllc:;;;coxOKNNWWWWWWWWWWWWNXKOxoc;;:clloc;,,,,;co0NWWWWWWWWWWWWWWWWW    //
//    WWWWWWWWWWWWWWWWWWWWWWNKdll;'';::;:cll:;,,;;cloodddxxdddolc::;,,;cllc::cc;',cloOXWWWWWWWWWWWWWWWWWWW    //
//    WWWWWWWWWWWWWWWWWWWWWWWNXKXx:;::c:::c:clllll:;;,,'''',;::::clllc::::::cc:::o0XXNWWWWWWWWWWWWWWWWWWWW    //
//    WWWWWWWWWWWWWWWWWWWWWWWWWWNKOklclllllcccccc:::::;,',;,:cccc::::::::clllclxO0XWWWWWWWWWWWWWWWWWWWWWWW    //
//    WWWWWWWWWWWWWWWWWWWWWWWWWWWWWWX0kxxdollllcc:;;;,,,',,;;;:::::clllllodxkOXNWWWWWWWWWWWWWWWWWWWWWWWWWW    //
//    WWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWNNX0Oxdoolcc:;;;,.''';;:cllllodxk0KXNNWWWWWWWWWWWWWWWWWWWWWWWWWWWWW    //
//    WWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWNNXKOxxololloxkocoodxkOKXNNWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWW    //
//    WWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWNNNNXXXNNXXXNWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWW    //
//    WWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWW    //
//    WWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWW    //
//    WWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWW    //
//    WWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWW    //
//                                                                                                            //
//                                                                                                            //
//                                                                                                            //
//                                                                                                            //
////////////////////////////////////////////////////////////////////////////////////////////////////////////////


contract MRSW3 is ERC1155Creator {
    constructor() ERC1155Creator() {}
}