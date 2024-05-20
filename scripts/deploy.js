// Ensure you have ethers imported from Hardhat
const hre = require("hardhat");

async function main() {
    const [deployer] = await hre.ethers.getSigners();
  
    console.log("Deploying contracts with the account:", deployer.address);
  
    const accountBalance = await deployer.provider.getBalance(deployer.address);
    console.log("Account balance:", accountBalance);
  
    const Token = await hre.ethers.getContractFactory("SupplyChainToken"); //Replace with name of your smart contract
    const token = await Token.deploy();
    await token.waitForDeployment(); // Ensure the contract is deployed
    console.log("Token address:", token.target);
  }
  
  main()
    .then(() => process.exit(0))
    .catch((error) => {
      console.error(error);
      process.exit(1);
    });