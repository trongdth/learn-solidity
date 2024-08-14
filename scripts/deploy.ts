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

  const deployLibraryCalculator = async () => {
    // deploy Libray Calculator
    const LibraryCalculator = await ethers.getContractFactory("LibraryCalculator");
    const libraryCalculator = await LibraryCalculator.deploy();

    console.log({
      libraryCalculator: await libraryCalculator.getAddress(),
    });
  };

  const deployInterfaceCalculator = async () => {
    // deploy Interface Calculator
    const InterfaceCalculator = await ethers.getContractFactory("InterfaceCalculator");
    const interfaceCalculator = await InterfaceCalculator.deploy();

    console.log({
      interfaceCalculator: await interfaceCalculator.getAddress(),
    });
  };

  const deployAbstractInheritanceCalculator = async () => {
    // deploy Abstract Inheritance Calculator
    const AbstractInheritanceCalculator = await ethers.getContractFactory("AbstractInheritanceCalculator");
    const abstractInheritanceCalculator = await AbstractInheritanceCalculator.deploy();

    console.log({
      abstractInheritanceCalculator: await abstractInheritanceCalculator.getAddress(),
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

  const deployInheritanceExample = async () => {
    // deploy inheritance example
    const Dog = await ethers.getContractFactory("Dog");
    const dog = await Dog.deploy();

    console.log({
      dog: await dog.getAddress(),
    });

  };

  const deployPolymorphismExample = async () => {
    // deploy polymorphism example
    const Dog = await ethers.getContractFactory("PolymorphismDog");
    const dog = await Dog.deploy();

    const Cat = await ethers.getContractFactory("PolymorphismCat");
    const cat = await Cat.deploy();

    console.log({
      dog: await dog.getAddress(),
      cat: await cat.getAddress(),
    })
  };

  const deployErrorHandling = async () => {
    // deploy error handling
    const ErrorHandling = await ethers.getContractFactory("ErrorHandling");
    const errorHandling = await ErrorHandling.deploy();

    console.log({
      errorHandling: await errorHandling.getAddress(),
    });

  };

  const deployStringOperations = async () => {
    // deploy String Operations
    const StringOperations = await ethers.getContractFactory("StringOperations");
    const stringOperations = await StringOperations.deploy();

    console.log({
      stringOperations: await stringOperations.getAddress(),
    });
  };


  const deployVulnerableReentrancy = async () => {
    // deploy VulerableReentrancy
    const VulnerableReentrancy = await ethers.getContractFactory("VulnerableReentrancy");
    const vulnerableReentrancy = await VulnerableReentrancy.deploy();

    // deploy ReentrancyAttacker
    const ReentrancyAttacker = await ethers.getContractFactory("ReentrancyAttacker");
    const reentrancyAttacker = await ReentrancyAttacker.deploy(await vulnerableReentrancy.getAddress());

    console.log({
      vulnerableReentrancy: await vulnerableReentrancy.getAddress(),
      reentrancyAttacker: await reentrancyAttacker.getAddress(),
    });
  };


  // await deployLock();
  // await deployFundamentals();
  // await deployCalculator();
  // await deploySimpleStorage();
  // await deployInheritanceExample();
  // await deployPolymorphismExample();
  // await deployLibraryCalculator();
  // await deployInterfaceCalculator();
  // await deployErrorHandling();
  // await deployStringOperations();
  // await deployAbstractInheritanceCalculator();
  await deployVulnerableReentrancy();
}

main()
  .then(() => process.exit(0))
  .catch((error) => {
    console.error(error);
    process.exit(1);
  });
