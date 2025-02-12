// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

import "@openzeppelin/contracts/access/Ownable.sol";
// import "hardhat/console.sol";

contract Crowdfund is Ownable {

	mapping ( address => uint256 ) public balances;
	uint256 public totalContributed = 0;
	address[] contributors;
	address public immutable daoSafeAddress = 0xc5e9Febecd9fD19597566aaE97A61EbCe73b2C8B;
	address public immutable revenueReceiver = 0xC79AE8FF0197FCefBECFfD89347dc4332bfcD4EA; // Sent to personal wallet of Papertree founder for now
	uint8 public immutable revenueShare = 10; // Papertree receives 10% of all contributions as revenue
	uint public immutable minimumContribution = 0.006 ether;

	// A global boolean variable is created to manage pause capabilities called paused
	bool public paused;

	event Contribution(address contributor, uint256 amount);
	event EarnedRevenue(address receiver, uint256 amount, address contributor);

	function contribute() public payable {
		require(paused == false, "Function Paused");
		require(msg.value >= minimumContribution, "Failed to send enough value. Minimum contribution is 0.006 ETH");

		// Receive and keep track of contributions
		if (balances[msg.sender] == 0) {
			contributors.push(msg.sender);
		}
		balances[msg.sender] += msg.value;
		totalContributed += msg.value;
		emit Contribution(msg.sender, msg.value);

		// Send 10% of contribution as revenue
		uint256 revenue =  msg.value / revenueShare;
		address payable receiver = payable(revenueReceiver);
		(bool sentToReceiver, bytes memory receiverData) = receiver.call{value: revenue}("");
		require(sentToReceiver, "Failed to send revenue Ether amount");
		emit EarnedRevenue(receiver, revenue, msg.sender);

		// Send the rest to the DAO
		address payable dao = payable(daoSafeAddress);
		(bool sentToDAO, bytes memory daoData) = dao.call{value: address(this).balance}("");
		require(sentToDAO, "Failed to send DAO Ether amount");
	}

	function withdraw() public onlyOwner {
		address payable owner = payable(msg.sender);
		(bool sent, bytes memory data) = owner.call{value: address(this).balance}("");
		require(sent, "Failed to send Ether");
	}

	function setPaused(bool _paused) public onlyOwner {
		paused = _paused;
	}

	function tip() public payable {
		// allow funds to be received directly to cover things like gas
	}

	// to support receiving ETH by default
	receive() external payable {
		contribute();
	}
	fallback() external {}

}