// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

/// @title: Hamburg Street #2
/// @author: manifold.xyz

import "./ERC721Creator.sol";

////////////////////////////////////////////////////////////////////////////////////////////
//                                                                                        //
//                                                                                        //
//    @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@    //
//    @@%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%&@    //
//    @@%%%%%%%%%%%%%%%%%&@%%%%%%%%%%%%%%%%%%@ @%%%%%%%%%%%%%%%%%%@%%%%%%%%%%%%%%%%%&@    //
//    @@%%%%%%%%%%%%%@@@@  @@@@&%%%%%%%%%%%*     @%%%%%%%%%%%@@@@( /@@@@%%%%%%%%%%%%&@    //
//    @@%%%%%%%%%%%%%%@      @%%%%%%%%%%%%%%%@ @%%%%%%%%%%%%%%&(     /&%%%%%%%%%%%%%&@    //
//    @@%%%%%%%%%%%%%@...   [email protected]%%%%%%%%%%%%%@(.%@%%%%%%%%%%%%&&..   ..&&%%%%%%%%%%%%&@    //
//    @@%%%%%%%%%%%%%%%%%@@%%%%%%%%%%%%%%%@@#. *&@&%%%%%%%%%%%%%%@/@%%%%%%%%%%%%%%%%&@    //
//    @@%%%%%%%%&@@@&%@@@@%@@@@%@@@@%%%@/           &%%%%@@@@%@@@@%@@@@%@@@@%%%%%%%%&@    //
//    @@%%%%%%%%&* *&%/ ,@%( [email protected]%#  @%%@              ,@%%@  @%@  @%@  @%@  &%%%%%%%%&@    //
//    @@%%%%%%%%&*                 @%&(               @%%@                 &%%%%%%%%&@    //
//    @@%%%%%%%%&*                 @&#                 @%@                 &%%%%%%%%&@    //
//    @@%%%%%%%%%%%              ,&%%%@               @%%%@               @%%%%%%%%%&@    //
//    @@%%%%%%%%%%&              ,&%%%@               @%%%@               @%%%%%%%%%&@    //
//    @@%%%%%%%%%%&              ,&%%%@               @%%%@               @%%%%%%%%%&@    //
//    @@%%%%%%%%%%&              ,&%%%@               @%%%@               @%%%%%%%%%&@    //
//    @@%%%%%%%%%%&              ,&%%%@               @%%%@               @%%%%%%%%%&@    //
//    @@%%%%%%%%%%&              ,&%%%@               @%%%@               @%%%%%%%%%&@    //
//    @@%%%%%%%%%%&              ,&%%%@               @%%%@               @%%%%%%%%%&@    //
//    @@%%%%%%%%%%&              ,&%%%@               @%%%@               @%%%%%%%%%&@    //
//    @@%%%%%%%%%%&              ,&%%%@               @%%%@               @%%%%%%%%%&@    //
//    @@%%%%%%%%%%@              ,&%%%@               @%%%@               @%%%%%%%%%&@    //
//    @@%%%%%%%%%%@              ,&%%%@               @%%%@               @%%%%%%%%%&@    //
//    @@%%%%%%@.   ,(   @    @   ,*    @   @    //   %    @   #,    %   @    (%%%%%%&@    //
//    @@%%%%%%@.   ,#,,,@    @,,,/*    @,,,@    /(,,,%    @,,,%,    &,,,@    (%%%%%%&@    //
//    @@%%%%%%@.                                                             (%%%%%%&@    //
//    @@%%%%%%@.                                                             #%%%%%%&@    //
//    @@%%%%%%%%@                                                           @%%%%%%%&@    //
//    @@%%%%%%%%@                                                           @%%%%%%%&@    //
//    @@%%%%%%%%%                           ,//*.                           @%%%%%%%&@    //
//    @@%%%%%%%%(                     [email protected]%          ,@%                      @%%%%%%%&@    //
//    @@%%%%%%%&*                   #&   [email protected](  @ .%%    @.                   &%%%%%%%&@    //
//    @@&%%%%%%@                   @   @      @     *(  /&                  /&%%%%%%@@    //
//    @@@%%%%%%@                  @  .#       @       @  /&                  @%%%%%%@@    //
//    @@@&%%%%&,                  @  @ &@     @     @/ , [email protected]                  @%%%%%@@@    //
//    @@@@%%%%@                   @  @ ,/     @     %  , [email protected]                  [email protected]%%%@@@@    //
//    @@@@@%%&,                   @  @        @        , [email protected]                   @%%@@@@@    //
//    @@@@@@&@                    @  @        @        , [email protected]                    @@@@@@@    //
//    @@@@@@@&                    @  @        @        , [email protected]                    @@@@@@@    //
//    @@@@@@@@@*                  @  @        @        , [email protected]                  @@@@@@@@@    //
//    @@@@@@@@@@@(                @  @        @        , [email protected]                @@@@@@@@@@@    //
//    @@@@@@@@@@@@@@              @  @ */     @     %  , [email protected]             ,@@@@@@@@@@@@@    //
//    @@@@@@@@@@@@@@@@&           @  @ &&     @     @/ , [email protected]          [email protected]@@@@@@@@@@@@@@@    //
//    @@@@@@@@@@@@@@@@@@@@*       @  @        &        , [email protected]       %@@@@@@@@@@@@@@@@@@@    //
//    @@@@@@@@@@@@@@@@@@@@@@@@@,  @  @        &        , [email protected]  (@@@@@@@@@@@@@@@@@@@@@@@@    //
//    @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@/.     &     ,#@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@    //
//                                                                                        //
//                                                                                        //
//                                                                                        //
////////////////////////////////////////////////////////////////////////////////////////////


contract HHSTREET2 is ERC721Creator {
    constructor() ERC721Creator("Hamburg Street #2", "HHSTREET2") {}
}