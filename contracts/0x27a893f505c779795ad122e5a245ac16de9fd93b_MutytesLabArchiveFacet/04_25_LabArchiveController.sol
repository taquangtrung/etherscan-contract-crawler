// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import { ILabArchiveController } from "./ILabArchiveController.sol";
import { LabArchiveModel } from "./LabArchiveModel.sol";
import { ERC721ApprovableController } from "../../../core/token/ERC721/approvable/ERC721ApprovableController.sol";
import { OwnableController } from "../../../core/access/ownable/OwnableController.sol";
import { AddressUtils } from "../../../core/utils/AddressUtils.sol";
import { IntegerUtils } from "../../../core/utils/IntegerUtils.sol";

abstract contract LabArchiveController is
    ILabArchiveController,
    LabArchiveModel,
    ERC721ApprovableController,
    OwnableController
{
    using AddressUtils for address;
    using IntegerUtils for uint256;

    function mutyteByName_(string memory name)
        internal
        view
        virtual
        returns (uint256 tokenId)
    {
        tokenId = _mutyteByName(name);
        _enforceTokenExists(tokenId);
    }

    function mutyteName_(uint256 tokenId) internal view virtual returns (string memory) {
        _enforceTokenExists(tokenId);
        return _mutyteName(tokenId);
    }

    function mutyteDescription_(uint256 tokenId)
        internal
        view
        virtual
        returns (string memory)
    {
        _enforceTokenExists(tokenId);
        return _mutyteDescription(tokenId);
    }

    function mutationName_(uint256 mutationId)
        internal
        view
        virtual
        returns (string memory)
    {
        return _mutationName(mutationId);
    }

    function mutationDescription_(uint256 mutationId)
        internal
        view
        virtual
        returns (string memory)
    {
        return _mutationDescription(mutationId);
    }

    function setMutyteName_(uint256 tokenId, string memory name) internal virtual {
        _enforceIsApproved(_ownerOf(tokenId), msg.sender, tokenId);
        _enforceIsValidName(bytes(name));
        _ownerOf(_mutyteByName(name)).enforceIsZeroAddress();
        _setMutyteName(tokenId, name, _mutyteName(tokenId));
    }

    function setMutyteDescription_(uint256 tokenId, string memory desc) internal virtual {
        _enforceIsApproved(_ownerOf(tokenId), msg.sender, tokenId);
        _enforceIsValidDescription(bytes(desc));
        _setMutyteDescription(tokenId, desc);
    }

    function setMutationName_(uint256 mutationId, string memory name) internal virtual {
        _enforceIsValidName(bytes(name));
        _setMutationName(mutationId, name);
    }

    function setMutationDescription_(uint256 mutationId, string memory desc)
        internal
        virtual
    {
        _enforceIsValidDescription(bytes(desc));
        _setMutationDescription(mutationId, desc);
    }

    function _maxNameLength() internal view virtual returns (uint256) {
        return 16;
    }

    function _maxDescriptionLength() internal view virtual returns (uint256) {
        return 256;
    }

    function _enforceIsValidName(bytes memory name) internal view virtual {
        uint256 length = name.length;
        length.enforceNotGreaterThan(_maxNameLength());
        bool whitespace = length > 0;

        unchecked {
            for (uint256 i; i < length; i++) {
                uint8 c = uint8(name[i]);

                if (c == 32) {
                    continue;
                } else if (
                    (c > 96 && c < 123) || // [a-z]
                    (c > 64 && c < 91) || // [A-Z]
                    (c > 47 && c < 59) || // [0-9:]
                    (c == 39) || // [']
                    (c > 43 && c < 47) // [,-.]
                ) {
                    if (whitespace) {
                        whitespace = false;
                    }

                    continue;
                }

                revert UnexpectedCharacter(c);
            }
        }

        if (whitespace) {
            revert UnexpectedWhitespaceString();
        }
    }

    function _enforceIsValidDescription(bytes memory desc) internal view virtual {
        uint256 length = desc.length;
        length.enforceNotGreaterThan(_maxDescriptionLength());
        bool whitespace = length > 0;

        unchecked {
            for (uint256 i; i < length; i++) {
                uint8 c = uint8(desc[i]);

                if (c == 32) {
                    continue;
                } else if (c > 32 && c < 127 && c != 34) {
                    if (whitespace) {
                        whitespace = false;
                    }

                    if (c != 92 || i < length - 1) {
                        continue;
                    }
                }

                revert UnexpectedCharacter(c);
            }
        }

        if (whitespace) {
            revert UnexpectedWhitespaceString();
        }
    }
}