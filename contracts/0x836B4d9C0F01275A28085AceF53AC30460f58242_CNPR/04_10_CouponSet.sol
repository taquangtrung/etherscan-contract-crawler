// SPDX-License-Identifier: MIT
pragma solidity ^0.8.6;

/**
 *  @title Coupon set methods specified address.
 *  @notice Contains the methods necessary to authenticate the coupon.
 */
library CouponSet {
    // The coupon struct generated by the signing process off-chain
    struct Coupon {
        bytes32 r;
        bytes32 s;
        uint8 v;
    }

    // The coupon type
    enum CouponType {
        Presale,
        BurnMint
    }

    /**
     *  @notice Check if the coupon you were given is the correct one.
     *  @dev Use the ecrecover function to recover the public address and check if it is the same as the address set on the contract side.
     *  @param _coupon Coupon for verifying the signer.
     *  @param _couponType The coupon type used by _createDigest.
     *  @param _allotted The total number of tokens that can be claimed by miners used in _createDigest.
     *  @param _index Index of coupon used in _createDigest.
     *  @param _adminSigner Address of adminSigner.
     *  @return True or false.
     */
    function _isVerifiedCoupon(
        Coupon memory _coupon,
        CouponType _couponType,
        uint256 _allotted,
        uint256 _index,
        address _adminSigner
    ) internal view returns (bool) {
        bytes32 digest = _createDigest(_couponType, _allotted, _index);
        address signer = ecrecover(digest, _coupon.v, _coupon.r, _coupon.s);
        require(signer != address(0), "ECDSA: invalid signature");
        return signer == _adminSigner;
    }

    /**
     *  @notice Creates the encrypted data needed to authenticate the coupon.
     *  @dev Create a 32-byte hash from the coupon type, the total number that can be requested, and the sender's address.
     *  @param _couponType The coupon type(Presale or BurnMint).
     *  @param _allotted The total number of tokens the minter is allowed to claim.
     *  @param _index Index of coupon.
     *  @return A 32-byte hash created from the coupon type, the total number of coupons that can be requested, and the sender's address.
     */
    function _createDigest(
        CouponType _couponType,
        uint256 _allotted,
        uint256 _index
    ) internal view returns (bytes32) {
        return
            keccak256(abi.encode(_couponType, _allotted, _index, msg.sender));
    }
}