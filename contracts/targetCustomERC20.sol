//SPDX-License-Identifier: MIT
pragma solidity 0.8.17;

// Upgradeable contracts
import "@openzeppelin/contracts-upgradeable/token/ERC20/extensions/ERC20CappedUpgradeable.sol";
import "@openzeppelin/contracts-upgradeable/proxy/utils/Initializable.sol";

contract targetCustomERC20 is Initializable, ERC20CappedUpgradeable {
    address public owner;

    // @dev  must set implementation and initalize in the same transaction
    function initialize(
        address _owner,
        string calldata _tokenName,
        string calldata _tokenSymbol,
        uint256 _tokenSupplyCap
    ) external initializer {
        // ERC20 initilization
        owner = _owner;
        __ERC20_init(_tokenName, _tokenSymbol);
        __ERC20Capped_init(_tokenSupplyCap);

        // mint to deployer
        _mint(owner, _tokenSupplyCap);
    }
}
