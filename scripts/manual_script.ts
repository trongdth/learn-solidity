import "@nomicfoundation/hardhat-ethers";
import { ethers } from "hardhat";

const JAN_1ST_2030 = 1893456000;
const ONE_GWEI: bigint = 1_000_000_000n;

async function main() {
  const [owner] = await ethers.getSigners();
  console.log("Deploying contracts with the account: ", owner.address);
  console.log("Account balance: ", (await owner.provider.getBalance(owner)).toString());

}

main()
  .then(() => process.exit(0))
  .catch((error) => {
    console.error(error);
    process.exit(1);
  });
