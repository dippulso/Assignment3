
/** @type import('hardhat/config').HardhatUserConfig */
/*
url: "https://rpc-mumbai.maticvigil.com/",
accounts: ["b54db2efffd73a28bec6180cdc382bfa90e5e5f960a571820045a3c55b274ddf"]
*/

require("@nomicfoundation/hardhat-toolbox");
require("@nomiclabs/hardhat-etherscan");
//SENSITIVE INFO SECURITY

/** @type import('hardhat/config').HardhatUserConfig */
module.exports = {
  solidity: "0.8.17",
  networks:{
    mumbai:{
      url: "https://rpc-mumbai.maticvigil.com/",
      accounts: ["b54db2efffd73a28bec6180cdc382bfa90e5e5f960a571820045a3c55b274ddf"]
    }
  },
    etherscan: {
      apiKey: "FAWN197TDBNFBJ4ZTJB2SB6ASBMQY2NMC8", // Your Etherscan API key
    }
}
