// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

/// @title: Observations of Absence
/// @author: manifold.xyz

import "./ERC721Creator.sol";

/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//                                                                                                                         //
//                                                                                                                         //
//                                                                                                                         //
//                                                                                                                         //
//              ..|''||   '||                                                .    ||                                       //
//             .|'    ||   || ...   ....    ....  ... ..  .... ...  ....   .||.  ...    ...   .. ...    ....               //
//             ||      ||  ||'  || ||. '  .|...||  ||' ''  '|.  |  '' .||   ||    ||  .|  '|.  ||  ||  ||. '               //
//             '|.     ||  ||    | . '|.. ||       ||       '|.|   .|' ||   ||    ||  ||   ||  ||  ||  . '|..              //
//              ''|...|'   '|...'  |'..|'  '|...' .||.       '|    '|..'|'  '|.' .||.  '|..|' .||. ||. |'..|'              //
//                                                                                                                         //
//                                                                                                                         //
//                                .'|.        |     '||                                                                    //
//                        ...   .||.         |||     || ...   ....    ....  .. ...     ....    ....                        //
//                      .|  '|.  ||         |  ||    ||'  || ||. '  .|...||  ||  ||  .|   '' .|...||                       //
//                      ||   ||  ||        .''''|.   ||    | . '|.. ||       ||  ||  ||      ||                            //
//                       '|..|' .||.      .|.  .||.  '|...'  |'..|'  '|...' .||. ||.  '|...'  '|...'                       //
//                                                                                                                         //
//                                                                                                                         //
//                                                                                                                         //
//                                                                                                                         //
//                                      (((/****,**,,,,,....,,,,,***///(((((((((((((((/                                    //
//                           %&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&%%&&&&&&&&&&&&&&&&&&%%%%%%%%%                           //
//                       ##(((//**,,.....,,,,,*****/////(((((#########((((///****,,,,.....,,**//((##                       //
//                       ##(((//**,,.....,,,,,*****/////(((((#########((((///****,,,,.....,,**//((##                       //
//                       ##(((//**,,.....,,,,,*****/////(((((#########((((///****,,,,.....,,**//((#                        //
//                            .*(,*(/*.*  ,,,....,,,***///(((((///***,,,...,,,***/. ./(.*(/,.*                             //
//                            /*((*,....  ,...,,***//(((((//**,,...,,**///((((//**,  *(/*,....                             //
//                            (*((*,....  /                                     ///  *((*,....                             //
//                             *((/,...*  //                                   *//   *((*,....                             //
//                              .(.*(,     /*                                 **//    ,(./(,                               //
//                              .(,(*,,     /*                               ***/     ,/,(*,.                              //
//                              ,*/((((      **                             ****      **/(((,                              //
//                               ,(/..        **,,..,,,,,,,,,,,,,,,,,,,,..,,,**        ,(*.                                //
//                               ,(/..         ,*,...,,,,,,,,,,,,,,,,,,.,,,**          ,(*.                                //
//                               ,(/..           *,...,,,,,,,,,,,,,,,,,,,,,            ,(*.                                //
//                               ,(/..              ,..,,,,,,,,,,,,,,,,,,              ,(*.                                //
//                               ,(/..                ...,,,,,,,,,,,..                 ,(*.                                //
//                               ,(/..                   .  ,,,,                       ,(*.                                //
//                               ,(/..                        ,                        ,(*.                                //
//                               ,(/..                  .     ,     .                  ,(*.                                //
//                               ,(/..               ,        ,        ,               ,(*.                                //
//                               ,(/..            ,           ,          ,             ,(*.                                //
//                               ,(/..           ,            ,            ,           ,(*.                                //
//                               ,(/..         *              ,             *          ,(*.                                //
//                               ,(/..       ,*             ,,,,,            *,        ,(*.                                //
//                              (#(,..      /**           ,,,,,,,,,           **\      ##/,..                              //
//                              *(.*(*.    //          ,,,,,,,,,,,,,,,        \\*      //./(*.                             //
//                              ,*/(((/   ,/       ,,,,,,,,,,,,,,,,,,,,,,,      ,\    **/(((                               //
//                             *((*,...   /*    ,,,,,,,,,,,,,,,,,,,,,,,,,,,,   **/*   (/*....,                             //
//                            (*((*,...  /,,, ................................. **/*  (/*,....                             //
//                             *((*,....../*:::::::::::::::::::::::::::::::::::::*.*..((*,...,                             //
//                           &&&&&&&&&&&&%%&&&&&&&&&&&&&&&&&&&&&&&&%%&&&&&&&&&&&&&&%%%%%%%%%%%%%                           //
//                       ##(((//**,,.....,,,,,*****/////(((((#########((((///****,,,,.....,,**//((##                       //
//                       ##(((//**,,.....,,,,,*****/////(((((#########((((///****,,,,.....,,**//((##                       //
//                       ##(((//**,,.....,,,,,*****/////(((((#########((((///****,,,,.....,,**//((#                        //
//                                                                                                                         //
//                                                                                                                         //
//                                                                                                                         //
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


contract ABSENCE is ERC721Creator {
    constructor() ERC721Creator("Observations of Absence", "ABSENCE") {}
}