import "@nomicfoundation/hardhat-ethers";
import { ethers } from "hardhat";

const JAN_1ST_2030 = 1893456000;
const ONE_GWEI: bigint = 1_000_000_000n;

async function main() {
  const [owner] = await ethers.getSigners();
  console.log("Deploying contracts with the account: ", owner.address);
  console.log("Account balance: ", (await owner.provider.getBalance(owner)).toString());

  const deployLock = async () => {
    // deploy Lock
    const Lock = await ethers.getContractFactory("Lock");
    const lock = await Lock.deploy(JAN_1ST_2030, {
      value: ONE_GWEI,
    });

    console.table({
      lock: await lock.getAddress(),
    });
  };

  const deployFundamentals = async () => {
    // deploy Fundamentals
    const Fundamentals = await ethers.getContractFactory("Fundamentals");
    const fundametals = await Fundamentals.deploy();

    console.table({
      fundametals: await fundametals.getAddress(),
    });
  };

  const deployCalculator = async () => {
    // deploy Calculator
    const Calculator = await ethers.getContractFactory("Calculator");
    const calculator = await Calculator.deploy();

    console.log({
      calculator: await calculator.getAddress(),
    });
  };

  const deploySimpleStorage = async () => {
    // deploy simple storage
    const SimpleStorage = await ethers.getContractFactory("SimpleStorage");
    const simpleStorage = await SimpleStorage.deploy();

    console.log({
      simpleStorage: await simpleStorage.getAddress(),
    });
  };

  // await deployLock();
  // await deployFundamentals();
  // await deployCalculator();
  await deploySimpleStorage();
}

main()
  .then(() => process.exit(0))
  .catch((error) => {
    console.error(error);
    process.exit(1);
  });
