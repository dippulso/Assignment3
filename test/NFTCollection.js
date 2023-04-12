const {
    time,
    loadFixture,
  } = require("@nomicfoundation/hardhat-network-helpers");
  const { anyValue } = require("@nomicfoundation/hardhat-chai-matchers/withArgs");
  const { expect } = require("chai");
  
  describe("NFTCollection", function () {
    it("Should set the right owner", async function () {
      const [owner, otherAccount] = await ethers.getSigners();
  
      const NFT = await ethers.getContractFactory("NFTCollection");
      const nft = await NFT.deploy();
  
      expect(await nft.owner()).to.equal(owner.address);
    });
  });