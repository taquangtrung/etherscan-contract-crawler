// SPDX-License-Identifier: MIT
pragma solidity ^0.8.6;

/*                                                                                        
       ...........................................................................        
       :++++++++++++++++++++++=::++++++++++++++++++++++=::++++++++++++++++++++++=:        
       :++++++++++++++++++++=.  :++++++++++++++++++++=.  :++++++++++++++++++++=:          
       :++++++++++++++++++=.    :++++++++++++++++++=:    :++++++++++++++++++=:            
       :++++++++++++++++=:      :++++++++++++++++=:      :+++++++===++++===:              
       :++++++++++++++=:        :++++++++++++++=:        :++++++==++++++=.                
       :++++++++++++=.          :++++++++++++=.          :+++++==+++++=.                  
       :++++++++++=.            :++++++++++=:            :+++++==+++=:                    
       :++++++++=:              :++++++++=:              :++++++===:                      
       :++++++=:                :++++++=:                :++++++=.                        
       :++++=:                  :++++=:                  :++++=:                          
       :++=.                    :++=.                    :++=:                            
       :=.                      :=:                      :=:                              
       :=======================-:=======================--=======================-        
       :+++++++++++++++++++++=: :+++++++++++++++++++++=: :+++++++++++++++++++++=:         
       :+++++++++++++++++++=.   :+++++++++++++++++++=.   :+++++++++++++++++++=:           
       :+++++++++++++++++=:     :+++++++++++++++++=:     :+++++++++++++++++=:             
       :+++++++++++++++=:       :+++++++++++++++=:       :+++++++++++++++=:               
       :+++++++++++++=:         :+++++++++++++=:         :+++++++++++++=:                 
       :+++++++++++=:           :+++++++++++=:           :+++++++++++=:                   
       :+++++++++=.             :+++++++++=:             :+++++++++=:                     
       :+++++++=:               :+++++++=:               :+++++++=:                       
       :+++++=:                 :+++++=:                 :+++++=:                         
       :+++=:                   :+++=:                   :+++=:                           
       :+=.                     :+=.                     :+=:                             
       :-.......................:-.......................--.......................        
       :++++++++++++++++++++++=::++++++++++++++++++++++=::++++++++++++++++++++++=.        
       :++++++++++++++++++++=:  :++++++++++++++++++++=:  :++++++++++++++++++++=:          
       :++++++++++++++++++=:    :++++++++++++++++++=:    :++++++++++++++++++=:            
       :+++++++===++++===:      :++++++++++++++++=:      :++++++++++++++++=.              
       :++++++==++++++=.        :++++++++++++++=:        :++++++++++++++=.                
       :+++++==+++++=:          :++++++++++++=:          :++++++++++++=:                  
       :+++++==+++=:            :++++++++++=:            :++++++++++=:                    
       :++++++===.              :++++++++=:              :++++++++=.                      
       :++++++=.                :++++++=:                :++++++=.                        
       :++++=:                  :++++=:                  :++++=.                          
       :++=:                    :++=:                    :++=:                            
       :=:                      :=:                      :=:                              
                                                                                          
                                                                                          
     Infinite Tiles v2 - a Juicebox project                                               
*/

import './IInfiniteTiles.sol';
import './ITokenUriResolver.sol';

interface ITileContentProvider is ITokenUriResolver {
  function setParent(IInfiniteTiles) external;

  function getSvgContent(address) external view returns (string memory);
}