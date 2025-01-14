# @version 0.3.6

# @dev Implementation of ERC-721 Enumerable  standard
# @author Volume Finance

from vyper.interfaces import ERC165
from vyper.interfaces import ERC721

implements: ERC721
implements: ERC165

# Interface for the contract called by safeTransferFrom()
interface ERC721Receiver:
    def onERC721Received(
            _operator: address,
            _from: address,
            _tokenId: uint256,
            _data: Bytes[1024]
        ) -> bytes4: view


# @dev Emits when ownership of any NFT changes by any mechanism. This event emits when NFTs are
#      created (`from` == 0) and destroyed (`to` == 0). Exception: during contract creation, any
#      number of NFTs may be created and assigned without emitting Transfer. At the time of any
#      transfer, the approved address for that NFT (if any) is reset to none.
# @param _from Sender of NFT (if address is zero address it indicates token creation).
# @param _to Receiver of NFT (if address is zero address it indicates token destruction).
# @param _tokenId The NFT that got transfered.
event Transfer:
    _from: indexed(address)
    _to: indexed(address)
    _tokenId: indexed(uint256)

# @dev This emits when the approved address for an NFT is changed or reaffirmed. The zero
#      address indicates there is no approved address. When a Transfer event emits, this also
#      indicates that the approved address for that NFT (if any) is reset to none.
# @param _owner Owner of NFT.
# @param _approved Address that we are approving.
# @param _tokenId NFT which we are approving.
event Approval:
    _owner: indexed(address)
    _approved: indexed(address)
    _tokenId: indexed(uint256)

# @dev This emits when an operator is enabled or disabled for an owner. The operator can manage
#      all NFTs of the owner.
# @param _owner Owner of NFT.
# @param _operator Address to which we are setting operator rights.
# @param _approved Status of operator rights(true if operator rights are given and false if
# revoked).
event ApprovalForAll:
    _owner: indexed(address)
    _operator: indexed(address)
    _approved: bool

event Minted:
    eth_address: indexed(address)
    paloma_address: indexed(String[64])
    token_id: indexed(uint256)

event SetMinter:
    new_minter: indexed(address)
    old_minter: indexed(address)

# @dev Mapping from NFT ID to the address that owns it.
id_to_owner: HashMap[uint256, address]

# @dev Mapping from NFT ID to approved address.
id_to_approvals: HashMap[uint256, address]

# @dev Mapping from owner address to count of his tokens.
owner_to_token_count: HashMap[address, uint256]

# @dev Mapping from owner address to mapping of operator addresses.
owner_to_operators: HashMap[address, HashMap[address, bool]]

owned_tokens_index: HashMap[uint256, uint256]

owned_tokens: HashMap[address, HashMap[uint256, uint256]]

all_tokens: HashMap[uint256, uint256]

totalSupply: public(uint256)

# @dev Address of minter, who can mint a token
minter: public(address)

BASE_URL: constant(String[38]) = "https://eggs.palomachain.com/metadata/"

# @dev Static list of supported ERC165 interface ids
SUPPORTED_INTERFACES: constant(bytes4[4]) = [
    # ERC165 interface ID of ERC165
    0x01ffc9a7,
    # ERC165 interface ID of ERC721
    0x80ac58cd,
    # ERC165 interface ID of ERC721Metadata
    0x5b5e139f,
    # ERC165 interface ID of ERC721Enumerable
    0x780e9d63
]

@external
def __init__(_minter: address):
    """
    @dev Contract constructor.
    """
    self.minter = _minter
    log SetMinter(_minter, empty(address))

@external
@pure
def name() -> String[10]:
    return "Paloma Egg"


@external
@pure
def symbol() -> String[9]:
    return "PALOMAEGG"


@external
@pure
def supportsInterface(interface_id: bytes4) -> bool:
    """
    @dev Interface identification is specified in ERC-165.
    @param interface_id Id of the interface
    """
    return interface_id in SUPPORTED_INTERFACES


### VIEW FUNCTIONS ###

@external
@view
def balanceOf(_owner: address) -> uint256:
    """
    @dev Returns the number of NFTs owned by `_owner`.
         Throws if `_owner` is the zero address. NFTs assigned to the zero address are considered invalid.
    @param _owner Address for whom to query the balance.
    """
    assert _owner != empty(address)
    return self.owner_to_token_count[_owner]


@external
@view
def ownerOf(_tokenId: uint256) -> address:
    """
    @dev Returns the address of the owner of the NFT.
         Throws if `_tokenId` is not a valid NFT.
    @param _tokenId The identifier for an NFT.
    """
    owner: address = self.id_to_owner[_tokenId]
    # Throws if `_tokenId` is not a valid NFT
    assert owner != empty(address)
    return owner


@external
@view
def getApproved(_tokenId: uint256) -> address:
    """
    @dev Get the approved address for a single NFT.
         Throws if `_tokenId` is not a valid NFT.
    @param _tokenId ID of the NFT to query the approval of.
    """
    # Throws if `_tokenId` is not a valid NFT
    assert self.id_to_owner[_tokenId] != empty(address)
    return self.id_to_approvals[_tokenId]


@external
@view
def isApprovedForAll(_owner: address, _operator: address) -> bool:
    """
    @dev Checks if `_operator` is an approved operator for `_owner`.
    @param _owner The address that owns the NFTs.
    @param _operator The address that acts on behalf of the owner.
    """
    return (self.owner_to_operators[_owner])[_operator]


### TRANSFER FUNCTION HELPERS ###

@internal
@view
def is_approved_or_owner(_spender: address, _tokenId: uint256) -> bool:
    """
    @dev Returns whether the given spender can transfer a given token ID
    @param spender address of the spender to query
    @param tokenId uint256 ID of the token to be transferred
    @return bool whether the msg.sender is approved for the given token ID,
        is an operator of the owner, or is the owner of the token
    """
    owner: address = self.id_to_owner[_tokenId]
    spenderIsOwner: bool = owner == _spender
    spenderIsApproved: bool = _spender == self.id_to_approvals[_tokenId]
    spenderIsApprovedForAll: bool = (self.owner_to_operators[owner])[_spender]
    return (spenderIsOwner or spenderIsApproved) or spenderIsApprovedForAll


@internal
def add_token_to(_to: address, _tokenId: uint256):
    """
    @dev Add a NFT to a given address
         Throws if `_tokenId` is owned by someone.
    """
    # Throws if `_tokenId` is owned by someone
    assert self.id_to_owner[_tokenId] == empty(address)
    # Change the owner
    self.id_to_owner[_tokenId] = _to
    # Change count tracking
    length: uint256 = self.owner_to_token_count[_to]

    self.owned_tokens[_to][length] = _tokenId
    self.owned_tokens_index[_tokenId] = length

    self.owner_to_token_count[_to] = length + 1


@internal
def remove_token_from(_from: address, _tokenId: uint256):
    """
    @dev Remove a NFT from a given address
         Throws if `_from` is not the current owner.
    """
    # Throws if `_from` is not the current owner
    assert self.id_to_owner[_tokenId] == _from
    # Change the owner
    self.id_to_owner[_tokenId] = empty(address)
    # Change count tracking

    last_token_index: uint256 = self.owner_to_token_count[_from] - 1
    token_index: uint256 = self.owned_tokens_index[_tokenId]
    if token_index != last_token_index:
        last_token_id: uint256 = self.owned_tokens[_from][last_token_index]
        self.owned_tokens[_from][token_index] = last_token_id
        self.owned_tokens_index[last_token_id] = token_index
    self.owned_tokens_index[_tokenId] = 0
    self.owned_tokens[_from][last_token_index] = 0

    self.owner_to_token_count[_from] = last_token_index


@internal
def clear_approval(_owner: address, _tokenId: uint256):
    """
    @dev Clear an approval of a given address
         Throws if `_owner` is not the current owner.
    """
    # Throws if `_owner` is not the current owner
    assert self.id_to_owner[_tokenId] == _owner
    if self.id_to_approvals[_tokenId] != empty(address):
        # Reset approvals
        self.id_to_approvals[_tokenId] = empty(address)


@internal
def transfer_from(_from: address, _to: address, _tokenId: uint256, _sender: address):
    """
    @dev Exeute transfer of a NFT.
         Throws unless `msg.sender` is the current owner, an authorized operator, or the approved
         address for this NFT. (NOTE: `msg.sender` not allowed in private function so pass `_sender`.)
         Throws if `_to` is the zero address.
         Throws if `_from` is not the current owner.
         Throws if `_tokenId` is not a valid NFT.
    """
    # Check requirements
    assert self.is_approved_or_owner(_sender, _tokenId)
    # Throws if `_to` is the zero address
    assert _to != empty(address)
    # Clear approval. Throws if `_from` is not the current owner
    self.clear_approval(_from, _tokenId)
    # Remove NFT. Throws if `_tokenId` is not a valid NFT
    self.remove_token_from(_from, _tokenId)
    # Add NFT
    self.add_token_to(_to, _tokenId)
    # Log the transfer
    log Transfer(_from, _to, _tokenId)


### TRANSFER FUNCTIONS ###

@external
def transferFrom(_from: address, _to: address, _tokenId: uint256):
    """
    @dev Throws unless `msg.sender` is the current owner, an authorized operator, or the approved
         address for this NFT.
         Throws if `_from` is not the current owner.
         Throws if `_to` is the zero address.
         Throws if `_tokenId` is not a valid NFT.
    @notice The caller is responsible to confirm that `_to` is capable of receiving NFTs or else
            they maybe be permanently lost.
    @param _from The current owner of the NFT.
    @param _to The new owner.
    @param _tokenId The NFT to transfer.
    """
    self.transfer_from(_from, _to, _tokenId, msg.sender)


@external
def safeTransferFrom(
        _from: address,
        _to: address,
        _tokenId: uint256,
        _data: Bytes[1024]=b""
    ):
    """
    @dev Transfers the ownership of an NFT from one address to another address.
         Throws unless `msg.sender` is the current owner, an authorized operator, or the
         approved address for this NFT.
         Throws if `_from` is not the current owner.
         Throws if `_to` is the zero address.
         Throws if `_tokenId` is not a valid NFT.
         If `_to` is a smart contract, it calls `onERC721Received` on `_to` and throws if
         the return value is not `bytes4(keccak256("onERC721Received(address,address,uint256,bytes)"))`.
    @param _from The current owner of the NFT.
    @param _to The new owner.
    @param _tokenId The NFT to transfer.
    @param _data Additional data with no specified format, sent in call to `_to`.
    """
    self.transfer_from(_from, _to, _tokenId, msg.sender)
    if _to.is_contract: # check if `_to` is a contract address
        returnValue: bytes4 = ERC721Receiver(_to).onERC721Received(msg.sender, _from, _tokenId, _data)
        # Throws if transfer destination is a contract which does not implement 'onERC721Received'
        assert returnValue == convert(method_id("onERC721Received(address,address,uint256,bytes)"), bytes4)


@external
def approve(_approved: address, _tokenId: uint256):
    """
    @dev Set or reaffirm the approved address for an NFT. The zero address indicates there is no approved address.
         Throws unless `msg.sender` is the current NFT owner, or an authorized operator of the current owner.
         Throws if `_tokenId` is not a valid NFT. (NOTE: This is not written the EIP)
         Throws if `_approved` is the current owner. (NOTE: This is not written the EIP)
    @param _approved Address to be approved for the given NFT ID.
    @param _tokenId ID of the token to be approved.
    """
    owner: address = self.id_to_owner[_tokenId]
    # Throws if `_tokenId` is not a valid NFT
    assert owner != empty(address)
    # Throws if `_approved` is the current owner
    assert _approved != owner
    # Check requirements
    senderIsOwner: bool = self.id_to_owner[_tokenId] == msg.sender
    senderIsApprovedForAll: bool = (self.owner_to_operators[owner])[msg.sender]
    assert (senderIsOwner or senderIsApprovedForAll)
    # Set the approval
    self.id_to_approvals[_tokenId] = _approved
    log Approval(owner, _approved, _tokenId)


@external
def setApprovalForAll(_operator: address, _approved: bool):
    """
    @dev Enables or disables approval for a third party ("operator") to manage all of
         `msg.sender`'s assets. It also emits the ApprovalForAll event.
         Throws if `_operator` is the `msg.sender`. (NOTE: This is not written the EIP)
    @notice This works even if sender doesn't own any tokens at the time.
    @param _operator Address to add to the set of authorized operators.
    @param _approved True if the operators is approved, false to revoke approval.
    """
    # Throws if `_operator` is the `msg.sender`
    assert _operator != msg.sender
    self.owner_to_operators[msg.sender][_operator] = _approved
    log ApprovalForAll(msg.sender, _operator, _approved)


### MINT FUNCTION ###
@external
def mint(_to: address, _paloma_address: String[64]) -> bool:
    """
    @dev Function to mint tokens
         Throws if `msg.sender` is not the minter.
         Throws if `_to` is zero address.
    @param _to The address that will receive the minted tokens.
    @return A boolean that indicates if the operation was successful.
    """
    # Throws if `msg.sender` is not the minter
    assert msg.sender == self.minter
    # Throws if `_to` is zero address
    assert _to != empty(address)
    # Add NFT. Throws if `_tokenId` is owned by someone
    total_supply: uint256 = self.totalSupply
    self.add_token_to(_to, total_supply)
    self.all_tokens[total_supply] = total_supply
    self.totalSupply = total_supply + 1

    log Transfer(empty(address), _to, total_supply)
    log Minted(_to, _paloma_address, total_supply)
    return True


@external
def set_minter(_minter: address):
    assert msg.sender == self.minter
    self.minter = _minter
    log SetMinter(_minter, msg.sender)


@external
@pure
def tokenURI(tokenId: uint256) -> String[116]:
    return concat(BASE_URL, uint2str(tokenId))

### ERC721Enumerable FUNCTION ###
@external
@view
def tokenOfOwnerByIndex(owner: address, index: uint256) -> uint256:
    assert index < self.owner_to_token_count[owner]
    return self.owned_tokens[owner][index]

@external
@view
def tokenByIndex(index: uint256) -> uint256:
    assert index < self.totalSupply
    return self.all_tokens[index]