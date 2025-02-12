pragma solidity ^0.8.9;

import "@openzeppelin/contracts/utils/math/SafeMath.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@uniswap/v2-periphery/contracts/interfaces/IUniswapV2Router02.sol";
import "@uniswap/v2-core/contracts/interfaces/IUniswapV2Factory.sol";

contract MonoFC is ERC20, Ownable {
    using SafeMath for uint256;

    IUniswapV2Router02 public uniswapV2Router;
    address public uniswapV2Pair;

    mapping(address => bool) public excludedFromFees;
    mapping(address => bool) public excludedMaxTransactionAmount;

    uint256 private TOTAL_SUPPLY = 1000000 * 1e18;
    uint256 public maxTransactionAmount;
    uint256 public maxWalletAmount;
    
    uint256 public buyMarketingFee = 5; // 5% for marketing
    uint256 public buyAutoBurnFee = 0; // 
    uint256 public sellMarketingFee = 5; // 5% for marketing
    uint256 public sellAutoBurnFee = 0; // 

    address private marketingWallet = address(0xbC7aCB2C28aCd8030061EBe9DbC6A622F4243768);

    bool public tradingActive = false;

    constructor() ERC20("MonoFC", "MonoFC") {
        uniswapV2Router = IUniswapV2Router02(0x7a250d5630B4cF539739dF2C5dAcb4c659F2488D);
        uniswapV2Pair = IUniswapV2Factory(uniswapV2Router.factory()).createPair(
                address(this),
                uniswapV2Router.WETH()
            );
        _approve(address(this), address(uniswapV2Router), type(uint256).max);

        maxTransactionAmount = TOTAL_SUPPLY / 100; // Max 1% from total supply
        maxWalletAmount = TOTAL_SUPPLY * 5 / 100; // Max 5% from total supply
        
        _updateExcludedFromFees(owner(), true);
        _updateExcludedFromFees(address(this), true);
        _updateExcludedFromFees(marketingWallet, true);
        _updateExcludedFromFees(address(uniswapV2Router), true);
        _updateExcludedFromFees(address(uniswapV2Pair), true);

        _updateExcludedMaxTransactionAmount(owner(), true);
        _updateExcludedMaxTransactionAmount(address(this), true);
        _updateExcludedMaxTransactionAmount(marketingWallet, true);
        _updateExcludedMaxTransactionAmount(address(uniswapV2Router), true);
        _updateExcludedMaxTransactionAmount(address(uniswapV2Pair), true);

        _mint(_msgSender(), TOTAL_SUPPLY);
    }

    function _updateExcludedFromFees(address _address, bool exclude) private {
        excludedFromFees[_address] = exclude;
    }

    function _updateExcludedMaxTransactionAmount(address _address, bool exclude) private {
        excludedMaxTransactionAmount[_address] = exclude;
    }

    function _transfer(
        address from,
        address to,
        uint256 amount
    ) internal override {
        require(from != address(0), "ERC20: transfer from the zero address");
        require(to != address(0), "ERC20: transfer to the zero address");
        require(amount > 0, 'Transfer amount must be greater than zero');
        require(tradingActive || excludedFromFees[from] || excludedFromFees[to], "Trading is not active.");
        if (from == uniswapV2Pair && !excludedMaxTransactionAmount[to]) {
            require(amount <= maxTransactionAmount, "Exceeds the maxTransactionAmount." );
            require(balanceOf(to) + amount <= maxWalletAmount, 'Exceeds the maxWalletAmount.');
        }

        uint256 newAmount = amount;

        // Buy
        if (from == uniswapV2Pair) {
            uint256 marketingFee = (amount * buyMarketingFee) / 100;
            if (marketingFee > 0) {
                super._transfer(from, address(this), marketingFee);
                newAmount = amount - marketingFee;
            }
            uint256 burnFee = (amount * buyAutoBurnFee) / 100;
            if (burnFee > 0) {
                super._burn(from, burnFee);
                newAmount = amount - burnFee;
            }
        }

        // Sell
        if (to == uniswapV2Pair) {
            uint256 marketingFee = (amount * sellMarketingFee) / 100;
            if (marketingFee > 0) {
                super._transfer(from, address(this), marketingFee);
                newAmount = amount - marketingFee;
            }
            uint256 burnFee = (amount * sellAutoBurnFee) / 100;
            if (burnFee > 0) {
                super._burn(from, burnFee);
                newAmount = amount - burnFee;
            }
        }

        super._transfer(from, to, newAmount);
    }

    function enableTrading() public onlyOwner {
        tradingActive = true;
    }

    function removeLimits() public onlyOwner {
        maxTransactionAmount = TOTAL_SUPPLY;
        maxWalletAmount = TOTAL_SUPPLY;
    }

    function updateExcludedFromFees(address _address, bool value) public onlyOwner {
        _updateExcludedFromFees(_address, value);
    }

    function updateExcludedMaxTransactionAmount(address _address, bool value) public onlyOwner {
        _updateExcludedMaxTransactionAmount(_address, value);
    }

    function setBuyMarketingFee(uint256 percent) public onlyOwner {
        require(percent <= 5, "Marketing fee must be lesser than 5");
        buyMarketingFee = percent;
    }

    function setSellMarketingFee(uint256 percent) public onlyOwner {
        require(percent <= 5, "Marketing fee must be lesser than 5");
        sellMarketingFee = percent;
    }

    function setBuyAutoBurnFee(uint256 percent) public onlyOwner {
        require(percent <= 3, "Marketing fee must be lesser than 3");
        buyAutoBurnFee = percent;
    }

    function setSellAutoBurnFee(uint256 percent) public onlyOwner {
        require(percent <= 3, "Marketing fee must be lesser than 3");
        sellAutoBurnFee = percent;
    }

    function mintMarketingToken() public onlyOwner {
        uint256 contractTokenBalance = balanceOf(address(this));
        super._transfer(address(this), marketingWallet, contractTokenBalance);
    }
}