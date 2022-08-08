// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

/// @title: The Outrigger
/// @author: manifold.xyz

import "./ERC721Creator.sol";

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//                                                                                                                                                            //
//                                                                                                                                                            //
//                                                                                                                                                            //
//            ,----,                                                                ,----,                                                                    //
//          ,/   .`|       ,--,                      ,----..                      ,/   .`|                                                                    //
//        ,`   .'  :     ,--.'|    ,---,.           /   /   \                   ,`   .'  :,-.----.     ,---,  ,----..     ,----..       ,---,.,-.----.        //
//      ;    ;     /  ,--,  | :  ,'  .' |          /   .     :          ,--,  ;    ;     /\    /  \ ,`--.' | /   /   \   /   /   \    ,'  .' |\    /  \       //
//    .'___,/    ,',---.'|  : ',---.'   |         .   /   ;.  \       ,'_ /|.'___,/    ,' ;   :    \|   :  :|   :     : |   :     : ,---.'   |;   :    \      //
//    |    :     | |   | : _' ||   |   .'        .   ;   /  ` ;  .--. |  | :|    :     |  |   | .\ ::   |  '.   |  ;. / .   |  ;. / |   |   .'|   | .\ :      //
//    ;    |.';  ; :   : |.'  |:   :  |-,        ;   |  ; \ ; |,'_ /| :  . |;    |.';  ;  .   : |: ||   :  |.   ; /--`  .   ; /--`  :   :  |-,.   : |: |      //
//    `----'  |  | |   ' '  ; ::   |  ;/|        |   :  | ; | '|  ' | |  . .`----'  |  |  |   |  \ :'   '  ;;   | ;  __ ;   | ;  __ :   |  ;/||   |  \ :      //
//        '   :  ; '   |  .'. ||   :   .'        .   |  ' ' ' :|  | ' |  | |    '   :  ;  |   : .  /|   |  ||   : |.' .'|   : |.' .'|   :   .'|   : .  /      //
//        |   |  ' |   | :  | '|   |  |-,        '   ;  \; /  |:  | | :  ' ;    |   |  '  ;   | |  \'   :  ;.   | '_.' :.   | '_.' :|   |  |-,;   | |  \      //
//        '   :  | '   : |  : ;'   :  ;/|         \   \  ',  / |  ; ' |  | '    '   :  |  |   | ;\  \   |  ''   ; : \  |'   ; : \  |'   :  ;/||   | ;\  \     //
//        ;   |.'  |   | '  ,/ |   |    \          ;   :    /  :  | : ;  ; |    ;   |.'   :   ' | \.'   :  |'   | '/  .''   | '/  .'|   |    \:   ' | \.'     //
//        '---'    ;   : ;--'  |   :   .'           \   \ .'   '  :  `--'   \   '---'     :   : :-' ;   |.' |   :    /  |   :    /  |   :   .':   : :-'       //
//                 |   ,/      |   | ,'              `---`     :  ,      .-./             |   |.'   '---'    \   \ .'    \   \ .'   |   | ,'  |   |.'         //
//                 '---'       `----'                           `--`----'                 `---'               `---`       `---`     `----'    `---'           //
//                                                                                                                                                            //
//                                                                                                                                                            //
//                                                                                                                                                            //
//                                                                                                                                                            //
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


contract OUTGR is ERC721Creator {
    constructor() ERC721Creator("The Outrigger", "OUTGR") {}
}