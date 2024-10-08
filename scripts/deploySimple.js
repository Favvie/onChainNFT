const hre = require("hardhat")
// scripts/deploy.js

const main = async () => {
  const nftContractFactory = await hre.ethers.getContractFactory('simpleNFT');

  // Deploy contract
  const nftContract = await nftContractFactory.deploy();
  
  await nftContract.deployed;

  console.log('✅ Contract deployed to:', await nftContract.target);

  // Call the mint function from our contract
  const txn = await nftContract.mint();

  const txnReceipt = await txn.wait();

  // Get the token id of the minted NFT (using our event)
  // const event = txnReceipt.events?.find((event) => event.event === 'Minted');
  // const tokenId = event?.args['tokenId'];

  // console.log(
  //   '🎨 Your minted NFT:',
  //   `https://testnets.opensea.io/assets/${nftContract.address}/${tokenId}`
  // );
};

const runMain = async () => {
  try {
    await main();
    process.exit(0);
  } catch (error) {
    console.log(error);
    process.exit(1);
  }
};

runMain();