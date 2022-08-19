// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

/// @title: CastlePartyTJ
/// @author: manifold.xyz

import "./ERC721Creator.sol";

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//                                                                                                                                //
//                                                                                                                                //
//                                                           .,,,,,,,,,                                                           //
//                                              .,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,.                                              //
//                                        ,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,.                                       //
//                                   ,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,.                                  //
//                               ,,,,,,,,,,,,,,,,,,,,,,,,,.%######@@,,,,,,,,,,,,,,,,,,,,,,,,,,,,,.,,                              //
//                           .,,,,,,,,,,,,,,,,,,,,,.,&#############@,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,                           //
//                        .,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,.,,,,,,,,,@,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,                        //
//                      ,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,#&,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,                     //
//                   ..,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,&#@#@,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,                   //
//                 .,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,[email protected]((###&,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,                 //
//               .,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,.(#####%##,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,.               //
//              ,,,,,,,,,,,,,,,,,,,,,,,,*@&#@,,,,,,,,,,,,,,,,@%%###@#####@,,,,,,,,,,,#@&&*,,,,,,,,,,,,,,,,,,,,,,,,,,,             //
//            ,,,,,,,,,,,,,,,,,,,,,,,,#####@&,,,,,,,,,,,,,,*@&%%%######@%@&/,,,,,,.#####@%,,,,,,,,,,,,,,,,,,,,,,,,,,,,.           //
//           .,,,,,,,,,,,,,,,,,,,,#########@/,,,,,,,,,,,,,%&@#,,/%%###,,*&@##,,/########@%,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,          //
//          .,,,,,,,,,,,,,,,,,,,,,,,,..,,,.%,,,,,,,,,@,@%&@****************&@##**@/,,,,,*@,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,         //
//         ,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,.%@,,,,,,#(((/,*************************@,,,,,@#.,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,        //
//        ,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,(((%,,,,,,&((((&@,,************,/@#(,***.,,,[email protected]###,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,       //
//       ,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,&##@###/,,,,,@@******,#/#@@@@/(,*******@@,,,,*###@##@,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,      //
//      ,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,%&@@&&@@#@,,,,,@******@/&&&&&&&/@*(//%@,@,,,,@%&@@@@&##,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,.     //
//      ,,,,,,,,,,,,,,,,,,,,,,,,,,,,,@%%@/,,,,%###@*,,@******@/&&&&&&&/@*******@,*@%%%%#,/#@@##%,,,,,,,,,,,,,,,,,,,,,,,,,,,,,     //
//     ,,,,,,,,,,,,,,,,,,,,,,,,,,&***@@/,******,,****/@/&,***@/&&&&&&&/@*******%***/#,*******&@#**,@.,,,,,,,,,,,,,,,,,,,,,,,,,    //
//     ,,,,,,,,,,,,,,,,,,,,,,,,,,,*******************@@@#****%#######(((,******@(((****************(,,,,,,,,,,,,,,,,,,,,,,,,,,    //
//    .,,,,,,,,,,,,,,,,,,,,,,,,,,,@((((((((#((((/,**# @(((,********************@&((((((((((((******,,,,,,,,,,,,,,,,,,,,,,,,,,,    //
//    ,,,,,,,,,,,,,,,,,,,,,,,,,,,,,##***********,@@@***#(((@***,,***,,***@***,,*,@#%,************(@,,,,,,,,,,,,,,,,,,,,,,,,,,,    //
//    ,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,%***@/*/&*****,@%%%%%#####((((((///*****,((((#,,****@@%@&***,,.,,,,,,,,,,,,,,,,,,,,,,,,,,,    //
//    ,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,%**,/&&&@%*****@(((((((((((((((((((((((((((((%*****@@&&&%&,*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,    //
//     ,,,,,,,,,,,,,,,,,,,,,,,,,(,,@&**#%%%%%%*****@****************************(&*****@@@@@@%**,*,,,,,,,,,,,,,,,,,,,,,,,,,,,,    //
//     ,,,,,,,,,,,,,#(,,,,*,@@@*,/,*&*,************@***********/@@@@@*,**********@***********,***,@@@*,.,@**@[email protected](@,,,,,,,,,,,,,    //
//     ,,,,,,,,,,,,,,(((*****,*/((((@//&***********@*******@//@*/@/@//@//&*******@************//(,,*************@,,,,,,,,,,,,,    //
//      ,,,,,,,,,,,,..,,,***********@**************@*****,(/&/*//@/@//*/@//,*****@**************/(((,****,./%@@*,,,,,,,,,,,,,     //
//      ,,,,,,,,,,,,,,,,************@***********&@@@*****@*/@/*//@/@//*/@/*@*****@**************/*************@,,,,,,,,,,,,,,     //
//       ,,,,,,,,,,,,,.//&**********@**********,,/#&*****@@/@/*//@/@////@/@%*****@**************(**********#//@,,,,,,,,,,,,,      //
//        ,,,,,,,,,,,,.,*********,@&@*********[email protected]@@@(*****&**/****//////((((%*****&**************(#/,**********@,,,,,,,,,,,,       //
//         ,,,,,,,,,,,.,**********,*@***************,****&//@////@/@////@/(%*****#**************#@@&**********@,,,,,,,,,,,        //
//          ,,,,,,,,,,.,************@***************(****@*/@////@/&//(/@//%*****(**************%*************@,,,,,,,,,,         //
//           ,,,,,,,,,,((((,********@((,***********,((((*@/(@/(//@/&//(/@/*@****,(**************%(************@,,,,,,,,,          //
//            ,,,,,,,,,@@&&%%%####((@(((((((/,,*,*((###((@/(@(#((@/&//(/@**@,,,,,(((************&(((((,*******@,,,,,,,.           //
//              ,,,,,,,,,,,,,,,,,,,,,,,@%((((&@#,.,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,#@#(*****,@(,,,,,,,,,,,,,,,,,,,,,             //
//                ,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,               //
//                 .,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,                 //
//                    ,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,.                   //
//                      ,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,                     //
//                         ,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,                        //
//                            ,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,.,                           //
//                               ,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,.                              //
//                                   .,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,.                                  //
//                                        .,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,                                        //
//                                               .,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,.                                              //
//                                                                                                                                //
//                                                                                                                                //
//                                                                                                                                //
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


contract CPT is ERC721Creator {
    constructor() ERC721Creator("CastlePartyTJ", "CPT") {}
}