// SPDX-License-Identifier: BUSL-1.1
pragma solidity ^0.8.26;

import {IPOLErrors} from "./IPOLErrors.sol";
import {IStakingRewards} from "../base/IStakingRewards.sol";

interface IRewardVault is IPOLErrors, IStakingRewards {

    /// @notice Stake tokens in the vault.
    /// @param amount The amount of tokens to stake.
    function stake(uint256 amount) external;

    /// @notice Allows msg.sender to set another address to claim and manage their rewards.
    /// @param _operator The address that will be allowed to claim and manage rewards.
    function setOperator(address _operator) external;

    /// @notice Add an incentive token to the vault.
    /// @notice The incentive token's transfer should not exceed a gas usage of 500k units.
    /// In case the transfer exceeds 500k gas units, your incentive will fail to be transferred to the validator and
    /// its delegates.
    /// @param token The address of the token to add as an incentive.
    /// @param amount The amount of the token to add as an incentive.
    /// @param incentiveRate The amount of the token to incentivize per BGT emission.
    /// @dev Permissioned function, only callable by incentive token manager.
    function addIncentive(
        address token,
        uint256 amount,
        uint256 incentiveRate
    ) external;

    /// @notice Withdraw the staked tokens from the vault.
    /// @param amount The amount of tokens to withdraw.
    function withdraw(uint256 amount) external;

    /// @notice Stake tokens on behalf of another account.
    /// @param account The account to stake for.
    /// @param amount The amount of tokens to stake.
    function delegateStake(address account, uint256 amount) external;


    /// @notice Withdraw tokens staked on behalf of another account by the delegate (msg.sender).
    /// @param account The account to withdraw for.
    /// @param amount The amount of tokens to withdraw.
    function delegateWithdraw(address account, uint256 amount) external;
}
