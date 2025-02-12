// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

/// @title: humanzoo.disco
/// @author: manifold.xyz

import "./ERC721Creator.sol";

////////////////////////////////////////////////////////////////////////////////////////////////
//                                                                                            //
//                                                                                            //
//                                                                                            //
//        █████████████████╬▓██████████████████████████▀▓▓╢▀▀╝▓▓▓▓▓▓▓█████████████████████    //
//        ███████████████╟▓████████████████████████████▓▓▓█▓█▀▄╚╨▀▓▓▓█████████████████████    //
//        █████████████╬█████████████████████████████████▒▓█╬██╩▓▌▄▓▀▀▓███████████████████    //
//        ███████████▓▓████████████████████████████▓▓▓╢╫╫╫▓▀▓████╣╠ ╚▓▓███████████████████    //
//        ██████████▌███████████████████████████████████████▓███ ,;▄Θ▓▄▄▄╠▓███████████████    //
//        █████████▀█████████████████████████████████▓███▌╚╙╩╬╩▌╢╠▓╩╙╙╜█▀╙▀███████████████    //
//        ████████▌████████████████████████████████▓▓█╬█╬ƒ _ê  _╚╠▄╫▌▓▌▄╙φ$▓▓██▓██████████    //
//        ████████▓████████████████████████████████▓▀▒╬╙' _ _     ┘ "└╙Γ╙█▓▒▓▓▓█▓╬████████    //
//        ███████╟███████████████████████████████▀└/"░.∩=⌐   __  __  _[¼ⁿ_╝▄╩▓████▓▓██████    //
//        ██████▌██████████████████████████████▀│- _ ,"  _    _ └ _,~ƒ__ M)  ^▀████▓▓█████    //
//        ██████▒███████████████████▓▀╙╙┘╛░╬╠Γ-_   ,⌐  __    _ .-⌐  /.'_ ,└Γ░ «█████▓▓████    //
//        ██████▒█████████████████▀╩░░>¬τⁿ`_  __ -_  ,╙   ,╓╓∩    »░;',╩« Ü@▒░▒╬█████▌████    //
//        ██████▌██████████████▓╬╙)░░",,,..-_∩_ ⁿ_ ~é   ╗Å"    ╓#╙`.▄▄▄⌐`╓▓╩╬▀▒╬█████▓╫███    //
//        ███████╫████████████▒▒▌.▒▒╠▒░░≤░`'_ .▒"▒╣▄σΘ╙└  ,ç▄╣╠┘ _   _╓#╙└└│██▓▓██████╣███    //
//        ███████╬███████████╬▓╫▓▓▄╬╬╢▒░░φ╦▒▒φ╜╨╓╬╬╓╥╗▓▓╝▀╙╙_   _,▄▄▀▒│QQ▄▄▄▄█▌██▓▀███▓███    //
//        ████████▓█████████▓████▓╬╬╫╙╬╠╣╬╠╣╣╬╠╬╬╫ê╙└  __ ,,▄▄▓▓▀╩╙░∩¿>┴╜╩╬╬██▓█▓▓▓███▌███    //
//        ████████▓███████████▓╬╣╬▀╣╬╣µ╣▄▄╠╬▓▓╣▓▓▀▀▀▀▀▀╬▀╙▀╩╩╧╪▄▄▄▄╗╗▓▓▓▓█▓▓███▓▓█████▓███    //
//        ████████████████████▓▓╠▄███╫▌╟█▓▓▓╫█▀╬▒╙╩▀▀╗▄▄*≈G░░<»≥≥│╙╙Σ▒▒╠╬▓▓▓▀╙╬███████▓███    //
//        ███████████████████▓█▓▓▓▓▓█▓╢╚▓▓╬╬╬╠,░╬▀▓▄φ▒╠╬▓███▓▓▓▓▓▓▓▓▓▓▓████▓▒░φ╫███╙██╫███    //
//        ████████████████╬╣█▓███████▒╢▌╬▌╬╬╨╙"╚φ▒╫███▓▄▄▄▄▄▒╠╠╬▓▓████████▓▓████▓██║█▌▓███    //
//        ████████████████▓▓▓▓█████▓▓▓╣▓▒▓▓▒φ▒Æ╢▓╣█▓╬▓▓╫██████████▓███████████▓███▓▓█╟████    //
//        █████████████████▓▓▓▓╣▓▓▓█████▀██╬▓▓▓▄╣▓╠░;,_▐█▓▓█▌████████▓████████████▓█╣█████    //
//        ██████████████████▓▓▓▓██████████▓▓▓██▓╬▒╢╠▓▒░≥j╝███████▓████▓████████████╬██████    //
//        ███████████████████▓████████████████▓▓╠╩╟╚╙ε-.- ~▀█████████▓▓▓█▓████████╣███████    //
//        ███████████████████╚╣╫▌▒╣╬▓█▓███████▓╬╬╢▒▒≥╥µJ.'_░╠╣█████▓▓▓▓▓██▓██████▓████████    //
//        ███████████████▓▓╩^1╙╙⌠▒▄╣▓██████▓██▓▓╬╝╬▒▒░ε,┴▀▀╝m▐╠▓███▓██▓█████████▓█████████    //
//        ████████████████▌░#░φ╬╣╬▓▓▓██████╬╬╬╬╬█▓▄▒╡░░░░  └░Γ░╚╠▀▓███████████████████████    //
//        ████████████████╠╠▒▒╬╬██████████╣█╬╫╣▒╠╣╬╙▀▓▓▄░φ░░>░"¬=-`└╙█████████████████████    //
//        ████████████████▒╠╠╣█████████▓▌▌╫│█▓╠╠▒▒╠▓░░╙φ╙╚▓▓▄░²░┐░░░.._╙▀▓████████████████    //
//        ████████████████╬╬╣███████████╬╫╫»░██▓▒╠▒░▓▄░░ùφ░▐▒╙▀▓▄▄`ⁿ">.└"#╠▓██████████████    //
//        ████████████████╣█████████████▓╣╬░▒╫▓██▀▓▒░╬▌░░\Σ▒¼░░░╚╚▀▓▓▄╥  `╙Γ░╬▀███████████    //
//        ████████████████████████████████╣▌▓▓╬▌▓▌╬██▓▓▓▒░░⌠║▒Ü≈≈≤░._╙╬╙▓▓▓▄╖╙Ñ╠╬▓████████    //
//        █████████████████████████████████▓╣╣╬╬╬▓▓╬█████▓▓▄░┘░╨▀▒'"» '▒▄^╩▀╚▓▓▓╬╠╬▓██████    //
//        ███████████████████████████████████▓▓▓╬▓╬╬╬▓╬███╣███▄µ  »:»░,_`╠▄╚▒░╠╬██▌╬██████    //
//        █████████████████████████████▓███████▓▓▓╬▓▓▌╣█▓██╣█████▄,'░░░░,░╝▓╬╚▒╠▀╫╬╣╚╫████    //
//        █████████████████████████████▌██████████▓▓██▓╬█╬█▓╫███████▄░▒¼░≥░╬█▓▒╠╬▓▌µ╟▄▓███    //
//        ██████████████████████████████╣▓█████▌╣▓▓█████╣██▓▒███▓█╬███▓░╜▒╚░╟█µ▓▒▀▓╬▀╬▄╬▓█    //
//        ████████████████████████████████████▓╩╠╙╚╠▓▓███▓▓█▓╬▓██▌▄▄▄▀██▄╦╚▒▒█▒║▓▓▒╠╬▓▓╙╬█    //
//        ████████████████████████████████████╬╚░»░║╬▓╬╟╣███▓▓╬██████▒███▌╠╠║╫▌╬▓╬╢╙▓▓▓█╩▓    //
//        ███████████████████████████████████╚░░▒▒╢▓╡φ╬╬█▌▓████▓▓████╬████▌║╫╬█╬▓▓▀╣████▓▓    //
//        ███████████████████████▓████████▓╬▒▒▒╣▓▀╠▒╫╬▓▓▓╙╚░╚╠╬████████████▌▓╣█╬╬╬██▓██▒╙╫    //
//        ██████████████████▌████████████▓▓╬╬╬╠╬#╬╬╣▓█▀▒┌.ⁿ.⌂░╫█████████████╠╣▓█╬╠▓█▄▄▒╣▓█    //
//        ██████████████████▒█████████████▓▓▓╣▓╣╬▓▓▓╬╬ê"∩~^≥╔└░╬████████████╫▌██▓╬╣███▓███    //
//        █████████████████████████████████▓╫▓▓███▓╬╬▓╬▒╣╝δ░▒╡Å╬╬██████████▌█▓╫█▓╬╬█████▓█    //
//        █████████████████████████████████▓██████▓╣╬╬▓▓╣░;░,φ░╠╣█████████▌▓██╣██╬╣███████    //
//        ███████████████████████████▓▓█▓▓█▓█▓▓╬╬╫╚╠▀╬▒ε]░Ü░ΣΘ▒Σ▓▓███████╬████╣██╬╣▓██╠███    //
//        ██████████████████████████╬██▓███╬╣╢▓╣╠▒^╚╠▒╚▒▒╠▒τφ╠φ▒╣▓╬▓█▀╬▓██████▌█▓██▓██████    //
//        ███████████████████████████╣▓██╣▓╬╬╟▀▓╟░░,░≥▒╙╠╚╫▌▒╬▒▒▓▓▓███████████╬█▓████████╣    //
//        ██████████████████████████╬██╬▓▓▓╬╙╬╣╬╬#▒░\░▒╠╬╬╠╬█▄╚╚╬███████╬█████╣▓██╣▀████╫█    //
//        █████████████████████████████████▓╣▓▓▓█▒╣░╙▒▒╠╬╬╬╫╬██▄╠╠████████████╣████▓█▀╠▓██    //
//        █████████████████████████▓█████████▓▓██▌▓▌▒╙╟▒╬╬╬╬╬████╬╠╬▓████████████▀▀▄▓█▓███    //
//        █████████████████████████▓██╬▒[╚╠███████╠╬▒╟░╚╠╣╬╬█╬╫█▀██╬▓╬╬▀█████▀╙▄▓███▌╓▓███    //
//        ██████████████████████▓███╫▄╫╬µ▄╫╬╬██████▒╟▒╫▓▒╠╬╬▓█╬╣▓╣███▌╗▒╠╬▄▄▓██▀▀▀▓███████    //
//        █████████████████████▓█▓╬░░╚╚└▐╠╠╢▓██▓╠███▒╢▌╬█▓▒╬╣█▓█▓██████▓╩╜`,╓▄▓╬╩╙;╦╫▀████    //
//        ▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀╙╙""""╙╙╙╙▀▀▀▀╙▀▀▀╙╙╙╙▀▀╙╙▀▀▀▀▀▀▀▀▀╙'^"¬╙╙╙"▀▀╙╙"""╙╙▀▀    //
//                                                                                            //
//                                                                                            //
//                                                                                            //
//                                                                                            //
////////////////////////////////////////////////////////////////////////////////////////////////


contract HZD is ERC721Creator {
    constructor() ERC721Creator("humanzoo.disco", "HZD") {}
}