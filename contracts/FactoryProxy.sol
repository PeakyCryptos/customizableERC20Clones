// SPDX-License-Identifier: MIT
pragma solidity 0.8.17;

import "./targetCustomERC20.sol";
import "@openzeppelin/contracts-upgradeable/token/ERC20/extensions/ERC20CappedUpgradeable.sol";
import "@openzeppelin/contracts/proxy/ERC1967/ERC1967Proxy.sol";

contract FactoryERC1967Proxy {
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
        ERC1967Proxy proxy = new ERC1967Proxy(
            tokenImplementation,
            abi.encodeWithSelector(
                targetCustomERC20.initialize.selector,
                _owner,
                _tokenName,
                _tokenSymbol,
                _tokenSupplyCap
            )
        );
        return address(proxy);
    }
}
