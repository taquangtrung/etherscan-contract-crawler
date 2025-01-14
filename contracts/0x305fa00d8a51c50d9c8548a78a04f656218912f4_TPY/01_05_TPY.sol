// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

/// @title: The Prayer
/// @author: manifold.xyz

import "./ERC721Creator.sol";

////////////////////////////////////////////////////////////////////////////////////////////
//                                                                                        //
//                                                                                        //
//                                                                                        //
//    .........................              .                                            //
//    .................... .  .                                                           //
//    .............                                                                .      //
//    . ........                                                                          //
//    . .......                     ...                                                   //
//    .  ....                    ...    .                                                 //
//    .   ....                 ......  .                                                  //
//    .  ........             ......                                                      //
//    .. ..........           .....  ....                                                 //
//    ...................     ..,..,....,..                                               //
//    .......................  .. .....,**.. .                                            //
//    .......................... ...*........ .                 #*                        //
//    ........................,*. .*,,....  ...         ,// /(  ((#%*                     //
//    .......................**,.(**(***,,......,..    ..(/***/(/(*%*                     //
//    ......................//**//#//#%#**,,,******......%#***//,,,*                      //
//    ......................*/*////***((#,((((####/,,....,#/**,,,                         //
//    ......................../*,,,,**(//,,////((####&...*#(***/                          //
//    ............................/***//,.,,,////(((*/***&(/***                           //
//    ............................./**//,,.,...,,,,**//*(((/*/                            //
//    ............................ //*/(( .,,,..,,,**//(#((/*/                            //
//    .............................///**/    ...,,,*//(#((////                            //
//    .............................,//////,..,,,,,,*////(/////                            //
//                                                                                        //
//                                                                                        //
////////////////////////////////////////////////////////////////////////////////////////////


contract TPY is ERC721Creator {
    constructor() ERC721Creator("The Prayer", "TPY") {}
}