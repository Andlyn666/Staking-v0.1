// SPDX-License-Identifier: MIT
pragma solidity >=0.8.10;

/// @notice Owner functions restricted to the setup and maintenance
/// of the staking contract by the owner.
interface IStakingOwner {
    /// @notice This error is thrown when an zero delegation rate is supplied
    error InvalidDelegationRate();

    /// @notice This error is thrown when an invalid operator stake amount is
    /// supplied
    error InvalidOperatorStakeAmount();

    /// @notice This error is thrown when an invalid min community stake amount
    /// is supplied
    error InvalidMinCommunityStakeAmount();

    /// @notice Adds one or more operators to a list of operators
    /// @dev Should only callable by the Owner
    /// @param operators A list of operator addresses to add
    function addOperators(address[] calldata operators) external;

    /// @notice This function can be called to add rewards to the pool
    /// @dev Should only be callable by the owner
    /// @param amount The amount of rewards to add to the pool
    function addReward(uint256 amount, uint256 rewardDuration) external;

    /// @notice Set the pool config
    /// @param maxPoolSize The max amount of staked ARPA by community stakers allowed in the pool
    /// @param maxCommunityStakeAmount The max amount of ARPA a community staker can stake
    function setPoolConfig(uint256 maxPoolSize, uint256 maxCommunityStakeAmount) external;

    /// @notice Set controller contract address
    /// @dev Should only be callable by the owner
    function setController(address controller) external;

    /// @notice Transfers ARPA tokens and initializes the reward
    /// @dev Uses ERC20 approve + transferFrom flow
    /// @param amount rewards amount in ARPA
    /// @param nextUnlockCycleInDays The number of days in the next unlock cycle
    /// each ARPA staked.
    function start(uint256 amount, uint256 nextUnlockCycleInDays) external;

    /// @notice This function pauses staking
    /// @dev Sets the pause flag to true
    function emergencyPause() external;

    /// @notice This function unpauses staking
    /// @dev Sets the pause flag to false
    function emergencyUnpause() external;
}