// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

/// @title: TheCollectadames
/// @author: manifold.xyz

import "./ERC721Creator.sol";

////////////////////////////////////////////////////////////////////////////////////////////////
//                                                                                            //
//                                                                                            //
//                                                                                            //
//        ▒▒╠╠╬╠╬╬╠╠╠╠╬╬╬╬╬╬╬╬╠╠╠╬╬╬╬╠╬╬╬╬╬╬▒░░░░░Ü░░░░▒▒╠╬▒▒╠╬╬╠╠╬╬╬╠╬╬╬╬╠╬╬╠╬╠╬╠╬╠╠╠╠╬╬╠    //
//        ▒▒╠╠╠╬╬╠╠╬╬╬╬╬╬╬╬╬╬╬╠╠╠╬╬╬╬╬╬╬╬▒╬╬▒Ü░░░░░░░░▒╬╠╠╬╬╬╠▒███████╬╠╢╬╬╠╬╬╬╬╬╬╬╬╠╬╬╬╠╬    //
//        ▒Ü╠╬╠╬╬╬╠╬╬╬╠╬╬╬╬╬╬╬╬╠╠╬╠╬╬╬╬▒▒Ü▒╬▒Ü░░░Ü░░░╠╠╣██████████████▓███▒╬Ñ▒╬╬╬╬╬╬╠╬╬╠╬╬    //
//        Ü░╠╠╬╬╠╬╠╬╬╬╠╠╠╬╬╬╠╬╠╠╬╬╬╬╬▒Ü▒Ü░▒░░▒░░▒░▒▒▓█████████▓▓█████████╟███▓▒Ü╬╠╬╠╬╠╬╬╬╬    //
//        ÜÜ░╠╬╠╬╬╬╠╬╬╠╠╬╬╬╬╠╠╠╬╬╬╬╬ÜÜ░░░Ü░ÜÜ░░▒▓▓████████╬╬╬█▓█████████████████╬╬╬╬╠╠╬╠╬╬    //
//        Ü░░╠╬╠╬╠╬╬╠╠╠╠╠╠╬╠╠╠╠╬╬╬╬╬ÜÜ░░░░░░░Ü▒▓█████╬ÜÉÜÜ░░░╚╚╚╠╬██████╣█████████╢╠╬╠╬╬╠╬    //
//        ▒░░╠╬╬╬╬╬╬╠╠╠╬╠╠╠╠╬╬╬╬╬╬╬Ü▒░░░▒░░░╔██████ÑÜÜ░░░░░░░░░░╠╠╠╬▓█▓██╬╬████████╬╬╬╬╠╬╬    //
//        ÜÜ░╠╬╠╬╬╬░▒▒╠╬╬╠╠╬╬╬╬╬╬╬▒▒▒░░░░░░▓██████»░Ü░░░░░░░░░░░░╠╠╠╬██▓███╬████████╬╬╬╠╠╬    //
//        ÜÜÜ╠╬╬╬╠Ü▒░Ü╠╠╬╠╬╬╬╬╬╬╬╠▒░▒░░░░Ü╬█████▌░░░░░░░░░░░░░░░Ü╚╠╠▓▓▓█▓██╣█████████▓╬╠╠╬    //
//        ▒░░[╠Ü░▒░░╠░▒╠╬╠╬╬╬╬╬Ü▒╬░░░░░▒Ü░╫▓████`░░░»»░░▒░░Ü░░░░░╠╠▓███▓██╣╬▓╣█████████╬╬╬    //
//        ░Ü░░╠░╬░Ü░░░╠╬╬╬╬╬╬╬╬▒░░░░░░░░░╬╣▓███░░░░»»░░░░░Ü░▒▄▄▄▄╬╣▓█╬╠█████████████████╬╬    //
//        Ü░`░░ÜÜ░░░▒░╠╬╬╬╬▒╬╬▒░▒░░░░░ÜÜ░╣╬╣▓▒░»░Å@░░░░░»░▒╬╠╬Ñ╠╬╠███▒╣╣██████████████████    //
//        Ü░`░░▒▒Ü▒░░▒╠╠╠╬╬╬╬╬╠▒▒░░░░░░░¢▒╢████▓RÜ░Ü░▒▐▒▓▓╬╣▓▒▓▓▓▓╬Ö██████████████████████    //
//        Ü░░░╠▒▒░░░░░╠╬╬╠╬╬╬╬╬╬▒▒░░░░░░╣╣╣████Ü╚╠░▒░░╟╬▓╣╬ÑÜ╬╬╠╫█▓╬╬█▓███████████████████    //
//        ▒Ü░░▒░▒▒░░░░╠╬╬╬╬╬╬╬╬╬▒▒░░░░░░╠╬╣███"```/_░╠╣╬╬╬ÜÜ░╚╙╙╚ÜÑ╠╢▓███████████╣████████    //
//        ÜÜ░░╠▒▒▒▒▒▒▒╠╠╠╠╬╬╬╬╬╠▒░░░░░░░░Ü╣██U__.⌐ ░╠╣▓╬Ñ▒░░░░░░;Ñ╠╠▓████████╣███╬████████    //
//        ▒░░░╠╠╬▒▒╠▒▒╠╠╬╬╬╬╬╬╬╬▒░░Ü░░░░░░╠█╣H    ░╠╬╬╠╣█░└^^[email protected]░╬╬╣▓▓███████╬╟███╬█▓██████    //
//        ▒Ü░░╠╠▒▒Ü▒▒░╠╬╬╠╬╬╬╬╬╬╬░░░░░░Ü░╠╠▓▓▌   `Ü╚▓██╬▀Ü░»░░░╠╠╣▓████████╣▓█╣██▓▓███████    //
//        Ü░░░╠╬╬╬▒▒Ü░▒╠╬╠╠╬╬╬╬╬╬▒░░░ÜÜ░╬╠▓███▌   _`_`░░░░░░░▒╠╣▓█████████╬█╣█╣██╣████████    //
//        ╬Ü░░╠╬╬╬▒▒▒░░╠╬╬╬╬╬╬╬╬╬▒▒░░Ü░Ü/╟▓███╢⌐=▒▒▒▒▓▓▓▒▒░╠▒╬╠▓████████╬╬╣▓╬╣╠█▒▓█▓▓█████    //
//        ╬Ü░░╠╬╬▒▒╠▒░▒╠╠╠╠╬╬╬╬╬╬▒▒Ü░»Ä╡▒╫▓╣██╬█░░░^░╟╟╣╬╬╠╬▒╠╢▓▓█████▓╬▒▓█▓▓╬▓█╟██▓██████    //
//        ╬░░░╠╬╬╬╬╬Ü▒╬╠╠╠╠╬╬╬╬╬╬╬▒░Ü░╬▒Ü╟╣██▌╣╬H`╙╙╩╬╬╬╬╬╢╠╬╬╣▓██████▓╣▓███╬╣█╬▓██▓▓█████    //
//        ╬Ü░░╠╬╠╬╬╬▒▒╠╠╠╬╠╠╬╬╬╬╬╬▒▒░░Ü╬╬▒╣╬▓▓▒╬█   ``│]╚╠╠╬╣▓▓███████████▓█╣█╣╣██╬╬╬█████    //
//        ╬▒░░╠╬╬╬╬╬▒▒╠╠╬╠╠╠╬╬╬╬╬╬▒Ü▒▒▒║H▒▒╣╣╣▓▓▓█,_░░░▒╠╣▓▓▓████████▓██╣▓▓█╬╣███▓█╬██████    //
//        Ü░░░╠╬╬╬╬╬╬╬╠╠╠╠╠╠╬╬╬╬╠▒▒▓▄▄▄▒╠╬▓╬╢█╬█▓████████╣██████████▓╣▓█████╣████╬╬███████    //
//        ░░░░╠╬╬╬╬╬╬▒╠╠╠╬╠╠╣██▓▀▀▀╜▀▀█▀▀▀╜╩╩╠▓██████████╬╬╣████▓██Ä╫██╣╣▓█▓▓█▓▓██╬╬╟█████    //
//        ░Ü░░╠╠╬╬╬╬▒╠▒╠╬╬╬╬╬╠▌╬╦▄▄▄▄▒▒▒░░░░╙╙╙╙╙╙╙╙▀Ñ╬██▓▒╠▒╠╠╠╬╠Ü╟█▓█╣╠████╣█╬▓Ñ╠╬╣█████    //
//        ░░░░╚╠╬╬╬▒╠╠▒╠▒██▄▄▒▒╠╠╠███████████▓╬╬╬╬╣▓▓▓██▀█▒▒░╠╠▒ÖÜ╬▓█▓▓Ñ╢▓██╫▓█▓╠╠▒╟▓█████    //
//        ░░░»|╠╬╬╬╬╬╬╬╣████Ü░╠╠╬╠█████████████╣╣╬╣▓██████╣█████▓▓▓▓╬╬╠Ü╠╬╣███╫██╬╣▓▓█████    //
//        ░░`»░╠╬╬╬╬╬╬╠████▒╬╣▓▓▓▓╬█████████████▓▓█████████████╬▓▓█╣▓█████╬███████▓█▓█████    //
//        ░░``░╠╠╬╬╬╬╠╟███▒▒╠╠╬▓▓╬╬▓██████████████▒╓╠▓████████████╣▒╫███╣▓███████▓██╬╬╬╣██    //
//        Ü`  ░╠╠╬╬╠╬╬╟███╬╬╬╬╠╬╠╬╠███████████Üµ╟▓█████████████████▓█████████████▓█████▓╬▓    //
//        ░░  :╠╠╬╬╬╬╬╠████╣╣▓╣╬╬╣▓██████████▓▓▓████████████████████████████████████████▓╬    //
//        ░_   ░╠╠╬╬╬╠╠╣█╙╩╬▒░░╠▓╬╣▓█████╬╬▓▓▓███▓█████████▓▓████████████████████▓██▓████╬    //
//        ░`   |╠╬╠╠╬╠╬╩»»_Ä`'╙╙╟█████╠╬╬╬╬╟██Ñ`╚╣██████████████████████████████▓▓╣█████╣╬    //
//        ░`   |╠╠╬╬╬╬Ü_» ╙  _░╔╬▓█╬Ñ»░╠Ü╠▓█▀░░░░╟████████▒╚Ü]╠█▓█████████████████╣█████╬╠    //
//        ▒░_  ░░╠╠╬╬Ü░░░  _µ╠╣╬▓██Ü  ░░╠█Ñ`_░░µ▓╬╚████████▒░░╟████▓▓█████████████▓█████▓╬    //
//        ██▒  :╚╚╠╬Ü░░»»» »╠░»░╙╙Ü»░░▒ÅÜ_:░╔▒▓█╩░░▄███████▓▓▓███████▓██████████████▓╣███╬    //
//        ██▒░╦▄▒▓▓▒Ö»░░__  `]░»∩`░»»`  _░▒╠╣╬╬▒▒▓████████╬╣▀█████▓╫╣███████████████▓╬▓█▓█    //
//        ███▓▓▓█▓▓Ü░_░░░░░»µ░░` ``  __░µ╣╩ÑÜ░╠╣█████████Ñ╠▓▄▒╙███╬▓█████████▓███████╠╫███    //
//        ▓▓██████▒░░░░░]Ü»░»╙Ü     »░░░ÜÜ░░╔╣╣██████████░╟█╬╬▓█▓╬╬▓████████████████╬╣▓██╬    //
//        ░░░]Ü╚░╠▒░▒░░Ü░» _  _      `░░░░╠╬╬╬╠╟████████╬╬▓▒Ü╠╬╣▓╬╠▓███████████████▓╬╟██▒╬    //
//        ░░Ü░░░║╬Ü░░Ü░░░░»░░░_ »░░ _░░░░╚╠╬╠╠╬╫█████╬╬█╠▓█Ü░░╣▓╬╬╠╬███████████████╬╬╟▓▓╬╠    //
//        Ü▒░░▒╠╣╬▒▒░░╠Ü░]░░░░░░░:_░░░░░░░▒╬╠███████▓█╬Ü╣█Ü░░░╬▓╬╬Ü╠╟▓█▓██╬╣▓█╬▓███╬╬╟▓╬╬╬    //
//        ░╠╬╠╠╬╬╬╬░░╬▒░µÜ░░░░░░░░░▒Ü░░▒░▒▓╬╬╩╬╣████╬Ü╬╠▓Ñ░░░í▒▓╬Ü▒╠╠╣▓▓▓╬╬╣▓▓╬╣▓██▓▓█▓╬╠╠    //
//        ╬╬╬╬╬╬╠▒╠╠▒Ü▒▒╠▒▒░░░▒▒▒╬▒▒▒▒Ä╩Ü╟╬╠╠╠╠╠█▌╠▒╚╬╬╣▓░Ü░░╚D╚╬╠░Ü╬╬╣██╣╣╬╣╬╠╬╣▓██╬╣╠╬╬╬    //
//        ╬╬╬╬╬▓╬▓▒╬╠╠╬╠Ü▒▒╠╠╬╠Ü╬╠╠RÑ╚ÜÜ░╠╬▒░▒░╠█▌░Ü▒╠▓█Ü░ÜÜÜ░░░╠▒Ü╠╬╟╣██╬╣╬╬╬╣╣╬╣█╬▓╬╠╠╠╬    //
//        ╬╣▓▓██▓▓▓█▓▓╬╣╬╬▒▒╬╬░░╠╬Ü░░░░░░╠╠▒░╬░╟██░Ü╠╣▓▒░░░░░░╠Ü░Ü╠╬╠╬╠╣█╣╬╬╬╬╬╠╬╣╣╬╠╬╠╬╣╬    //
//                                                                                            //
//    ---                                                                                     //
//    asciiart.club                                                                           //
//                                                                                            //
//                                                                                            //
//                                                                                            //
////////////////////////////////////////////////////////////////////////////////////////////////


contract JAX is ERC721Creator {
    constructor() ERC721Creator("TheCollectadames", "JAX") {}
}