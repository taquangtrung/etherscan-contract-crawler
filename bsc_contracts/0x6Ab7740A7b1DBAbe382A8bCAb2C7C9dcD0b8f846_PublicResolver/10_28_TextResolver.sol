// SPDX-License-Identifier: MIT
pragma solidity >=0.8.4;

import "../ResolverBase.sol";
import "./ITextResolver.sol";

abstract contract TextResolver is ITextResolver, ResolverBase {
    mapping(bytes32 => mapping(string => string)) texts;

    /**
     * Sets the text data associated with an COMID node and key.
     * May only be called by the owner of that node in the COMID registry.
     * @param node The node to update.
     * @param key The key to set.
     * @param value The text data value to set.
     */
    function setText(
        bytes32 node,
        string calldata key,
        string calldata value
    ) external virtual authorised(node) {
        texts[node][key] = value;
        emit TextChanged(node, key, key);
    }

    /**
     * Returns the text data associated with an COMID node and key.
     * @param node The COMID node to query.
     * @param key The text data key to query.
     * @return The associated text data.
     */
    function text(bytes32 node, string calldata key)
        external
        view
        virtual
        override
        returns (string memory)
    {
        return texts[node][key];
    }

    function supportsInterface(bytes4 interfaceID)
        public
        pure
        virtual
        override
        returns (bool)
    {
        return
            interfaceID == type(ITextResolver).interfaceId ||
            super.supportsInterface(interfaceID);
    }
}