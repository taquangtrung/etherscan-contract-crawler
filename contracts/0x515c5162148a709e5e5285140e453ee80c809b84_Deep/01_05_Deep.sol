// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

/// @title: Deep Thought
/// @author: manifold.xyz

import "./ERC721Creator.sol";

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//                                                                                                                                                              //
//                                                                                                                                                              //
//    ......................................................................................................................................................    //
//    ......................................................................................................................................................    //
//    ......................................................................................................................................................    //
//    ......................................................................................................................................................    //
//    ................................................................................        ..............................................................    //
//    ............................................................................     .:^^^:. .............................................................    //
//    ......................................................................      ..^~!??JJ?7!:. ...........................................................    //
//    ..................................................................     .:^~!7?JJJJJJJ?77~:.. .........................................................    //
//    ............................................................      .:^~!7?JJJJJJJ??JJJJ?7!..:.. .......................................................    //
//    .......................................................      .:^~!7?JJJJJJJJJJJJJJJJJJJ?7^............................................................    //
//    ....................................................    ..^~!7?JJJJ???JJJJJJJJ?JJJJY5YJJ?!....... ....................................................    //
//    .................................................   .:^!7?JJJJ???J???JJJJJYJJJJJJJJJYYJJ?7^........ ..................................................    //
//    .............................................   ..^!?????JJJJ???JJ???JJJJJJJJ?JJJJJJJJJJJ7~.......... ................................................    //
//    ..........................................   .:~!?JYJ?????JJJ?????????J?JJJ???JJJJJJJJJJJ?7:..........................................................    //
//    ......................................    .^!7?JJJJJJJ???JJJ????????JJJ??JJJJ???JJJJJJJJJJ?~..........:.  ............................................    //
//    ..................................    .:^!????JJJJJ??J??JJJ???J???JJJJJ????JJJ?JJJJJJJJJJJ?!............:.  ..........................................    //
//    ...............................    .:~77??????????JJJJ??J?JJ??J????JJJJJ????JJ?JJJJJJJJJJJ?7^.............:. .........................................    //
//    .............................. ..^!7?????????????JJJ??JJJJJJ???JJJJJJJJJJ??JJJJJJJJJJJJJJJ?7!.........................................................    //
//    ..............................^!7??????????????J??JJ??JYYJJJJ???JJJ?????JJJJJ??JJJJJJJJJJJJ?7:............... ........................................    //
//    ............................ .7?????????????????JJYJJJJJYJJJJJ?????????JJJYJJ??JJJJJJJJJJJJ??~........................................................    //
//    ............................ .7?????????????????JJJJYJJJJ?JJJJJ?????JJJJJJJJJJ?JJJJJJJJJJJJJ?7:.......................................................    //
//    ............................. ~???????????????????JJ?JJYJJJYJYJJJJJJJJ?JJJJJJJJ?JJJJJJJJJJJYJ7^:......................................................    //
//    ............................. .7????????????????JJJJJJJ?JJJJJJ?JJJJ???J??J??JJJJJJJJJJJJJJJJY?~.......................................................    //
//    .............................. ^??J????????????JJJJJJJJJJJJ?????????J????J??JJ?JJJJJJJJJJJJJ5?!.......................................................    //
//    .............................. .!JJJJ???????????JJJJ????JJJJ???????J?J???JJ??JJ?JJJJJJJJJJJJ5Y?^................ .....................................    //
//    ............................... :??JJJ????????JJJ?J?????JJ????JJJ???J?????J???JJJJJJJJJJJJJJ5PJ~................ .....................................    //
//    ................................ ~?JJYJ?????????JJJJJJJ??J???JJJJJ??J?????JJJJ??JJJJJJJJJJJYYPY7:............... .....................................    //
//    ................................ .7JJJJ????????JJJ??J??JJ?JJJJJJJJJJ?JJ?J????JJJJJJJJJJJJJYYY5P?:................ ....................................    //
//    ................................. .?????????JJYYYJJ???????JJJJJJJJJJJJJJJJJ?JJJJJJJJJJJYJJJY55GJ!^:............:. ....................................    //
//    .................................. :??JJJJ?JYYYJJJJ????????JJ?J???????JJJ?JJJJJJJJJJJYYYYJY555G57~^:........:.^^. ....................................    //
//    ................................... ^?JYYJ??JJYJJJ?JJJJ?JJJJJJ?JJJJJJJ?JJ??JJJJJYYJJJYYYYY55PPPP7~^^........::^^. ....................................    //
//    ...................................  ~JYYJJJ?JJ????JJJJJYJJJJJJJJJJJJJ?JJJJJJJJJYYJJYYYY555PPPPGJ!~~:.......^^^^: ....................................    //
//    ....................................  ~JJ?J???????????JJJJJJJJJJ?JJ???JJJYJJJJJJJYYYYY55555PPPPGY7!~~^....::^^~~: ....................................    //
//    .....................................  ~???????????????J???JJJ?JJJ?JJJJJJYJJJJJJYYYYYY55PPPPPPPG5?7!~!!:..:^~~~~: ....................................    //
//    ...................................... .~????????????????J?J??????JJJJJJJJJJYYYYYYYY55555PPPPPPGPJ77!?GJ7^~~~~~~^ ....................................    //
//    ....................................... .~???????????????J???????????JJ?JJJJYYYYYYY555555PPPPPPGGY777?BP?!^~!!~!~ ....................................    //
//    ........................................ .~???JJ??????????????????JJJJ?JJJJJJYYY555555PPPPPPPPGBG5?77?BGJ?^~!!!!~.....................................    //
//    ......................................... .~??JJ??????????????????JJ??JJ?JJJJJYY5PPPPPPPPPG5PBBGGPJ??7GBY?7~!!!!~.....................................    //
//    .......................................... .~JJJ?????????????????JJJJJJJJJJJYY5P555PPPGPPPGGBBBB#B5JJJ#B5JJ!!777!. ...................................    //
//    ...........................................  !YJJJ????????????????JJ?JJJJJJY55Y?J5PGGGBGGBBBBBBGP555YP&PP5J?~???!. ...................................    //
//    ............................................  ~JJJ????????????JJJ???J?JJJJY55Y?7?5PGGGGBBGGPJ7!~~~~!JP#&#GJ7!!!~: ....................................    //
//    .............................................  ~???????????????JJJYYY55PP55PPPPPGGGGGGGPGBGGY~~~~~~75G&@B!^:..   .....................................    //
//    ..............................................  ~?????????JJJY555P5555YY5GGBBGP5YJ7!7YPPP##BB5!~~^^^5PGBJ      .......................................    //
//    ...............................................  ^?JJYY55555YYJJJYJJYY5555YJ7!~~~~~~~!?5GB#BBG?..   ?PGG5.    ........................................    //
//    ................................................  ^7Y5YJ????????7?77!!!!!~~~~~^^^^^~~~7P#&#G5Y7^^^:.^GGGG!^^:. .......................................    //
//    .................................................. .~!7!?YYYYYYP7^^^^^^::^^^^:^!7JYPPG#&###BBBBGGGGP5GGBBY!~!!: ......................................    //
//    ...................................................  ...~YGGGPB&P     .^!JGGGPG5JJYYY5PBGGBBBBGGGGPPPPGGBP~.^7!. .....................................    //
//    .....................................................   .:^^7YB&Y .. :7JJP#&&&B5JJYYYYPP55PPPP55555YYYPGBBJ:.!!: .....................................    //
//    ........................................................    [email protected]? . .7JJYB5GBBPYJJJJYY55YYY5Y55YYYYYYY5GGBP^.!7: .....................................    //
//    ........................................................... ~JB&!  .!?JJ5GYGBGPYJJJJY55Y55555555YYYYYY5GBBB?.!!. .....................................    //
//    ........................................................... ~Y#&^ .~7?J5P7!5GG5JJJY5GBB#####BBGPPPYJJJJ5BBBP:!~ ......................................    //
//    ..........................................................  ~5&#. ~?JYPP7~?JJ?JJJ55PGBB###BBBGP55YJJJJJ5PBBB7!!.......................................    //
//    ........................................................... ~5&G ^?J5GBY?JJJJJJYYYYY5PPPPP55555YYJ???JJY5BBB5!!. .....................................    //
//    ........................................................... !P&5:JYPBPY?JJJJJJJJJJJJYYYYYJYYYYYYYYYJJJYYYG#BB?!: .....................................    //
//    ..........................................................  !G&P?5GBPY5JJJJJYY5YYYYY555YYY5YYYY5555YYYY5P5#BBP7^: ....................................    //
//    ...................................                         7#@#GBB#GGPJYY5555PPPPPPPGGPP555YY555555YYY5GGB#BBJ~!^.  .................................    //
//    ..................................  ..::::::::::::::^^^^^^^^?555YYJYYJ?JJJJJYJJJJJJYYYYYYY5YYYYYYYYYYJJJJJ????~:^^...  ...............................    //
//    ...................................^7??J??JJJJJJJYYYYYYY555555555555PPPPPPPPPPPPPPGGGGGBBBBBGGGBGBBBBGP55555YYJ?77!~~^................................    //
//    ................                  ^J5GBBB############&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&@@&@&&&&&&&&&@&&&&&&&&&&#####GPP~              .................    //
//    ............     .^~~~~~~~~~~~~~~~7GB#BBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBGGBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBGGGGGGGGGG?~~~~^^^^^::::.   ..............    //
//    ........     .^!JY55555555P55555PPPPPPPGBB###GPPPPPPPPPPP555555P5555555GB####&GPP55555PPPPP5P5PPPPPPPPPP55P5555PP55YYYYY5YYYYYJJJJJJ?~:.   ...........    //
//    .....    .^!?Y5PP5555555555555555PPPPPGB##&#GPGPPPPPPPPPPPPPP55PPPPP5PGB#&&&@BPPPP555555PPPPPPPPPPPPPPP555PPPPPPPPP55YYYYYYYYYYYJJJJJJJ?~:.  .........    //
//    ...  .:!?YPPP5555555YY55YYY5555P5PPPPGB###GP5P5PPPPPPPPPPPPPPPPP55555PB###&&G5P55555PPPPPPPPPPPPPPPPPPPP5555PP5PPPPPP55YYYYYYYYYYJJJJJJYYJ?~. ........    //
//    .  :~?55555555555Y555555Y555555PPP55PGB#BPPP555PPPPPPPPPPPPPPP555555PGB##&&G55555555PPPPPGGPPPPP555PPP55PPPPPPPPPPPPPPP5YYYYYYYYJYYYJJ??7!~^. ........    //
//    .  ::::::::^^^^^^^^^^^^^^^~~~~~~!!~~~~^~777777777777?JJJJJJJJJJ?JJJJJJYYYYYJYYYYYYYYYYY55PPPP5PPPPPPPPPPPPPPGGGPPPPPPPPPP5YYYYJJ?!~~:...     .........    //
//    ...                                                              ...      ...........:::::::::^^^^^~^^~^~~~~~!!!!!!!!!!!!!!~^:..         .............    //
//    .......................................................                ...                                                        ....................    //
//    ......................................................................................................................................................    //
//    ......................................................................................................................................................    //
//    ......................................................................................................................................................    //
//    ......................................................................................................................................................    //
//                                                                                                                                                              //
//                                                                                                                                                              //
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


contract Deep is ERC721Creator {
    constructor() ERC721Creator("Deep Thought", "Deep") {}
}