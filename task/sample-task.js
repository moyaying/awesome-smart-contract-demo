const { task } = require("hardhat/config");

task("balance", "Prints an account's balance")
  .addParam("account", "The account's address")
  .setAction(async (taskArgs) => {
    const account = ethers.utils.getAddress(taskArgs.account)
    const balance = await ethers.provider.getBalance(account)

    console.log((ethers.utils.formatUnits(balance.toString(), 'ether')).toString(), "ETH");
  });

task("greet", "greet from smart contract")
  .addParam("address", "the greeter address")
  .setAction(async (taskArgs) => {
    addr = taskArgs.address
    if (addr == '') {
      addr = '0x7B4286F9bbEFc7A37124cA51FA9B00a974300479'
    }
    const greeter = await ethers.getContractAt("Greeter", addr)
    const word = await greeter.greet()
    console.log(word, `from contract ${addr}`)
  })


task("setGreeting", "set greeter to smart contract")
  .addParam("address", "the greetera ddress")
  .addParam("word", "your greeting word")
  .setAction(async (taskArgs) => {
    addr = taskArgs.address
    if (addr == '') {
      addr = '0x7B4286F9bbEFc7A37124cA51FA9B00a974300479'
    }
    const greeter = await ethers.getContractAt("Greeter", addr)
    await greeter.setGreeting(taskArgs.word)
    console.log('success')
  })