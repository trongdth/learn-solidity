import { HardhatUserConfig } from "hardhat/config";
import "@nomicfoundation/hardhat-toolbox";
import "hardhat-abi-exporter";
import "hardhat-gas-reporter";
import * as dotenv from "dotenv";

dotenv.config();

const config: HardhatUserConfig = {
  solidity: "0.8.24",
};

const {
  PRIVATE_KEY: privateKey,
  REPORT_GAS: reportGas,
} = process.env;

module.exports = {
  networks: {
    "localhost": {
      url: "http://127.0.0.1:8545/",
      chainId: 31337,
      accounts: [privateKey],
      timeout: 2_147_483_647,
    },
    sepolia: {
      url: "https://rpc.sepolia.org",
      accounts: [privateKey],
      timeout: 2_147_483_647,
    },
    "metis-sepolia": {
      url: "https://sepolia.metisdevops.link",
      chainId: 59902,
      accounts: [privateKey],
      timeout: 2_147_483_647,
    },
    "metis": {
      url: "https://andromeda.metis.io/?owner=1088",
      chainId: 1088,
      accounts: [privateKey],
      timeout: 2_147_483_647,
    }
  },
  solidity: {
    version: "0.8.24",
    settings: {
      optimizer: {
        enabled: true,
        runs: 1000,
      },
    },
  },
  abiExporter: {
    path: "data/abi",
    runOnCompile: true,
    clear: true,
    flat: true,
    only: [],
    spacing: 4,
  },
  gasReporter: {
    enable: reportGas == "1",
  },
  mocha: {
    timeout: 20000,
  },
}

export default config;