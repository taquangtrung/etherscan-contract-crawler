// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

/// @title: moon moth'
/// @author: manifold.xyz

import "./ERC721Creator.sol";

/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//                                                                                                                                                                             //
//                                                                                                                                                                             //
//    ---------𝙞𝙣𝙨𝙩𝙞𝙣𝙘𝙩𝙝𝙚𝙖𝙙 𝙖𝙧𝙩𝙬𝙤𝙧𝙠 𝙘𝙤𝙡𝙡𝙚𝙘𝙩𝙞𝙤𝙣 𝙗𝙮 𝙙𝙖𝙧𝙠𝙣𝙤𝙤𝙫                                                                              //
//                                                                                                                                                                             //
//       𝙄 𝙨𝙩𝙖𝙧𝙩𝙚𝙙 𝙙𝙧𝙖𝙬𝙞𝙣𝙜 𝙖𝙧𝙩𝙬𝙤𝙧𝙠𝙨 𝙤𝙛 𝙢𝙮 𝙄𝙣𝙨𝙩𝙞𝙣𝙘𝙩𝙝𝙚𝙖𝙙 𝙘𝙤𝙡𝙡𝙚𝙘𝙩𝙞𝙤𝙣 𝙤𝙣 19 𝙊𝙘𝙩𝙤𝙗𝙚𝙧 2021.                                //
//     𝙃𝙖𝙫𝙞𝙣𝙜 𝙖 𝙣𝙤𝙣-𝙘𝙤𝙣𝙘𝙚𝙥𝙩𝙪𝙖𝙡 𝙡𝙞𝙣𝙚 𝙞𝙣 𝙢𝙮 𝙛𝙞𝙧𝙨𝙩 𝙘𝙧𝙚𝙖𝙩𝙞𝙤𝙣 𝙞𝙣𝙨𝙥𝙞𝙧𝙚𝙙 𝙩𝙝𝙚 𝙨𝙪𝙗𝙟𝙚𝙘𝙩 𝙤𝙛 𝙢𝙮 𝙘𝙤𝙡𝙡𝙚𝙘𝙩𝙞𝙤𝙣.       //
//     𝙄 𝙥𝙧𝙚𝙛𝙚𝙧 𝙩𝙤 𝙛𝙚𝙚𝙙 𝙤𝙣 𝙫𝙖𝙧𝙞𝙤𝙪𝙨 𝙢𝙚𝙖𝙣𝙞𝙣𝙜𝙨 𝙞𝙣 𝙖𝙗𝙨𝙩𝙧𝙖𝙘𝙩𝙞𝙤𝙣. 𝙄 𝙩𝙝𝙞𝙣𝙠 𝙩𝙝𝙖𝙩 𝙄 𝙘𝙖𝙣 𝙗𝙧𝙞𝙣𝙜 𝙩𝙝𝙚 𝙖𝙪𝙙𝙞𝙚𝙣𝙘𝙚     //
//    𝙩𝙤𝙜𝙚𝙩𝙝𝙚𝙧 𝙞𝙣 𝙩𝙝𝙚 𝙢𝙞𝙙𝙙𝙡𝙚 𝙗𝙮 𝙢𝙖𝙠𝙞𝙣𝙜 𝙪𝙨𝙚 𝙤𝙛 𝙩𝙝𝙚 𝙞𝙣𝙩𝙚𝙧𝙨𝙚𝙘𝙩𝙞𝙤𝙣𝙨 𝙞𝙣 𝙩𝙝𝙚 𝙖𝙗𝙨𝙩𝙧𝙖𝙘𝙩 𝙩𝙤𝙪𝙘𝙝𝙚𝙨 𝙤𝙛               //
//    𝙢𝙮 𝙙𝙚𝙨𝙞𝙜𝙣𝙨, 𝙖𝙥𝙖𝙧𝙩 𝙛𝙧𝙤𝙢 𝙩𝙝𝙚 𝙘𝙤𝙣𝙘𝙧𝙚𝙩𝙚 𝙛𝙧𝙖𝙢𝙚𝙨 𝙤𝙛 𝙩𝙝𝙚 𝙥𝙞𝙚𝙘𝙚𝙨 𝙩𝙝𝙖𝙩 𝙄 𝙖𝙞𝙢 𝙩𝙤 𝙢𝙖𝙠𝙚                                  //
//     𝙚𝙫𝙚𝙧𝙮𝙤𝙣𝙚 𝙛𝙚𝙚𝙡 𝙙𝙞𝙛𝙛𝙚𝙧𝙚𝙣𝙩 𝙩𝙝𝙞𝙣𝙜𝙨 𝙖𝙣𝙙 𝙖𝙩 𝙩𝙝𝙚 𝙨𝙖𝙢𝙚 𝙩𝙞𝙢𝙚 𝙄 𝙬𝙖𝙣𝙩 𝙩𝙤 𝙩𝙚𝙡𝙡. 𝙄'𝙢 𝙙𝙚𝙖𝙡𝙞𝙣𝙜                          //
//     𝙬𝙞𝙩𝙝 𝙛𝙚𝙚𝙡𝙞𝙣𝙜𝙨 𝙩𝙝𝙖𝙩 𝙥𝙚𝙤𝙥𝙡𝙚 𝙝𝙖𝙫𝙚 𝙙𝙞𝙨𝙩𝙖𝙣𝙘𝙚𝙙 𝙩𝙝𝙚𝙢𝙨𝙚𝙡𝙫𝙚𝙨 𝙛𝙧𝙤𝙢 𝙖𝙣𝙙 𝙩𝙝𝙚 𝙖𝙧𝙩𝙞𝙛𝙞𝙘𝙞𝙖𝙡                            //
//     𝙗𝙚𝙝𝙖𝙫𝙞𝙤𝙧𝙨 𝙩𝙝𝙚𝙮 𝙗𝙧𝙞𝙣𝙜 𝙞𝙣 𝙩𝙤𝙙𝙖𝙮'𝙨 𝙩𝙞𝙢𝙚. 𝙊𝙣𝙚 𝙤𝙛 𝙩𝙝𝙚 𝙨𝙪𝙗𝙟𝙚𝙘𝙩𝙨 𝙄 𝙬𝙖𝙨 𝙞𝙣𝙨𝙥𝙞𝙧𝙚𝙙 𝙗𝙮 𝙬𝙖𝙨                          //
//     𝙩𝙝𝙖𝙩 𝙚𝙫𝙚𝙧𝙮𝙤𝙣𝙚 𝙞𝙨 𝙨𝙩𝙪𝙘𝙠 𝙞𝙣 𝙨𝙩𝙚𝙧𝙚𝙤𝙩𝙮𝙥𝙞𝙘𝙖𝙡 𝙘𝙝𝙖𝙧𝙖𝙘𝙩𝙚𝙧𝙨 𝙖𝙣𝙙 𝙡𝙞𝙫𝙞𝙣𝙜 𝙖 𝙡𝙞𝙛𝙚 𝙖𝙬𝙖𝙮 𝙛𝙧𝙤𝙢 𝙩𝙝𝙚𝙞𝙧             //
//     𝙞𝙣𝙨𝙩𝙞𝙣𝙘𝙩𝙨. 𝙄𝙣 𝙩𝙝𝙞𝙨 𝙘𝙤𝙡𝙡𝙚𝙘𝙩𝙞𝙤𝙣 𝙩𝙝𝙖𝙩 𝙙𝙚𝙖𝙡𝙨 𝙬𝙞𝙩𝙝 𝙨𝙥𝙞𝙧𝙞𝙩𝙪𝙖𝙡 𝙞𝙨𝙨𝙪𝙚𝙨, 𝙄 𝙙𝙞𝙨𝙘𝙪𝙨𝙨 𝙩𝙝𝙚 𝙘𝙤𝙣𝙘𝙚𝙥𝙩 𝙤𝙛       //
//     '𝙢𝙖𝙩𝙪𝙧𝙚 𝙙𝙖𝙧𝙠𝙣𝙚𝙨𝙨'.                                                                                                                                        //
//                                                                                                                                                                             //
//                                                                                                                                                                             //
//                                                                                                                                                                             //
//     _, _  _,  _, _, _   _, _  _, ___ _,_ ,                                                                                                                                  //
//     |\/| / \ / \ |\ |   |\/| / \  |  |_| '                                                                                                                                  //
//     |  | \ / \ / | \|   |  | \ /  |  | |                                                                                                                                    //
//     ~  ~  ~   ~  ~  ~   ~  ~  ~   ~  ~ ~                                                                                                                                    //
//                                                                                                                                                                             //
//       𝟟𝟞𝕥𝕙 𝕡𝕚𝕖𝕔𝕖 𝕠𝕗 𝕥𝕙𝕖 𝕚𝕟𝕤𝕥𝕚𝕟𝕔𝕥𝕙𝕖𝕒𝕕 𝕒𝕣𝕥𝕨𝕠𝕣𝕜 𝕔𝕠𝕝𝕝𝕖𝕔𝕥𝕚𝕠𝕟 🌫️                                                                      //
//                                                                                                                                                                             //
//                                                                                                                                                                             //
//       ᴍᴏᴏɴ ᴍᴏᴛʜ' ᴛᴀᴋᴇꜱ ᴛʜᴇ ᴍᴇᴛᴀᴘʜᴏʀ ᴏꜰ ᴇᴠᴇʀʏ ʜᴜᴍᴀɴ ʙᴇɪɴɢ ᴀꜱ ᴀ ᴍᴏᴛʜ. ɪᴛ ʟᴇᴀᴠᴇꜱ ᴀ ᴛʀᴇᴇ,                                                                                       //
//     ᴡʜɪᴄʜ ɪᴛ ᴄʟɪɴɢꜱ ᴛᴏ ɪɴ ᴛʜᴇ ᴄᴏʟᴅ ᴛᴏɴᴇꜱ ᴏꜰ ᴛʜᴇ ɴɪɢʜᴛ, ᴛᴏ ᴛʜᴇ ᴄᴏᴍᴍᴜɴɪᴄᴀᴛɪᴏɴ ᴏꜰ ᴛʜᴇ                                                                                          //
//     ᴘᴏᴡᴇʀꜰᴜʟ ᴇɴᴇʀɢʏ ɪᴛ ꜱʜᴀʀᴇꜱ ᴡɪᴛʜ ᴏᴛʜᴇʀ ᴍᴏᴛʜꜱ. ᴍʏ ᴡᴏʀᴋ ɪꜱ ᴛʜᴇ ꜱʜᴀʀɪɴɢ ᴏꜰ ᴛʜɪꜱ ᴄᴏᴍᴍᴜɴɪᴄᴀᴛɪᴏɴ.                                                                               //
//     ɪᴛ ɪɴᴠɪᴛᴇꜱ ᴇᴀᴄʜ ᴏꜰ ᴜꜱ ᴛᴏ ᴇxᴘᴇʀɪᴇɴᴄᴇ ʙᴇɪɴɢ ᴍᴏᴛʜ. ɪ ᴛʜɪɴᴋ ᴛʜᴀᴛ ᴛʜᴇ ᴘᴜʀɪᴛʏ (ᴇꜱꜱᴇɴᴄᴇ) ᴛʜᴀᴛ                                                                                  //
//    ᴇᴠᴇʀʏ ᴘᴇʀꜱᴏɴ ꜱʜᴏᴜʟᴅ ᴇᴠᴇɴᴛᴜᴀʟʟʏ ʀᴇᴛᴜʀɴ ᴛᴏ ʙʀɪɴɢꜱ ᴜꜱ ᴛᴏɢᴇᴛʜᴇʀ ᴀɴᴅ ɪᴛ ɪꜱ ᴀᴄᴛᴜᴀʟʟʏ ᴀ ᴄʀᴇᴀᴛɪᴏɴ                                                                                //
//     ᴏꜰ ᴀᴅᴀᴍꜱ' ꜱᴛᴀɢɪɴɢ, ᴡʜɪᴄʜ ᴡᴇ ᴄᴀʟʟ ᴍᴏᴛʜ' ᴛᴏ ɪᴛꜱ ᴇꜱꜱᴇɴᴄᴇ. ᴛᴡᴏ ᴅɪꜰꜰᴇʀᴇɴᴛ ᴛᴏᴜᴄʜᴇꜱ ᴛʜᴀᴛ ᴇxᴛᴇɴᴅ                                                                                //
//     ᴛᴏ ᴇᴀᴄʜ ᴏᴛʜᴇʀ ᴡɪᴛʜ ʀᴇᴀʟɪᴛʏ ᴀɴᴅ ᴏᴜʀ ᴀʙꜱᴛʀᴀᴄᴛ ᴇꜱꜱᴇɴᴄᴇ..                                                                                                                   //
//                                                                                                                                                                             //
//                                                                                                                                                                             //
//                                                                                                                                                                             //
//                                                                                                                                                                             //
//                                                                                                                                                                             //
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


contract moth is ERC721Creator {
    constructor() ERC721Creator("moon moth'", "moth") {}
}