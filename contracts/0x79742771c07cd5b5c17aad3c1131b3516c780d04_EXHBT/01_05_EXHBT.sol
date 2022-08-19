// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

/// @title: EXHIBIT E
/// @author: manifold.xyz

import "./ERC721Creator.sol";

////////////////////////////////////////////////////////////////////////////////////////////////
//                                                                                            //
//                                                                                            //
//                                                                                            //
//        ▓██▓▓▓▓▓╬╣╬╬╫████████████████▓╬╣▒φ▌╓▒▓▓╠▓▓▒║▓j╬▒╬╬╝ ]╩  ▓████████████▓▓█╬▓╬╣╬▓╬╬    //
//        ██▓█▓▓▓▓▓╬╣█████████████████╬╬╣╬▒░φ▓▓▓▓╬▓▓▒▐▓░▒╫╟▒░  φ  ╣████████▓████▓▓▓▓█▓╣▓╣╬    //
//        ██████▓▓▓▓╬╬╣██████████████▓▓▓▒░░╙▓███▓▓▓▓▒░▓▒╠╟╬╩,^∩Å .▄▓█████████████▓█▓█▓╣▓▓╣    //
//        ████▓█▓▓▓▓▓▓▓▓██████████████▓╬▒▒░ ▓████╬▓▓▓╣╣▒░╨φ░░▒░⌐  ╙╬╣████████████████▓▓▓▓▓    //
//        ╫████████▓▓▓▓▓╬╬╬███████████╬▒▒∩░▄██████▓▓▓╬▓▀  φ░░╩   ╚«╙╚╬╬╬ ╠╣▓▓▓▓▓█████▓▓▓▓╬    //
//        ░████████▓▓▓▓▓╬╣╣╣▓█████████▓▒▒▒▐████████▓▓╬   ]╠╠╙         ╚╠,╚╠▓▓▓▓▓▓██████▓▓╬    //
//        ░╟████████▓▓▓▓▓▓╬╬╬╣████████▒▒▒▓▓█████████╬╬   ╠▒░ .         ╠^╠╬▓▓▓▓▓▓▓▓█████▓▓    //
//        ▒▓███████████▓▓▓▓▓▓▓▓██████▓▒▄▓▓▓▓███████▓╬▒φ,  ╚░φφ «░[░    ▓╬╬╬▓╬▓▓▓▓▓▓▓▓████▓    //
//        ╟█████████████▓▓▓▓▓▓▓▓█████▓▓▓▓▓▓▓▓███████▒▒╙   ]╬╬╬▒ ╙╠▒░░  ╟▓▓╬╬╬╣╬▓▓▓▓▓▓▓▓▓██    //
//        ██████████████▓▓▓▓▓▓▓▓▓╣╬╣╬╣▓▓▓▓▓▓▓▓█████▓╩      ║╣╬╠╬∩╠╠b░  j╣▓▓▓▓▓▓▓▓╣▓▓▓▓▓▓╬▓    //
//        ███████████████▓▓▓▓▓▓╠░╟▓▓▓▓▓▓▓▓▓▓▓▓▓████╨      φ░╠╬▒╠╬▒╠▒∩░ j▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓    //
//        ████████████████▓▓▓▀░░░╣▓▓▓▓▓▓▓▓▓▓▓▓▓▓██▒     ,φ░░░╠╬╬╬▒╬╬▒   ╬▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓██    //
//        ██████████████████╬░░░▓▓▓▓▓▓▓▓▓▓▓▓▓▓█▓█▒▒≥⌐ φφ▒░░░░░╠╬▓╬▓╬╬  j╬▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓█    //
//        █████████████████╬▒░░▓▓▓█▓▓▓▓▓▓▓▓▓▓▓▓█▓▒░▒ ]░░░░░▒╠░░╫╬▓╬╣▒  ╣╬▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓    //
//        ████████████████╬╬╩╟▓▓▓▓▓██▓▓▓▓█▓▓▓▓██╬▒╙, ╠░░░░░░▒▒░╟╣▓▓▓ ,φ╫╣▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓    //
//        ███████████████▓╬▒▄▓▓▓▓▓▓▓████▓▓██▓▓█╬▒▒╔φφ▒▒░░▒▒▒╬▒▒╠╣▓▓▒;╠▒░║╬▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓    //
//        ████████████████████████████████████████████████████████████████████████████████    //
//        ████████████████████████████████████████████████████████████████████████████████    //
//        ████████████████████████████████████████████████████████████████████████████████    //
//        ████████████████████████████████████████████████████████████████████████████████    //
//        ███████████▀▀▀▀▀███▀▀▀████▀████▀▀████████▀███▀███▀▀▀▀▀██▀▀▀▀████▀▀▀▀████████████    //
//        ██████████▌ ╔▄▄▄██  ▄▄╕ ╟█ j█  ▄▄╖ ╟████  █` ▄██  ▄▄▄▄█▌ ╔▄▄  █▌ &▄▄  ██████████    //
//        ██████████▌ ,,,,██     ─██ j█ ▐█████████    ▀███  ,,,▐█▌     4█▌     #██████████    //
//        ██████████▌ ╙▀▀▀▀█  ██▌ ╫█ j█  ▀▀▀ ╫████  █▌  ██  ▀▀▀▀█▌ ╫██  █▌ ╫██  ██████████    //
//        ███████████▓▓▓▓▓███▓███▓██▓████▓▄▓███████▓███▓▓██▓▓▓▓▓██▓████▓██▓███▓▓██████████    //
//        ████████████████████████████████████████████████████████████████████████████████    //
//        ████████████████████████████████████████████████████████████████████████████████    //
//        ████████████████████████████████████████████████████████████████████████████████    //
//        ████████████████████████████████████████████████████████████████████████████████    //
//        ███████████████████████████████████████████████████████▀▀▀▀██████████████▀▀█████    //
//        ██████████▓███▓███▓▓▓▓▓█▓▓████▓▓▓╬▓╣╬╬▓▓▓▓▓▓▓▓╣▓▓╬╣██▓▒▒╬╬╠╬╬╣╣╬╬▓▓╬╬▓█▓╠▒░▓▓▓▓█    //
//        ███████████▓█▓██▓▓▓██▓▓▓▓╣▓▓▓▓███▓╬╣▓╣▓▓▓▓███▓▓▓▓▓▓▓▓╬╬╬╬╬╬╬╬╬▓▓▓▓▓▓╣▓█╬╬▒░╣▓▓▓▓    //
//        ███████▓██▓▓████▓▓▓╬╬▓▓▓▓▓▓▓██████▓╬╬▓███████████▓╬╬╬▓╬╬╬╣▓╣╬╬╫▓▓▓▓▓▓╬╬╬░░╟▓▓▓▓▓    //
//        ██████▓▓█████▓▓▓▓▓▓▓▓▓▓▓▓▓▓█▓████▓▓╬╬▓█████████▓╣▓▓╬▓▓╬╣╬╣▓▓╬▓╬▓██▓▓╬╬╬░░▒╣▓▓▓▓▓    //
//        ███████████▓▓╬▓▓▓▓▓▓▓▓▓█▓▓████▓▓▓▓▓▓╬╣████████▓▓▓▓▓╣▓╬╬╬╬╬▓▓╣╬╬▓██▓╬╬╬╬▒░║▓▓▓▓▓▓    //
//        ███████████▓▓▓▓▓▓▓▓▓▓▓▓▓███▓▓▓▓▓▓▓▓╬╣╬▓████████▓▓█▓▓▓▓▓▓▓▓▓▓▓╬╣╬██▓▓▓╣╬▒╣▓▓▓▓▓▓▓    //
//        ██████████████▓▓▓▓▓▓▓▓▓██▓▓▓▓▓╬╣▓▓▓▓▓╬╬▓██████████▓█▓▓▓▓▓▓▓▓▓▓▓▓█▓▓╬╬╬▒▒╟▓▓▓▓▓▓▓    //
//        ███████████████▓▓▓▓▓▓██╬╬╬╬╬╣▓▓╬╣▓▓▓▓▓▓╬╣█████▓█████▓▓▓▓▓▓╬▓▓▓▓╬╬╬╬╬╬╬╬╬╬▓▓▓▓▓▓▓    //
//        ███████████████▓▓▓▓█▓╬╬╬╬╬▓▓▓╬╣╣╬╬╣▓▓╬╬▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓╬╣╬╬╬╬╬╬╬╣╬╬╬╬╬╬╣▓▓▓▓▓▓    //
//        ██████████████████▓╬╬╬╬╬╬╣╬╬╬▓▓▓╬╣▓▓▓▓▓▓▓▓▓▓██▓▓▓▓▓▓▓▓▓╬╣▓╣▓╬╬╬╣╬╬╬╬╬╬╬╬╬╬╬╬▓▓▓▓    //
//        ████████████████▓╬╬╬╬╣▓╣▓╣╬╬╣╬▓▓▓╬╣╣╬╣▓▓▓██▓██████▓▓▓▓▓▓▓▓▓▓▓╣▓▓▓╣╬╬╬╬╬╬╬╬╬╬╬╣▓▓    //
//        ███████████████╬╬╬╣╬╣╣▓╬╣▓╣╣╣▓╬╣╬▓╬╬╬▓▓███████████▓▓▓▓▓▓▓▓▓▓▓▓▓╬╬╬╬╣╬╬╬╬╬╬╬╬╬╬╬▓    //
//        ████████▓▓█████▓▓▓▓▓▓▓▓▓▓▓▓╬╬╬╣▓▓▓╬╬╬╣▓▓▓▓█████████▓▓▓▓▓▓▓▓╬╬╬▓╬╣▓╬╬╬╬╬╬╬╬╬╬╬╬╬╬    //
//        █████▓▓▓▓▓▓▓▓███▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓╬╬╣▓╬╣╬╣▓▓▓▓╬╣▓████████▓▓▓▓╬╬╬╬╬▓╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬    //
//        ███▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓█▓▓▓▓▓▓╬╬╬╣▓▓▓▓╬▓╬▓╬╬▓▓▓▓╣╬╬╬╬▓▓▓▓▓▓▓▓▓╬╬╬╬╬╣╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬╬    //
//                                                                                            //
//                                                                                            //
//                                                                                            //
//                                                                                            //
////////////////////////////////////////////////////////////////////////////////////////////////


contract EXHBT is ERC721Creator {
    constructor() ERC721Creator("EXHIBIT E", "EXHBT") {}
}