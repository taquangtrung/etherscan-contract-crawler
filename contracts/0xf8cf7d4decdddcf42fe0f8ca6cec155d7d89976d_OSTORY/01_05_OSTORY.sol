// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

/// @title: Openstory
/// @author: manifold.xyz

import "./ERC721Creator.sol";

////////////////////////////////////////////////////////////////////////////////////////////
//                                                                                        //
//                                                                                        //
//              */////////,/////////./////////.///////// /////////.(((//(((/,             //
//              /(((((((((*(((((((((.(((((((((.(((((((((.(((((((((,##(#####(,             //
//              /(((((((((*(((((((((.(((((((((.(((((((((.(((((((((,#########,             //
//              /(((((((((*(((((((((,(((((((((.(((((((((.(((((((((,##((##((#,             //
//    ,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,.,,,,,,,,, ,,,,,,,,,.,,,,,,,,,.,*,,**,,*.,********    //
//    (((((((((//(((((((((*(((((((((.(((((((((.(((((((((.(((((((((,((####(#(*(########    //
//    (((((((((//(((((((((*(((((((((.(((((((((.(((((((((.(((((((((,#(#######*(########    //
//    (((((((((//(((((((((*(((((((((,(((((((((.(((((((((.(((((((((,#########,(########    //
//    ,,,,,,,,,,.,,,,,,,,,                                         *********.,********    //
//    (((((((((//(((((((((                                         #(####(#(*(########    //
//    (((((((((//(((((((((                                         ((####(#(*(########    //
//    (((((((((//(((((((((                                         #####(((#*#########    //
//     ........  .  .. ..                                          ......... .........    //
//    (((((((((//(((((((((                                         #####((#(*(((((((((    //
//    (((((((((//(((((((((                                         ###(#####,(########    //
//    (((((((((//(((((((((                                         ###(#####,(########    //
//    ....................                                         ,,,,,,,,, .,,,,,,,,    //
//    (((((((((//(((((((((                                         #########*(########    //
//    (((((((((//(((((((((                                         ((####(##*(########    //
//    (((((((((//(((((((((                                         #(####(#(,(########    //
//     ......... ..... . .                                         .,,.,,,,, ,,,,,,,,,    //
//    #########(/#########                                         ######(#(*(########    //
//    #########(/#########                                         (########*(########    //
//    #########(/#########                                         #########,(########    //
//    ....................                                         ..,.,.,,,..........    //
//    #########(/#########                                         *********.*********    //
//    #########(/#########                                         *********.*********    //
//    #########(/#########                                         *********.*********    //
//    ,,,,,,,,,,,,,,,,,,,,                                         ......... .........    //
//    #########(/#########                                         *********.*********    //
//    #########(/#########                                         *********.*********    //
//    #########(/#########                                         *********.*********    //
//    *********,,*********                                         ........,..........    //
//    &&&&&&&&&##&&&&&&&&&                                         *********.*********    //
//    &&&&&&&&&##&&&&&&&&&                                         *********.*********    //
//    &&&&&&&&&##&&&&&&&&&                                         *********.*********    //
//    #########/(#########                                         ,,,,,,,,*.,,,,,,,,,    //
//    &&&&&&&&&##&&&&&&&&&/&&&&&&&&&,&&&&&&&&&.&&&&&&&&&,*********.*********.*********    //
//    &&&&&&&&&##&&&&&&&&&/&&&&&&&&&,&&&&&&&&&.&&&&&&&&&.*********.*********.*********    //
//    &&&&&&&&&##&&&&&&&&&/&&&&&&&&&,&&&&&&&&&.&&&&&&&&&.*********.*********.*********    //
//    %%%%%%%%#((%%%%%%%%#*#%%%%%%%#,##%%%%%%%.%%%%%%##%.,*,,,,,*,.,*,,,,,,,.,,,,,,,,,    //
//              #&&&&&&&&&/&&&&&&&&&,&&&&&&&&&.&&&&&&&&&.*********.*********.             //
//              #&&&&&&&&&/&&&&&&&&&,&&&&&&&&&.&&&&&&&&&.*********.*********.             //
//              #&&&&&&&&&/&&&&&&&&&,&&&&&&&&&.&&&&&&&&&.*********.*********.             //
//                                                                                        //
//                                                                                        //
//                                                                                        //
////////////////////////////////////////////////////////////////////////////////////////////


contract OSTORY is ERC721Creator {
    constructor() ERC721Creator("Openstory", "OSTORY") {}
}