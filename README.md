# Clone Pattern Demo

Inspired by the OpenZeppelin workshop [video](https://www.youtube.com/watch?v=3Mw-pMmJ7TA)

This project was created to showcase the gas efficiency of deploying contracts that would point to a common implementation. The most efficient known way to do this is via EIP-1167: Minimal Proxy Contract.

Unlike other proxy standards which include upgrade functionality in either the proxy itself or the implementation, this methodology is meant to have a fixed implementation address that can never be changed. The purpose of this contract is to solely act as the call forwarder/storage. Which is achievied via delegate calls onto the implementation contract.

The ERC20 contract which is used is a custom contract which adds functionality to OpenZeppelin's ERC20 Capped contract. Allowing for customization of the owner, name, symbol, and max supply.

## Gas Efficiency Breakdown
