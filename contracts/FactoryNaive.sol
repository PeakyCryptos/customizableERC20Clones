// SPDX-License-Identifier: MIT
pragma solidity 0.8.17;

import "./targetCustomERC20.sol";
import "@openzeppelin/contracts-upgradeable/token/ERC20/extensions/ERC20CappedUpgradeable.sol";

contract FactoryNaive {
    function createToken(
        address _owner,
        string calldata _tokenName,
        string calldata _tokenSymbol,
        uint256 _tokenSupplyCap
    ) external returns (address) {
        targetCustomERC20 token = new targetCustomERC20();
        token.initialize(_owner, _tokenName, _tokenSymbol, _tokenSupplyCap);
        return address(token);
    }
}
