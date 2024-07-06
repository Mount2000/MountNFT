require("@nomicfoundation/hardhat-toolbox");

/** @type import('hardhat/config').HardhatUserConfig */
module.exports = {
  solidity: "0.8.24",
  sourcify: {
    enabled: true
  },
  networks: {
    Amoy: {
      url: "https://80002.rpc.thirdweb.com",
      accounts: ["2804a59cf73a60e1431aeca427322f545a4d5992f3260700c386843f49c9c553"]
    }
  }
};
