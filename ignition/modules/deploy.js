const { buildModule } = require("@nomicfoundation/hardhat-ignition/modules");

module.exports = buildModule("NFT", (m) => {
  const NFT = m.contract("mount", ["Mount", "MOU"]);
  m.call(NFT, "mint", ["https://ipfs.io/ipfs/QmdqHvAG4n4fs8QAAW79mArSyMY4bqMvEWyUaWd8dPHbtc"]);
  return { NFT };
});