require("@nomicfoundation/hardhat-toolbox");
require("dotenv").config();

/**
 * @type import('hardhat/config').HardhatUserConfig
 */
module.exports = {
  solidity: {
    compilers: [
      { version: "0.8.26", settings: {} }
    ]
  },
  networks: {
    "base-sepolia": {
      url: process.env.BASE_SEPOLIA_RPC,
      accounts: [process.env.PRIVATE_KEY]
    }
  }
};
