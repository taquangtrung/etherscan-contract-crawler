// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

/// @title: NEW HERE: X Marks the Spot Solutionists
/// @author: manifold.xyz

import "./ERC721Creator.sol";

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//                                                                                                                                                                                                                                                                                                                                                                                                                        //
//                                                                                                                                                                                                                                                                                                                                                                                                                        //
//    .....:......................................................:..:............:::::...........................................:....::.:..::::.....:.............::::......::...........:::.............::...................................................::.................................:.:.......:.::.....:...:::.:.:::::......:::::::::::::::::......:.::.::::::.::::::::::::::...:...:::.:.::::::..::...    //
//    ..............................................:.............:.............................................::...........::...:::..::::...::....::..:::.....:::.............:...........................::..............................:....................:......:..........:::.............:::...::....::.:..:.::::.:::::::::...........:.:::::.::.:::::::.:::::.:::::::::::::..:.:..:.:::::...:::::::::....::    //
//    :...:::...:......::...........::......::..::..:................::...................................::......:.......:..::::::...::::..::::......:.::::......::...:.:......:...:::............:.:.:::....:.............................:........::.....:::::::.........:.................::...:::.::....::::::::::::::::::...:.::......^~::::::::::::::::::::::::::::::::::::::::.::..:.....::......:....:...::..    //
//    ::::::::...........::...........:::..................:.......:.::..................:......................:.....::::::.:::.....:::::...:..::::::.::.::::.....::..::.:.:........::.................:::..:...........::.............................:....::::::...........................::..:::::....:...:....:::...::..................:......^:....:.::.:::::::::::::::::::::^^:~~^:^~~^^!~!~~^!~^!77!~!!:::::    //
//    ::::::.::..:...................::...::...:::.....::..:::.....:......:.....:....::....::.........:..::::::::...::::::::..:::....:::::...:::::::::.:::::.......::..:::.::.:...::....:..............::::.::..............................................................................::::.::..::::^!~~!~~~::~!~~~!77!!!!!~!!7~!~:::^:7JJ77JJ?JJJY??JYY55?J?77!^^::::::::^~^!5PPGGGBG5PBGGGBBBBBGBBB#BBBGGBG~:::    //
//    ......::....................:..:....:.......:::.:::::::........:.::...................:..:...........::::::...::.....::::::::::::.:::...:::.:::...:......::...::.::........:..::..:::^^:::::^::::.::.:::::^::^^~^~~^...:.:::~~~~~~!!!!?7~^..........:::^:^?J?JJYYJJJJ?~:.....:^^~Y55YY555P5PP57~^^JPGGGBGGGGGBBGGB#BBGBGBBGBBGBBGJ^~^:PBB#BBBBBBB&BGBB##BB#&##BGGYJ!^::::^!:~G##############&########B###BBG~.:.    //
//    :....:::...::...:.::...........................:......:...:::.....::.........:::.:......::::::::....:::::^~~!!^^~~~~^^:::::::::^^^~~7!~~!7!!~:^^^!777????J????JJ?JYJJJJYYJJ5Y?JJ!^~?Y5555555P5555!..:~^^?5PPPPPPPGPP7:.:^^^?PGGGGGGGGGGPPJ^..........:^^:!5GBBBBBGGGGB5^.....:^.:YGGGGBBGGBBGGJ~:.YBBBBBBB#######&####BBBBGB#GGGGY~^.^PGB##B#BBBBBB#BB##BBB#B###&BBBP?^::^~.!G####&#####&########&#B&#&BBBBG?.::    //
//    :.:::::::::.^!~::::...:^^^!!?J?7~:....::::^!7!!!!!777?7!~::::.....:^^~?JJJJYY5YYY5J?!:....:::::::...:^^!YPPGBGGGGGGPG5?^:::::~~~YGBGB##BBBBBP!~^!PBBBGBBBBBBBGGGGGBBBBBBGGGB#BBGJ^^JPGBBBBGBBBBBGY^.^~:^5GGBGGGGGGBBP7.^~.^YGBBBBBBBGGGP5?^:.........:^^.~5BGGGGGGBBGGP~..:..:^:.JBGPBBBBBGGGB5!:^YGBGGBBB##B######&#BB#BB##B#BBGY^~::YGB#BGBBBBBBBBGBB##BGB#B#BBBBBB#G~.^~.7BBB#&###&&&BB&&&&&&&#####&#BB#B?.^:    //
//    :^~^!YP55PP55PP5PY~.:^~7Y5GGGGGGGP?:.:^~:!5GGGGGGBBBBBGGP!::::::.^~^~YGGGBGBBBBBBGGGP!:..::::::::::::^:^YBGGBGB#BBBGBBBY~.:::^^:?GBB##BGBBBGGJ~:^PBBBBBBBBBGBBGGBBBBBBB##BBBGBBGY~:~5GGBBBGGBBBBGP7.~^.?GGGGGBBBBBBBB5^:~.^5GGBGGBBGGGGPY~:...........::.~5GGBGGGBBBGGP!:..:.:^:^YGGBBGBBBBBGG57^:?GBBB####&&#BB#&#G##BBGBBB###BG5~^::YGBBBB#####BBBB#BB###B&#BBBB###B#G!:~:~P#&###&&##BB###&@&#&&#BB###B#BBY:::    //
//    :~~:^5BG##BBBBGGGP7^~~75GGBGGBBGBBP?:.~~.JGGBBGGBGGGGGGBG5!.:::::~~^?PGGGGBBBGBBBGGBG7.::::::::::::::~:^YGGB#BG##BBBGBBBP7:::~^.7GBGGB#B#BBBBY!:^5BB##B#BBBBBGGB#BBBB#BBBBBBGBBGJ~^^75PGGBBBBBGGGGY~~:^5GGGGGGGGBBGGBGJ!^:?PGPGB###BGGGPJ::...........:~::YBBBBGGPGGGG5~.:::::^::JGGBBBB#B#BBGPJ^.?GGBBBB###&&#BB#######BBBB##GGG5!~: YBBBBBBB###BBBBBBBGB#BBGBB#####BB#P!~.^G###B########BP5YYYYYYJJ??JYJ?7~.::    //
//    :^~:^YGGB###BGGGGP?!~^?GGBBBGGBBBBB5~:~^^5GGGGBBBBGPGBB##GJ^.:::~~:!5GGGGBBBBBBBBBBBP?:::..:::::::::^~:^5BBB##B##B##BBBBBBY^:~^:?BBBG#&#BBBBBY~:~5B##&#BGB##BBBB#BBBBBBBBBBBBBBBJ~!^:JGGGBBBBBBBBBGJ^:JGGPPGGBGBBBGGBBP7:~YPPGGB#BBBGGG5!::...........^^:~YGGGGGBBGGBGP!..:..:^:.JGBBBBB###BGGGJ^:JGBBBBBB&###BBPY5JJJJ?7??7?7777~^~:.YBGBBBBBBGGBBGJ~~!7!!PBB####&GG##BB5~.:G##B###&&&##B5!~~!7!7!!!!!!7~^:.:::    //
//    ::^:^YGGBB#BBGGGBB7^~^~YGPGB#BBBBBG5!^~::5BBGGGGGGGBBBBGBBG?:.:^!^^YGGGGGGGGBBBBBBBBGY^::.:::::::...^~:^5BBBB##B###BB##BBBBY^~^:7GB###&###BBB5!::YGB#BBBGB###BBGGGGGGGGGGGBGGGGPJ~~^.!PBGGGGBBBGBBGJ::YBBGGBGBBGGBGGBBGJ:~5GGGGGGGGGGPPJ^.........:...^^.^YGGGGBBGBGGBGJ^^^^^!7!~5BBGB#####BBBG7^.7GB##BB&&#BBBBJ~777!!!!~7!~!!~~::~^.JBBBBBBGBBBBGG7.:.^^.?BB###&#BBBBGB5~::PB##B#B#&&&###BBGBBBB#BBB##BBGY~:::    //
//    ::^:^YBBGGBBBBGBGG?:^~^!YPGGBGBBBGP7::^:^5B##BGGBBBBB##BBBBP!:^~^^YBGBBBGGGBB##BBBBBG?:.:::::::::::.^!::YB###&#&&####&&#B##BY!^.7BBB&&##BBBBG5!:^YG#&&BBBBBBBBGJ!!~~~!~^~7!^~^^^::^~^.?GBBBBBBBBBBB5^!GGB##BGGGGGGGGBGGP7JGGGGGGGGGGGPP7:.........:...:^:^YGBBBBBGGBBGGGPPPGGGBBGGB#BB#B####BGG7^:?BBB##BB##B##BBBBBBBBBGB##BBGGB?:~^.7GBGB#BB#B#BBGJ~^^~77JGBGB#BB#&#BBBP!^~5BB#&&####BB#&&##BBB#&&###&BGGG~:::    //
//    :^^:.Y#BGBBBBBGBGG?.::^~777YGGGGGP?^::^.:5GBBGGGBBBBB#B#BBBGP7~~:7PGGGBBGGBBB####BBBGY^::::::::::::.:!^:JG#BB##&#####&#B##B#B5!.7GB#&#####BBB5!:^5B#####BBBBBBGYYJ?5YYYYJJYJJJY?^::~^.^5GGGBBBBBBBGP?YBBGBBBBBGGGGGGGGBGPPGGBGGGBBGGGG5~::............:^::JGBBBBBBBBBBBBBBBGBBB###BBBBBBBBBBGGP?^:?GBBBB#####B##BB###B#BB##&&BB#GJ^~^.?GBBBBB#BGBBBBGGGPGBBBBBBBBB###B##GP7:^P&###&######BB##B&&&##&&&&#BGBG~..:    //
//    :^~:.YBGGBGGBBBBGGY^.:^!!75GBBGPJ!:.:^~^:YPPGGGBBBBBBGGGGGBGB57~7PGGGBGGGBBBBB##BBBGGP!..::::::::::::^:.?GBBB&####BB####B#BB#BP7JGGB####BBBB#5!^:YGBB#######BBBB########BBBBBBBG7:::~:.?GBBBBBBBBBBP5GGBB#BBBBGGBGGGPPGGGGGGGGGBBGGGGP7:....:...:^:...:^:^YGBGBBBBBBGGBGGBBBBB####BBBBB###BBGGP?~:7GBB#B###BBBBBB#&####BBB###BB#BY^~^.?GBBB#B##BBBB###BBBB#BBBBB#BGGBBBBP!!:^PBB#&#&&#&&&&&##&&##&#B####BGGG7:.:    //
//    :^~:.7GGGGGGBGGGGGJ::~~~JGGGP5J~:.:::^~^:YGBGGBBBBBBBBGGPGBBBBJ~JGGBBBBBB##B##BGGGBBBP7.::::::::.::::~^:?GB#######B#BG#&#BBGBB#BPG&&###&#BB#BP7^:JBB###BB#&###GB&&&#BB##BBBBBBBP7:::^~:~5GGBBBBBBB##BB###BGGGBGGGGGBBGB##BGGGGGGGGGGPJ^:..............:^::JGBBBBBBBBBGGGGGBBBBBB#B##BB#&#BBBBGPJ~.7GBBBBBGBB#BBB#&#B##B#####BBB#BJ:^^.!GBBGBBB#BGBBBBBBBBGBBBGGGBB#BGBB5~:~::5G###B&&##&&&##B####BB##BBBGGGG?.::    //
//    .:^:.7B#BGGGGGGGGGJ^:^^^!!!~~:....:::^~^7PBBGGBBBBGGBBBGPPB##BPPPGBBBBGBB#&##BGGGGBBGPJ^:::.:::..:..:~^:?GB######B##BG##BB##BB##B#&#BBB#BGBBB5!^:JB#####B##B##BBB##B##BBBBBBGBBG7::::^^:?PGGBBBBBB##B#BB#BBBBBBGGGGGBBB##BBGGGGBPPPG5?^.:.............:^::JGGBBBBGBBBBBBBBBBBBB###BBBBBBBBBGGGGJ^:7GBBBB#BGBB##BB#BB##BBBB####BBBY^^^.!GBBBGGB##BBBBBBGB##B#BGB##BBBGG5^.^~^:YGB#B##&&####BG55YYYPP55YJJYYJ?:.::    //
//    ::^:.?BBBGPGGGGGGG5!::.....:::::....:^::7PGPGGBGGGBGGGGBBGGGBGBBBBBBBBGGBBBB##BBBBBGGPJ^.::...:..::.:~^:?GB#BB#&#BB#BJJGBGBBBBBBBBBBGGB##B#BBP7::JGB##&&BB##BGBBBBBBGBBB##BBB#BG7::::^~:^YBBBGGBBBB###B#BBBBBGGGGBGBBBBBBGGGGGBGGPGGY~:::.............::.:JGBGB#BGBBBBBP5555YY5YJ5GBB###BBGGBBGJ^.7GBBBBB###BBBBPY5YYYJJYYJJ???7!~:^^.7GBGBBBGBBBB##BGBBB###BGB##BBBY^^..:!:.YBB#BB#&&&BB#G?~^^^^~~~!!~^^^^~^^::    //
//    .:^::?GGGGGGGGGGGGY~:::::.:::::::...:^^:7PGGGGGGGGGBBGGBBBBPPBBBBB##BBGGGGGB#BBGGGGBBGJ^:.::::::..:::^^:?GBBBBBB#BBBB?^YGBGGB###GGBBBBBB#&BGGP?^.?GBBBBB#BBBBBBBBBGBBGGGGGBGPPP57:::::^^.7GBGBBBB#BB##BBB##BBGYJPGBBBGGGBBBBBBBGGPPP?:................:^::?GGGBBBBBGGGG?::::.:~^:7GG##&&#BGGBBGJ^.~PBBB###&#BBBGJ^^^!~^:^!~^!~^~~!~~^.!GB##BBGBBGBBBGPGGBBBBBGGGB#BBG?.:::!::JGB###&##&#B#BGGGGGGGBBB#BGGBGBGJ..    //
//    ..^:.?GBBGPGPGGGGG?::....:::....::...^^:~PGBBBBBGGGGPPPGBBBBGBBGGGBBBGGGBGGGB##BBBBBBGJ^::::.::...:.:~^:JGBBBBBBBB#BBY^^?PBBBBBBBBBBBGGGBGBGBP?^.!GB#BGBBBBBBBGY7~!?7J7!~~!!~^^^..::::^^:~5GBBBB#####BBBBB###P!!5BBBBBBBGGBBB##GGGPY!:................:^::?PGGGGBBGGGGGJ^:..::^^.7GBB##&###BGGPJ~:!PB###BBBBB###BGGBBGGPGBGGBGGGGGP7^.~GB#BGBBBGGBGGY^!PGGBGB#GBB#BGGG?:.:~::5B#&&####&#B###&###&##&&&##BBBBBY.:    //
//    .:^:.?GGGPPPGGGGPP?:::.:::.:::...::.:^^:!PBBGBBBBGGGYJ5GGGBGGGGBBBGGGGGGG5YGB####BBBGGP7:.:::.....:::^:^YGBBBB###BGBBY7~:7PBGGPB#BBBBBB###B##G?^:7GGBBBBB##BBBGY77?JJJ??J?JJ?JJJ?!:::::^:.7PGBBBBGBBBBBBGGGGG5!:7GBGGGBBBBBGBBBGPPP?:.................:^::JPGGBBBBBBBGGJ^..:::~^.!GBGGGBB##BBGPJ~.~PBBBBB#BBBBGGBBB###BBBBBGBBGBGGP?^.!GBBBBBBBGGGGGY~:!5GGBGBBBBBGBB#BY~.~^:YB#&#&&B###BB#########&&###BBGGGY:.    //
//    ::^:.7PPBGGGPGGPPGY~::..........::..:^~:!5GGGGGGBBBGY!?PGGGGGGBBBBGGBBBG5!?GB##BBBGGGGGJ:::^::.::::.:~:.?PGGGB##BBGGBY^~~^~YGBBGB##B#GB####BBP?^:JGGBBBBBB###BBBB####BBBB#BGB#BGG5~::::^~:^JGBBGBBBBBBBGGGGG5?~::7PBBB###BBBBBGGGPY^..................:^::?GGGBBBBBBBBBY~:::::^^^?GGBBBGGGGGGBG7^.~PBBGGBBB#BBGBBBBB##BBBGGBGBBBBBP7^.~PGB#B#BBGGGGG?~~:~YGBGGBBBBBBBBBBP!~^.7GB####BBBB&##BB##BB####BB##BBBG5^.    //
//    .:~:.7GGGBBGGGGGGPY~::....::....:...:~^^JPPGBGGGBGGG5!~JGGGGBBGGGGGGGGGP?^7PGB##BBBGPGGJ:.:^::::.::::^^.7GGBBGGB####B5^:~!^:JBBGB##BBBBBGBBBBP7^.7GBBB#B########BB###BBGPGBBBBGGGY^...::~^:!5GBGBBBBBBGBBBGGJ^~^:!5GBBBBBBBBBBGGG57::.................::::7GBPBBBPGGGGBY^...::^^:7PBB#BGBGGGBBGJ~.^PGGGGGGBBBBBBBBGGBGBBBBBGGGBBBBP7^:!PBBBB#BBGGGGPJ.:~^^?GBBGGGBGPGGGBGG5^ ?BBBBBBB##B#&####BB#&#BB#BBBBBBBJ..    //
//    ..^:.!PBBBGGGPGGGG5~..:.....:.......:^:~YGPPGGB#BBGG5?:~YGGGGGGGGGGGGPPY~:7PGBBBGGBBGGP?:::::::..::::^^.~PGGBBBB###BBJ^.:~~::?GBBBBBBBBBBGGBBP7^.7BBBBB###BBB#B##BBB#BBBBBBBBBGGGY:.:...:~:.!PGBBGGGGGBBBGG5~.:~^:7PBB#BGGGBGGGGGY~::.........::.......:::?GBGGPPBBGGGGJ^.....^^.!GBBBBB#BGGBBP7~:!PGGGBBBGGBBBBBBBGGGB#BGGBBBBBBBP!^.!GGGGBBBBGGGGPJ: .~^:7PGGGGGGBBGPGGGP!:?PGBP5PPPGBBGGPPPGGPGP5555PP5J5Y!.:    //
//    ..^^.!PPGBGPGGGPPG5~:....:......:::.:^::JGGGGGBBBGGGP?^:!PGPGGGPGBGPPG5?^:7GBBGGGGGGBGGJ:.::::....:..~^.!GGGBBBBBBBBBJ.:::^~^^?GBBBBBBBGBBGGBP?^.7G#BBBGG##BB#BB#BB##BGGBBGBBBGBB5~.:....~~:^5GGBGGPPPGBBBP7:..^~:~5GGGGGGGGGGGGP7....................:^::!5PGPPGGPGPPP?:....:^~:~5PPPPPP5PGP5J7~^^J5P555YYY5555YY55YYYYJYJYYYJ?7?7:^:^7??!77777?~^~:...::::^^~~~~^!!~~~^^^::::~~:::::^^^^^^^^^^^~:...:::..::.::    //
//    .:^:.!5GGGGGPPGGGP5!.............:..:^::?GPPGGGGGGGGY~^::?555PGGGGGGG5!^::!PGBBGBGPGGPPJ:.:.:::.....:^^.7GBBGBBBBB#BG?:.::::~^:?PGGGBGBBGGBBGP7^.!GBBBBBBBGGBBBBGBBGGGGGBGGBGGBGPY^......:^^:?PGPPPPP5PP55?^...:^^^7YY5YYYYYYYJJ7^.................:...:::^!!~!7!~~~~^::.......:::^^~^^^^:^^:....::.:~:.::::::::::::...........::..:...............:.:.:..... ... .  ..............::.......:...:..::.......::..    //
//    .:^:.~5GPGGGGPGGGG5~................:^::?GPPGGGGBGGBY^:^:~J5PPPPPPPP5?:^^^?PPPGGGGGGGPP?.....:::....:^~:!YP55PP55PPPY7:...:.:~^^7Y5YYYYYJJJJ?7~^^~7JJJJ??7?77???7?7!7!!7!!!!!7~^~^:.......::::^~^^~~:::^^:::....::::..:::.:::....................................  ......................:.......:.......::.......::.:...:.:............::..:...:::..:.......:...........:.................::..:.::.::.:...:::..    //
//    ..^~:!Y5P55PGP55Y5J^.................~~^7JJ?JYYJJJ??!::^^:^^~^^~~^^^::.:::^~~~~~~!!!!~^::........:::::::^^^^^^^:::...:::..::..::..............:::........................................::.......:.....:.........................................................................:.::::.......:::.................::::....................::...:..............................:......::..::......:::.:::.:::::.    //
//    ..::::::::::^~^^::::................:::...:.:::...............  ............ ...........:.....:..::....................::.....::.....::.....::....:::....:::....:......::..:::.::.........:............::..................::.........................................................::........:..::.......:::.......:.....................:................:.......::.....................:...:..::.:::..::.::    //
//    ............................................................................................................................::::.:::.:::..:..::::..:::....:....:..........:..:::........................:.................................:.........................................::.....:::.....:.........:...................................::...........................................:::......::....:..    //
//    ...............................::.........................................................:...............::......:............:.:::...::::.::::......::...::::..........::..::.:......................::...........:...................................................................:..:::.....::..........:::...................:....:..:.........................................::.....:::........:......    //
//    ..........................................................................................::..................::::..........::................:..........:......:...:..:..:..:................................................................:..............................................:..................:......................:..:..:....:::...::...:::........................::......::::..:..:.::...    //
//    ...........................................................................................................:.................::::.........::..........::::.....................................................................................................................................:..........:...........:............::..............:.............::................:...............::...:.:...::    //
//    ................................................................................:...........................................::........:....:.......:...:::...........:.............:.....................................................:.............::.................................:.....................................................:..:.::.:......................:....................:::...:.....    //
//    .................................................................................................................:::....................::................::.......................:::::............... ......................................................................:..................:..........::..::.........:..............::..:.......:.....:.:.......:.:::...............:...:......:::....:::.    //
//    .............................::.................................................................:................:...................:::::.............::..::::.............:.................................................................................................:.............:..................:..............:::............:...........::.....:.......:.......................x marks the spot    //
//    ....................................................................................................:......::..............................:..................:.................:........................................................:......:.......................................................:................:.....::......:......::...........:.::.....:...............................solutionists    //
//                                                                                                                                                                                                                                                                                                                                                                                                                        //
//                                                                                                                                                                                                                                                                                                                                                                                                                        //
//                                                                                                                                                                                                                                                                                                                                                                                                                        //
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


contract NHXS is ERC721Creator {
    constructor() ERC721Creator("NEW HERE: X Marks the Spot Solutionists", "NHXS") {}
}