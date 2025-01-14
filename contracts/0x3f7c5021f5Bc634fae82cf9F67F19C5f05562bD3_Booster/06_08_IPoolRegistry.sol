// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

interface IPoolRegistry {
	function poolLength() external view returns (uint256);

	function poolInfo(uint256 _pid)
		external
		view
		returns (
			address,
			address,
			address,
			address,
			uint8
		);

	function vaultMap(uint256 _pid, address _user) external view returns (address vault);
	
	function vaultPid(address _vault) external view returns(uint256 pid);

	function addUserVault(uint256 _pid, address _user)
		external
		returns (
			address vault,
			address stakeAddress,
			address stakeToken,
			address rewards
		);

	function deactivatePool(uint256 _pid) external;

	function createNewPoolRewards(uint256 _pid) external;

	function addPool(
		address _implementation,
		address _stakingAddress,
		address _stakingToken
	) external;

	function setRewardImplementation(address _imp) external;

	function setDistributor(address _distributor) external;

	function setOperator(address _op) external;
}