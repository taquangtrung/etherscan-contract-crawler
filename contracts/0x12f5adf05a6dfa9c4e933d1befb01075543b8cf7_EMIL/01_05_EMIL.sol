// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

/// @title: emils.eth
/// @author: manifold.xyz

import "./ERC721Creator.sol";

////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//                                                                                                            //
//                                                                                                            //
//                                                                                                            //
//    #E~^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^J~:!7!^!~^^^^^^^^^^^^^^^^^~!!~~~!!~^^^^^^^^^^^^^^^^^^^^^^^^^~E#    //
//    ~^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^~?.75JJ?^7!^^^^^^^^^^^^^~!!~~~~!77!7~^^^^^^^^^^^^^^^^^^^^^^^^^^~    //
//    ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^7!~YPJ?J?:?~^^^^^^^^^^~77~~7?JYJ7~^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^    //
//    ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^?~?YPJ??J7^?^^^^^^^^^7?~!?JJJ?~^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^    //
//    ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^?~Y5GJ?JJY~?~^^^^^^~?7~JJJJ?!^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^    //
//    ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^J~Y5GY?JYJ77!^^^^^~J7!YYYJ7~^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^    //
//    ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^J~Y5G5?JYJ77~^^^^!J!~YY5J!~^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^    //
//    ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^?77PPGJJ5Y!?^^^^~J!^Y55J!^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^    //
//    ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^~Y^55GYJPY~?^^^~J!^YG57~^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^    //
//    ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^J7!PPPJP?!7^^^?7^JGJ!~^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^    //
//    ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^~Y!75P5P!7~^^~?~~57~^^^^^~!!^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^    //
//    ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^~Y7!YP5~7^^^?Y7JJ??JJJY5GGPPY^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^    //
//    ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^??~7!~JJ5PGGGGGGGGGGGGGGGGGY~^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^    //
//    ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^~~!!~^^^^^^^!J7JPGGGGGGGGGGGGGGGGGG5Y5GP7^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^    //
//    ^^^^^^^^^^^^^^^^^^^^^^^^^^^!YGBBBBGJ^^^!7JPGGGGG5?7!!!!77JY5PY7~^^~GGJ^~~!!~^^^^^^^^^^^^^^^^^^^^^^^^    //
//    ^^^^^^^^^^^^^^^^^^^^^^^^^^7GBPJ???YGG??J5GGGGPJ~^^~!7????~^~?!~!7!~PGY5GGGBGY^^^^^^^^^^^^^^^^^^^^^^^    //
//    ^^^^^^^^^^^^^^^^^^^^^^^^^[email protected]~^^!?J?????Y^^^YJ??Y7~GBPYJ?77GBJ^^^^^^^^^^^^^^^^^^^^^^    //
//    ^^^^^^^^^^^^^^^^^^^^^^^^7GG5~~~^^!7!!YBGGGGY^^!JJ??JJJJ?Y7:!5?JJJY?G?!~!7~^YB5^^^^^^^^^^^^^^^^^^^^^^    //
//    ^^^^^^^^^^^^^^^^^^^^^^^^PGBJ^^^^7!^^^^5GGGBY:^7YJJ7?YYYYPY?55JYYJJP!^^^~?:!GB?^^^^^^^^^^^^^^^^^^^^^^    //
//    ^^^^^^^^^^^^^^^^^^^^^^^^5GBY^^^~?^^^^^JGGGGBY7~~!77777JYJ??J5J?77YY^^^^7~?GGJ^^^^^^^^^^^^^^^^^^^^^^^    //
//    ^^^^^^^^^^^^^^^^^^^^^^^^!GGG7^^^!~^^~!?GGGGGBBBG!7JPP5?7~^^~Y7JPPJ~J~~~75G5!^^^^^^^^^^^^^^^^^^^^^^^^    //
//    ^^^^^^^^^^^^^^^^^^^^^^^^^!PGGJ~^^^^~!~YBGGGGGGGP??YGBBPJJ!^7YJYPP5Y5~75GY!^^^^^^^^^^^^^^^^^^^^^^^^^^    //
//    ^^^^^^^^^^^^^^^^^^^^^^^^^^~YGGGPYYYY5G&GGGGGGGGGGBBY?7~^^!^J7^^!7PGBPPJ~^^^^^^^^^^^^^^^^^^^^^^^^^^^^    //
//    ^^^^^^^^^^^^^^^^^^^^^^^^^^^^~!7??????!5GGGGGGGGGG5~^^~!!^^^?!^^~^~PB7^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^    //
//    ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^GGGGGGGGGG5~~~~~~~~~^!J^!~!!7G!^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^    //
//    ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^?GGGGGGGGGY7!77!!77!?!!YJ7!!77JJ^^^^^^^^^^~~^^^^^^^^^^^^^^^^^^^    //
//    ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^5GGGGGGGGJ!777!?!77?77??Y??!777?J^^^^^^^^^~J^^^^^^^^^^^^^^^^^^^    //
//    ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^~BBGGGGGGY!?77?!7!?!777!?7Y777!7!J?^^^^^^^~57^^^^^^^^^^^^^^^^^^^    //
//    ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^7YBBBBGBY77!7!7!?777!77!7?JY7?7777Y~^^^^^^JY^^^^^^^^^^^^^^^^^^^^    //
//    ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^!^5&G##BJ!77!7!7!77!7!77777YY7?7775!^^^^^^~7!?~^^^^^^^^^^^^^^^^^    //
//    ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^YBB#&#P!7!77!7!77!777!7!?!PJ77?Y5^^^^^^^^^^5!^^^^^^^^^^^^^^^^^    //
//    ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^5GGBBBBGJ7?777777?7777?J775J???J7^^^^^^^~7JY~^^^^^^^^^^^^^^^^^    //
//    ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^PGGGGGGB##BPYYJJ????7777?JJYYPBG7^^^^^^?GY!^^^^^^^^^^^^^^^^^^^    //
//    ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^~GGGGGGGGGG#&&&BJ????JJ?????7777P557^^^^!5P7^^^^^^^^^^^^^^^^^^^    //
//    ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^:7BGGGGGGGGGGGGBB~^^^^^^^^^^^^^^^~Y#G57^~!!Y5^^^^^^^^^^^^^^^^^^^    //
//    ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^~?GGGGGGGGGGGGGGGGJ^^^^^^^^^^^^^^^^^7BGG55YPGPY^^^^^^^^^^^^^^^^^^    //
//    ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^~?5BGGGGGGGGGGGGGGGGG?~^^^^^^^^^^^^^^^^~5PBYYGPPG~^^^^^^^^^^^^^^^^^    //
//    ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^~?5YGGGGGGGGGGGGGGGGGGGGG5?!^^^^^^^^^^^^^^~YG5GGGB5^^^^^^^^^^^^^^^^^^    //
//    ^^^^^^^^^^^^^^^^^^^^^^^^^^^~!?J5PYY5BBGGGGGGGGGGGGGGGGGGBG5Y?!~^^^^^^^^^^^^?5PPPY~^^^^^^^^^^^^^^^^^^    //
//    ^^^^^^^^^^^^^^^^^^^^^^~!?YYYJJP5Y5PYY5GGGGGGGGGGGGGGGGGGGGBPPP5YJ7~^^^^^^^^^^~~^^^^^^^^^^^^^^^^^^^^^    //
//    ^^^^^^^^^^^^^^^^^^^^?YJ555YYYP555PPPPY5PGGGGGGGGGGGGGGGGGGGB5PP5Y5P~^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^    //
//    ^^^^^^^^^^^^^^^^^^^?5PYYYYYY5J55YYYPGJJYGBGGGBBGGGGGGGGGGBBBPY5YY5PJ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^    //
//    ^^^^^^^^^^^^^^^^^^?YJ555YYYYYYYYYYYPGP5YP5JPJ5#BBGGGGGGGBGY55YP5YYY5!^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^    //
//    ^^^^^^^^^^^^^^^^^JY?J5YYYYYYYYYYYYYYY5PP5PYP5PGPBBBBBGGGGP!P5YPY5YY5Y^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^    //
//    ^^^^^^^^^^^^^^^^7PJY5555JYYPPYYYYYYYYPPPY5PGGPPG5?7YPBGBJ!YPPP5YY5P55!^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^    //
//    ~^^^^^^^^^^^^^^~YYJYP555Y5Y5555YYYY5PYYP5Y555YJYYPY?!!??^!5YYG5Y5G5PP?^^^^^^^^^^^^^^^^^^^^^^^^^^^^^~    //
//    #E~^^^^^^^^^^^^?5YYYPYJY5??5YYB55YYY7!JPP55PPP5YY5Y555JJ7J5?JYY5?GPP5Y^^^^^^^^^^^^^^^^^^^^^^^^^^^~E#    //
//                                                                                                            //
//                                                                                                            //
////////////////////////////////////////////////////////////////////////////////////////////////////////////////


contract EMIL is ERC721Creator {
    constructor() ERC721Creator("emils.eth", "EMIL") {}
}