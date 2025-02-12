pragma solidity 0.8.15;
// SPDX-License-Identifier: MIT
import "./ERC721A.sol";
import "./Ownable.sol";
import "./MerkleProof.sol";

contract NFT_Contract is ERC721A, Ownable {
    using Strings for uint256;
    mapping(address => uint256) public whitelistClaimed;

    string public baseURI;
    string public baseExtension = ".json";
    uint256 public whitelistCost = 0.04 ether;
    uint256 public publicCost = 0.05 ether;
    bool public whitelistEnabled = false;
    address private wallet1;
    address private wallet2;
    string public UnrevealedURI;
    bool public revealed = false;
    bool public paused = true;
    bytes32 public merkleRoot;
    uint256 public maxWhitelist = 1500;
    uint256 public maxPublic = 8500;
    uint256 public maxSupply = 10000;
    uint256 precentOne;

    constructor(
        string memory _name,
        string memory _symbol,
        string memory _initBaseURI,
        string memory _UnrevealedURI,
        address _wallet1,
        address _wallet2,
        uint256 _W_Precent_One
    ) ERC721A(_name, _symbol) {
        setBaseURI(_initBaseURI);
        setUnrevealedUri(_UnrevealedURI);
        setWallets(_wallet1, _wallet2);
        precentOne = _W_Precent_One;
    }

    function whitelistMint(uint256 quantity, bytes32[] calldata _merkleProof)
        public
        payable
    {
        uint256 supply = totalSupply();
        require(quantity > 0, "Quantity Must Be Higher Than Zero");
        require(supply + quantity <= maxSupply, "Max Supply Reached");
        require(whitelistEnabled, "The whitelist sale is not enabled!");
        require(
            whitelistClaimed[msg.sender] + quantity <= maxWhitelist,
            "You're not allowed to mint this Much!"
        );
        require(msg.value >= whitelistCost * quantity, "Insufficient Funds");
        bytes32 leaf = keccak256(abi.encodePacked(msg.sender));
        require(
            MerkleProof.verify(_merkleProof, merkleRoot, leaf),
            "Invalid proof!"
        );

        whitelistClaimed[msg.sender] += quantity;
        _safeMint(msg.sender, quantity);
    }

    function mint(uint256 quantity) external payable {
        uint256 supply = totalSupply();
        require(!paused, "The contract is paused!");
        require(quantity > 0, "Quantity Must Be Higher Than Zero");
        require(supply + quantity <= maxSupply, "Max Supply Reached");

        if (msg.sender != owner()) {
            require(
                quantity <= maxPublic,
                "You're Not Allowed To Mint more than maxMint Amount"
            );
            require(msg.value >= publicCost * quantity, "Insufficient Funds");
        }
        _safeMint(msg.sender, quantity);
    }

    // internal
    function _baseURI() internal view virtual override returns (string memory) {
        return baseURI;
    }

    function tokenURI(uint256 tokenId)
        public
        view
        virtual
        override
        returns (string memory)
    {
        require(
            _exists(tokenId),
            "ERC721Metadata: URI query for nonexistent token"
        );

        if (revealed == false) {
            return UnrevealedURI;
        }

        string memory currentBaseURI = _baseURI();
        return
            bytes(currentBaseURI).length > 0
                ? string(
                    abi.encodePacked(
                        currentBaseURI,
                        tokenId.toString(),
                        baseExtension
                    )
                )
                : "";
    }

    function setCost(uint256 _whitelistCost, uint256 _publicCost)
        public
        onlyOwner
    {
        whitelistCost = _whitelistCost;
        publicCost = _publicCost;
    }

    function setRevealed(bool _state) public onlyOwner {
        revealed = _state;
    }

    function setUnrevealedUri(string memory _UnrevealedUri) public onlyOwner {
        UnrevealedURI = _UnrevealedUri;
    }

    function setMax(uint256 _whitelist, uint256 _public) public onlyOwner {
        maxWhitelist = _whitelist;
        maxPublic = _public;
    }

    function setMerkleRoot(bytes32 _merkleRoot) public onlyOwner {
        merkleRoot = _merkleRoot;
    }

    function setWhitelistEnabled(bool _state) public onlyOwner {
        whitelistEnabled = _state;
    }

    function setPaused(bool _state) public onlyOwner {
        paused = _state;
    }

    function setBaseURI(string memory _newBaseURI) public onlyOwner {
        baseURI = _newBaseURI;
    }

    function setBaseExtension(string memory _newBaseExtension)
        public
        onlyOwner
    {
        baseExtension = _newBaseExtension;
    }

    function setWallets(address _wallet1, address _wallet2) public onlyOwner {
        wallet1 = _wallet1;
        wallet2 = _wallet2;
    }

    // set precentage of the first wallet ... the secound wallet gets the remaning .
    function setPrecentage(uint256 _Wallet_1_Precentage) public onlyOwner {
        precentOne = _Wallet_1_Precentage;
    }

    function withdraw() public onlyOwner {
        (bool ts, ) = payable(wallet1).call{
            value: (address(this).balance * precentOne) / 100
        }("");
        require(ts);

        (bool os, ) = payable(wallet2).call{value: address(this).balance}("");
        require(os);
    }
}
