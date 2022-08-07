// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

/// @title: Glitch Grails
/// @author: manifold.xyz

import "./ERC721Creator.sol";

////////////////////////////////////////////////////////////////////////////////////////////////////////
//                                                                                                    //
//                                                                                                    //
//                                                                                                    //
//                                               .:                     .:                            //
//                                                 :.                  :.                             //
//                                                  .:.              .:                               //
//                                                    ::            :.                                //
//                                                      ::        .:                                  //
//                                                       .-.     ::                                   //
//                                                        .-:   :.                                    //
//                       :----------------------------------------------------:.                      //
//                      .+##########################################*====+====+=                      //
//                       +%#==+********************************++=*%*-+*#***+-*=                      //
//                       +##--=%##########%%%%%%%###########**##=-+%*+#%##+=#-*-                      //
//                       +##-:=#****######%%%%%%%%%##########***--+%*=*#%#**+-*-                      //
//                       +##-:+*****######%%%%%%%%%##########***--*%*-=+**+=-=#:                      //
//                       +#%--+*****#####%%%%%%%%%%##########***=-*%*=###*+#*=*:                      //
//                       +#%--+*****#####%%%%%%%%%%##########***=-*%++#%#****=*:                      //
//                       =#%--+*****#####%%%%%%%%%%##########**#=-*%+-=+**+=-+*.                      //
//                       =#%--+*****######%%%%%%%%%##########**#=-*%+======+=+*.                      //
//                       -#%=-+#****######%%%%%%%%%%##########*#--#%+==++=++=++.                      //
//                       -#%=-=#***#######%%%%%%%%%###########**--#%*++++++++*+.                      //
//                       -#%=-=##*#############################*--#%*++++++++*+.                      //
//                       :#%=--################################*==#%*++++++++*+.                      //
//                       :#%+--=++*******##############*****+++===#%***++++++*+.                      //
//                      .:*%#*++++++++++++++++===+++++++++++++++**%%*++++++++*+.                      //
//                     ...=++***********************************************+=-..                     //
//                       ..:-+****************glitchgrails*nicedayjules******=-:..                    //
//                                                                                                    //
//                                                                                                    //
//                                                                                                    //
//                                                                                                    //
//                                                                                                    //
////////////////////////////////////////////////////////////////////////////////////////////////////////


contract GG is ERC721Creator {
    constructor() ERC721Creator("Glitch Grails", "GG") {}
}