// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

/// @title: Hot Sensation // halorena
/// @author: manifold.xyz

import "./ERC721Creator.sol";

//////////////////////////////////////////////////////////////////////////////
//                                                                          //
//                                                                          //
//                   )        (                                             //
//                ( /(     )  )\      (      (            )                 //
//                )\()) ( /( ((_) (   )(    ))\  (     ( /(                 //
//               ((_)\  )(_)) _   )\ (()\  /((_) )\ )  )(_))                //
//               | |(_)((_)_ | | ((_) ((_)(_))  _(_/( ((_)_                 //
//               | ' \ / _` || |/ _ \| '_|/ -_)| ' \))/ _` |                //
//               |_||_|\__,_||_|\___/|_|  \___||_||_| \__,_|                //
//                                                                          //
//                                                                          //
//                                    ▒▒                                    //
//                                    ▓▓                                    //
//                                    ▓▓▓▓                                  //
//                                    ████                                  //
//                                  ░░████                                  //
//                                  ██▓▓██                                  //
//                            ░░  ████▓▓▓▓    ▒▒                            //
//                            ▓▓▒▒▓▓██▒▒▓▓  ██░░                            //
//                          ▓▓██████▒▒▓▓▒▒████  ▒▒                          //
//                          ██████▒▒▒▒▓▓▒▒██▒▒  ██                          //
//                          ██▓▓▓▓░░▒▒████▓▓░░▒▒██  ░░                      //
//                          ██▒▒▒▒░░▒▒▓▓██▓▓▓▓████▓▓░░                      //
//                          ██▒▒▒▒░░▒▒████▓▓██▓▓████░░                      //
//                          ██▒▒░░░░▒▒▓▓██▒▒██▒▒██▓▓░░                      //
//                      ░░  ▒▒▒▒░░░░░░▒▒██░░▒▒▒▒▓▓██                        //
//                        ██▓▓▓▓░░  ░░▒▒▒▒░░░░▒▒▓▓▓▓                        //
//                        ░░██▓▓▒▒░░  ░░░░░░░░░░▓▓░░                        //
//                          ░░▓▓░░░░        ░░▒▒░░                          //
//                              ░░▒▒░░      ░░                              //
//                                                                          //
//                                                                          //
//                                                                          //
//////////////////////////////////////////////////////////////////////////////


contract HOTS is ERC721Creator {
    constructor() ERC721Creator("Hot Sensation // halorena", "HOTS") {}
}