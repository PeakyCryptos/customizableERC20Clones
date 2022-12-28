# Clone Pattern Demo

Inspired by the OpenZeppelin workshop [video](https://www.youtube.com/watch?v=3Mw-pMmJ7TA)

This project was created to showcase the gas efficiency of deploying customizable contracts that would point to a common fixed implementation. The most efficient known way to do this is via EIP-1167: Minimal Proxy Contract.

Unlike other proxy standards which include upgrade functionality in either the proxy itself or the implementation, this methodology is meant to have a static implementation address that can never be changed. The purpose of this contract is to solely act as the call forwarder/storage. Which is achievied via delegate calls onto the implementation contract.

The ERC20 contract which was used is a custom contract which adds functionality to OpenZeppelin's ERC20 Capped contract. Allowing for customization of the owner, name, symbol, and max supply.

## Gas Efficiency Breakdown
![image](https://user-images.githubusercontent.com/106453938/209762935-00014bdb-b696-4d56-a71b-23142070e7e4.png)
