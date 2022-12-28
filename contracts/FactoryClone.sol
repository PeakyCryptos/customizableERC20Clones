// SPDX-License-Identifier: MIT

pragma solidity 0.8.17;

import "./targetCustomERC20.sol";
import "@openzeppelin/contracts-upgradeable/token/ERC20/extensions/ERC20CappedUpgradeable.sol";
import "@openzeppelin/contracts/proxy/Clones.sol";

contract FactoryClone {
    address immutable tokenImplementation;

    constructor() public {
        tokenImplementation = address(new targetCustomERC20());
    }

    function createToken(
        address _owner,
        string calldata _tokenName,
        string calldata _tokenSymbol,
        uint256 _tokenSupplyCap
    ) external returns (address) {
        address clone = Clones.clone(tokenImplementation);
        targetCustomERC20(clone).initialize(
            _owner,
            _tokenName,
            _tokenSymbol,
            _tokenSupplyCap
        );
        return clone;
    }
}
