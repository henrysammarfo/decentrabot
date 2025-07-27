const hre = require("hardhat");

async function main() {
  await hre.run("compile");

  const ProposalRegistry = await hre.ethers.deployContract("ProposalRegistry");
  await ProposalRegistry.waitForDeployment();
  console.log("ProposalRegistry deployed to:", await ProposalRegistry.getAddress());

  const governor = await hre.ethers.deployContract("DecentraGovernor", [hre.ethers.ZeroAddress]);
  await governor.waitForDeployment();
  console.log("DecentraGovernor deployed to:", await governor.getAddress());

  const exec = await hre.ethers.deployContract("ExecutorModule", [process.env.GNOSIS_SAFE_ADDRESS || hre.ethers.ZeroAddress]);
  await exec.waitForDeployment();
  console.log("ExecutorModule deployed to:", await exec.getAddress());
}

main().catch(error => {
  console.error(error);
  process.exit(1);
});
