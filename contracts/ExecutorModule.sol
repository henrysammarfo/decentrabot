// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

interface IGnosisSafe {
    function execTransaction(
        address to,
        uint256 value,
        bytes calldata data,
        uint8 operation,
        uint256 safeTxGas,
        uint256 baseGas,
        uint256 gasPrice,
        address gasToken,
        address refundReceiver,
        bytes calldata signatures
    ) external returns (bool success);
}

contract ExecutorModule {
    IGnosisSafe public safe;

    constructor(address _safe) {
        safe = IGnosisSafe(_safe);
    }

    function execute(
        address to,
        uint256 value,
        bytes calldata data,
        bytes calldata signatures
    ) external {
        // All parameters needed for execTransaction must be provided
        safe.execTransaction(
            to,
            value,
            data,
            0,              // operation: 0 = CALL
            0,              // safeTxGas: set to 0, Safe estimates gas
            0,              // baseGas: usually 0
            0,              // gasPrice: usually 0 (Safe gas estimation)
            address(0),     // gasToken: set zero for ETH
            address(0),     // refundReceiver
            signatures      // concatenated owner signatures
        );
    }
}
