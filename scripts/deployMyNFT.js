const hre = require("hardhat")
// scripts/deploy.js

const MintTo = "0x21Be2291f91EA2A1d1EB65DbBea2dA8886Ad7a3E";
const tokenId = 1;
const uri = "https://violet-major-ocelot-686.mypinata.cloud/ipfs/QmQUwmvvH5r8wMX8RXgEYZ4mLXkM8QNheF8CeGwue8jb3w"

const main = async () => {
  const nftContractFactory = await hre.ethers.getContractFactory('MyToken');

  // Deploy contract
  const nftContract = await nftContractFactory.deploy("0x21Be2291f91EA2A1d1EB65DbBea2dA8886Ad7a3E");
  
  await nftContract.deployed;

  console.log('✅ Contract deployed to:', await nftContract.target);

  // Call the mint function from our contract
  const txn = await nftContract.safeMint(MintTo, tokenId, uri);

  const txnReceipt = await txn.wait();

  console.log("txnReceipt", txnReceipt);
  console.log("mint completed")

  // Get the token id of the minted NFT (using our event)
  // const event = txnReceipt.events?.find((event) => event.event === 'Minted');
  // const tokenId = event?.args['tokenId'];

  console.log(
    '🎨 Your minted NFT:',
    `https://testnets.opensea.io/assets/sepolia/${nftContract.target}/${tokenId}`
  );
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