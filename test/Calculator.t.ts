import {
  time,
  loadFixture,
} from "@nomicfoundation/hardhat-toolbox/network-helpers";
import { expect } from "chai";
import hre, { ethers } from "hardhat";
import { Contract } from "ethers";

describe("Calculator Testcases", function () {

  describe("Basic Calculator", function () {

    const deploy = async () => {
      const BasicCalculator = await ethers.getContractFactory("BasicCalculator");
      const basicCalculator = await BasicCalculator.deploy();

      return { basicCalculator };
    };

    it("add // wrong parameters", async function () {
      const { basicCalculator } = await loadFixture(deploy);

      expect(basicCalculator.add(-1, 2)).to.reverted;
      expect(basicCalculator.add(-1, -2)).to.reverted;
      expect(basicCalculator.add(1, -2)).to.reverted;
    });

    it("add // right parameters", async function () {
      const { basicCalculator } = await loadFixture(deploy);

      expect(await basicCalculator.add(1, 2)).to.not.reverted;
      expect(await basicCalculator.get()).to.equal(3);
    });

    it("substract //  wrong parameters", async function () {
    });

  });

});
