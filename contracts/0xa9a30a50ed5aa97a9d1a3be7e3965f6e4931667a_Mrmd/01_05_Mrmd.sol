// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

/// @title: Fantasy world by Mermaid
/// @author: manifold.xyz

import "./ERC721Creator.sol";

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//                                                                                                                                //
//                                                                                                                                //
//     .......... .. .. ....... ............................ .................................................................    //
//     .... .................................................................................................................     //
//    ........'.............................. ................................................................................    //
//        ........................................................................................  ..........................    //
//    ..   ...................................................................................     ...........................    //
//    ..     .................................................................................   .............................    //
//       .   ................................................................................   ..............................    //
//    ..'.... ...............................................................................  ...............................    //
//     .. ....................................................................................................................    //
//    ............................................................'''.........................................................    //
//      ..... ..............................................;c'..,oxd'........................................................    //
//       .lo'......,:'..................................:ko;:kkl.';o0o. ;c....................................................    //
//       .;OOl.....lKx'...............................,.;ONKdlx0x:,:x0c.:x,...................................................    //
//     ....lKXOc'..,xXk,....'........................,xkloKNKOddOOkocxk,,x: ..................................................    //
//     ....'oXNXkc..;kKk;...c:.......................'dNXxd0KOOxdxkkdlkx:xo......'....'',''...................................    //
//    .....',dXXXKkc,;d0O:. .lo. ..................'ccl0NX0k00kkkdodkxokddd'.........'',''''..................................    //
//    ....:OxlxKX0OOxc;lkkc. .ld,..................,kNKKNNXKk0Odxxolldooddxc.',;cc::clccc;,,'.   .............................    //
//    ....'xXklo0KOxkko::oxl. .cx:................',lKMWNNXK0OOOxk0Oxxxdooo:....'',:cl:'''','.  ..............................    //
//    .....,kXOolk0Ododdl::lc'..:xc...............cOO0NWWNNK00K0Okxxdlcl:;;,.......',;::,.....................................    //
//    ......;kXOocokOxlloo:,;:,..,dd'  .........'';kXXKXWWXK0kkxolllc;;::;;,......'...',,.  ..................................    //
//    .......,xK0dclxkkocccc,',,..'lo,............':xKXXKXNK0Oxdlc::::;,;;;,.... .''...''...''''',,,''........................    //
//    .......;xOK0kocldkkocc:;,'''..;lc..........:xd:lkKKO0XK0Oxlcc:;;;::::,.... ......,'''''','''',,;::;,.... ...............    //
//    .......:OXKKKOoccdkkxoc:;,'''..'::'........;OXkl:okOkxk0K0klc:;;;;;okl,.........'...'..',.......'',:c;..................    //
//    ........;kNXK0OxllxO0Oxoc;,''''..,,.........c0XKxc:ldddoxO0kxdc;cd:lK0l,........'.......'''.........'::;'..  ...........    //
//    .........'oKX0OOkocldO0Oxoc;,,,''''''.......;oO000o::coollokOkxoxKklOKk:.........'....................';:;,..  ...... .     //
//    ........':lox0OxxxxlccokOOxol:;,',,,,,'.....:xdxkkOkl::clc::clxO0KXkxkdl,.   ....''...........  .. ......,;:;,..  ...       //
//    .........cO0doxxdooddoccldkkxoc:;;,;oxl;.....lOxodddxdc;;;;,,,cONXXKkdoc:..    .........'''................,;:c;'.....      //
//    ..........,d0Odooolcclooc:clooolcc:;ck0kl,...:kOxllolodl:,,,,:loKXK0Odlc:,..........  ..','...............',,,,cl,.....     //
//    ...........,cx0klcllc;:clolccccccxOkdloxkd:'.,xkkxlcllccc;;;;lkdxK0Okxlc:;'..............',,,'..............'',;;......     //
//    ...........;dxdxkxlclol:::cloolc:cdOOxdooolc;.,dxdolccc::::c:ckkoxOkxxdodk:,d:..............';:::,..........''..........    //
//    ...........'lO0kdddolclddl;;:loolclddllllc::ldc,lxoc::;:clloddxOkllodxkxOKdcd:...............';cdl'.....................    //
//    ............':dO0kolooccodddl:::::oO0xlcc:;;:okd:;loccc:codddOkxOxl::lxO00doo,..............'',:o:. ....................    //
//    ............,odlokOxocclccclodoc::lxkkdc::;;,;lxxl:lddc:cokkldOxxOkc,;cdO0kxo;...............',c:.......................    //
//    .............;dOxlldxdl::ccc::ccccoOK0xlc:,,;;:ldxd:,:lolokOkodkxxko::cclkX0Ok:..............',c:.......................    //
//    ..............;okOklcldol:::clc:;;;:okOdlc::;;::cccc:;cooldOOxoxkdoooxdlccxOKKo,'......  .....,:c'......................    //
//    ..............:kxoxOkocclol:;:cclc:;:loddlc::;;,:odoloooldkkOkxddl:cdK0kkc:lxkxxc'............,:o:......................    //
//    ...............cO0xddkxl::cllc;;;:::oOkdlcll:;,,',oOOxdlcd0kxxxdlcccoOOx0x:::oOkc,'...........,:o:......................    //
//    ................'o0KOxdddl:;:cclc:;;:oxkdlc:::;,'':xOOxlccx0kkxl::codkkdddl:;:x0d;'....    ...';l:......................    //
//      ...............;xO0X0kdoccc;;:cclloodkxollc:;',:oxkkkxdcck0Ooccllox0Oxo:::,;OKo;'...      ...:l;.....................     //
//      ...............:0XOkk0Kkdoc::c::::::lkOdoolc::cdOkxxkkkdlc:clloxkoldOkl;;,,d0xl;'...      ..':l,....................      //
//    ..................;kXKkxdxkkdlc::cccc:cdOkxoccclddxOOkkkkxl,..;oxxxxl:cc;,',oOxlc;'...      ..'cl'..................        //
//    ...................o00KKOdollodoc:;;::;;cddocclxkxdxkOOkko,...,cddllc:;'...;lc;;;,'....    ...,lc..................         //
//    ...................:O0kxkkkdollcclc:;,,,:dxdlldkkxdodxxxd:'.',;:::c;''.....''',,;;,'.... ....,:oc..................         //
//    ....................:kkdolloddoc:::::::;:lkOkkOkxxddolllc;'',;:;,,'.............'...........:clxo.................          //
//     .................. .cxxoccc::clcc;,,,,,,'ckOOOOkxxdddxl;'''..''''.........................,lodxo,................. ..      //
//       ................ .:xxdocc::;;:cc:;,'....;x000Okkdoollc,',,;;,'...... ..'........... ....,codxo,......................    //
//        ................ .lxdool::::;;;;:;;'....lOKK0Okkxl,..:dxxdoc:,'...  .',.  ........ ....,coodl'......................    //
//         ..................:xxccc:;:::;,'''.....:OXK0Oxdd:',okOkkxxoc;',,....;l,............   ':lodc.......................    //
//         ...................,ldoc::;;,,,''.......o0KK0xdl,,cxOOkkkxdl;',:;,.;odo:,..........  .;ccoo,.......................    //
//         ...................;:;clc;,,,,'..........cOK0kdc;clldkxxxdol;'..',',lxxdl;........   .;c:lc'.......................    //
//        ....................,c:;,;;;,,,,''..... ..'lOOkdlldo::cllllc:;,'..'..,loool;,,''...  ..,c;c:........................    //
//       ......................';:;;,''..',,''.......'lxkkdxxlc:,,,,;;:clc,...';:cloxkx;..... ....;;:;........................    //
//    ............................,;;,,'...............;lxkOxl:cc;'',:coxxo:'',,,,,:ldkkc....... .',;;........................    //
//    .............................',,',;;;,............,;d0xl;;clc;';:lxOkdc,...';codx0k,..... ...';,........................    //
//    .............................',,,'',,;;,,'..... ...'o0xc;,cddo:,,:lxkOxl;'.';:loxOO:..... .''.''. ......................    //
//    ................................',,,,'..............o0xc,.:xOxoc;,;coxkOkdlc:;:coxOo'......';,,.........................    //
//    ................................',;;::;,'.......   .cOd:,..lkOkooo:;;lodxxkkkxollokd,......',;o:........................    //
//    ..............................,,;;;;;::::;,......   ;dl;'...'cxkOOxc;,;:cccodxkkkxkd,......'',lxc.......................    //
//    ................................'',,;;,;;;,'....... .lc,'... .lO0Oxoc;,'',;:clodxkkkd:;'....'',::'......................    //
//    ...................................'''''......... . .,;'....,lO0Okxdc:;'..',;:cclodxxkkxoc,..',,........................    //
//    .....................................''.........    .,;'..'dO0OOkkxdl::,..''',,;;;:cloddxkko:,,'.      .................    //
//    .......................................'''.......   .;,..,x0OOkkxxdol::;'..,,;:::ccc:,,:lddxdc,.          .............     //
//    ..............................................     .,;'.;x0Okkkxxdoolc:;'...',:cloodo:;;;coollc,.      .   ............     //
//    ..............................................     .:;.,dOkkxxxdooollc:;,'...',;:odllddl;,:ccll,...  .... .............     //
//     ............................................      ,c,'lOkxdddooolllc:;,,'....',;:,.;odl:',cc;'........................     //
//      ........................     ...........        .;:.,dxdooooolllcc::;,'''........;lodo:..'.   .......................     //
//      .......... ...............................      .,,.:doolllllllcc:;;,'''.....',;cllllo:.''..........................      //
//      ......... .................................     ..'.:lllllllcc::;;,,''........,;:cc:cc'.;;. ...'....................      //
//     ........    .... ...........................      ..';cclccc::;;;,,,''...........,,;:lo,.::...  .....................      //
//     ...            .............................       ..,;;;;;;;,,,,,''.............,;cldOd,,c.......  ..... ...........      //
//      .            .............................         ..',,,'''''''................':loxkOl':;....''..'....   ...........    //
//    .. ..         .. ...  ......  ......                    ............            .,;;:lodkx:,l,...,'',;'..      .........    //
//    ...           .....  ..  .   .. ..                                   .........  ..,:cloodkd,:l'.'',,;,..        ........    //
//    ....          .........      .   .  .......................        ..',,,'..........,cloodkc,c;.......           .......    //
//    .....          ..........................                 .....   ..',....          .,cooodd;,:.                .......     //
//    .......               ......                              ....   ....                .':loooc,',.                ...        //
//    .. ....                                                          ............          .,clooc,..                 .   .     //
//    .........                             ....                                   .           ..';c:.                 .......    //
//    ..........                           ...                                                      ..                ........    //
//                                                                    ....        ..........                          ........    //
//                                                               .........        ...................... ....         ......      //
//                                                                                                                                //
//                                                                                                                                //
//                                                                                                                                //
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


contract Mrmd is ERC721Creator {
    constructor() ERC721Creator("Fantasy world by Mermaid", "Mrmd") {}
}