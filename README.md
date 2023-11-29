# Ethernaut Foundry Solutions 2023 - by JohnnyTime

## Installation
1. If you haven't already, install Foundry on your machine, using the following commands:
```bash
curl -L https://foundry.paradigm.xyz | bash
foundryup
```
2. Clone the [Ethernaut Foundry Solutions Repository](https://github.com/RealJohnnyTime/ethernaut-foundry-solutions-johnnytime) (don’t forget to leave a star on Github 😉)
3. Execute `forge build`
4. Create copy `.env_example` to `.env`
5. Fill in the params in your `.env` file

## Repository Structure
1. We will create the challenge smart contract in our Foundry project in the `src\` folder.
2. For every challenge, we will create a script file with the solution in the `script\` folder.
3. We will get a challenge instance from the [Ethernaut Website](https://ethernaut.openzeppelin.com/).
4. We will paste the instance address in our foundry solution file.
5. We will run our solution script in Foundry.
6. We will submit the challenge through the [Ethernaut Website](https://ethernaut.openzeppelin.com/).

## Solutions
## 0 - How to Start + Challenge 0 Solution
Welcome to the best Ethernaut CTF Solutions Repository, with Foundry!

### What is Ethernaut?
[Ethernaut](https://ethernaut.openzeppelin.com/), brought to us by [OpenZeppelin](https://www.openzeppelin.com/), is a Capture The Flag (CTF) style challenge focused on smart contract hacking and auditing. It consists of 29 levels, each progressively more complex, offering an excellent platform to master these skills.

### Prerequisites & Setting up the Environment
Before we dive into Ethernaut challenges, we need to set up our environment. [Metamask](https://metamask.io/), a popular Ethereum wallet, is essential. Here’s how you can configure Metamask for the Goerli/Sepolia testnet (Ethernaut challenges exists on both testnet chains and it's up to you to choose):

1. Download and install the Metamask browser extension if you haven’t already.
2. Connecting to Goerli/Sepolia: In your Metamask wallet, select the Goerli/Sepolia testnet from the network options. This is where we’ll perform our Ethernaut challenges.
3. Get Goerli/Sepolia ETH: Use [this website](https://goerli-faucet.pk910.de/) to get some Goerli Testnet ETH to your Metamask wallet, or use [this website](https://sepolia-faucet.pk910.de/) to get testnet ETH in the Sepolia network. 
4. Check the [JohnnyTime YouTube channel](https://www.youtube.com/@JohnnyTime) for more tutorials and updates, and check the [full Ethernaut Foundry Solutions playlist](https://www.youtube.com/watch?v=UWy-CcnulCA&list=PLKXasCp8iWpjYKwk0hcdVDVZlpW_NGEYS).
5. Want to make out of Smart Contract Hacking into a career? Check out the [full Smart Contract Hacking Course](https://smartcontractshacking.com/).

### Tips for Success
Succeeding in Ethernaut challenges requires strategic thinking and keen observation. Here are tips to boost your success:

- **Careful Reading:** Thoroughly understand exercise instructions, objectives, and hints.
- **Smart Contract Analysis:** Dive into smart contract code, identifying potential security issues.
- **Special Comments:** Use comments to mark vulnerabilities or exploit ideas within contracts, you can use the [Solidity Visual Developer VSCode Plugin](https://marketplace.visualstudio.com/items?itemName=tintinweb.solidity-visual-auditor), check out the full [video tutorial](https://www.youtube.com/watch?v=Bpt2Yn9AlIU).
- **Test File Exploration:** Explore test files to understand the system state and transaction sequence.
- **Persistence and Experimentation:** Overcome challenges with experimentation and perseverance.
- **Take Breaks:** Refresh your mind by taking breaks during complex challenges.
- **Watch Walkthroughs:** Seek guidance from [walkthrough videos](https://www.youtube.com/watch?v=UWy-CcnulCA&list=PLKXasCp8iWpjYKwk0hcdVDVZlpW_NGEYS) for new perspectives.

### Comprehensive Course Option
In case you feel like you lack some fundamentals in smart contract hacking, you can take a comprehensive and structured approach that will help you kickstart your smart contract auditing career. You can enroll in [The Smart Contract Hacking Course](https://smartcontractshacking.com/) - which includes more than 30 chapters and 52 exercises. The course offers community interaction and an official Smart Contract Hacker Certificate upon completion.

### Challenge 0 Solution
The idea of the first challenge is to introduce us to Ethernaut and show us how the CTF works. 
The first challenge can be easily solved using the browser console.
We can also solve it using Foundry.
This is the [smart contract of the challenge](./src/Level0.sol), and this is the [solution contract](./script/Level0Solution.s.sol)
In order to complete the challenge we will execute the following command from our terminal:
`forge script script/Level0Solution.s.sol —-broadcast`.
Now we can go to the Ethernaut challenge page and click “Submit Instance”.
And congratulation! You completed the first Ethernaut challenge using Foundry! 🥳

[How to Solve Ethernaut with Foundry Full Article](https://medium.com/@JohnnyTime/ethernaut-foundry-solutions-2023-how-to-start-challenge-0-solution-3dbe243168c4)

[![How to Solve Ethernaut with Foundry - Full Video](https://i.imgur.com/Q8nTceK.jpg)](https://www.youtube.com/watch?v=UWy-CcnulCA&list=PLKXasCp8iWpjYKwk0hcdVDVZlpW_NGEYS)


## 1: Fallback
In the Fallback smart contract, our goal is to claim ownership of the contract and then reduce it’s balance to 0 (drain it).

This is the [smart contract of the challenge](./src/Fallback.sol).

To update the owner using the receive function, you must meet the following requirements:
1. Send an amount greater than 0 ETH in msg.value (even 1 WEI is sufficient).
2. Have an entry in the contributions mapping, meaning you must contribute at least 1 WEI to the smart contract.

To achieve this, simply follow these steps:
1. Invoke the contribute function with a contribution of 1 WEI.
2. Make a call to the contract without any additional data, sending 1 WEI to trigger the receive function.

This is the [solution contract](./script/FallbackSolution.s.sol), in order to complete the challenge we will execute the following command from our terminal:
`forge script script/FallbackSolution.s.sol —-broadcast`

Make sure to update the instance address to your instance.

This script first calls the contribute function with 1 WEI and then triggers the default `receive()` function by making a low-level call to the contract with 1 WEI.

[Ethernaut Fallback Solution Full Article](https://medium.com/@JohnnyTime/ethernaut-ctf-fallback-challenge-1-foundry-solution-2023-5382f5890151)

[![Ethernaut Fallback Foundry Solution walkthrough Video](https://i.imgur.com/Q2TrPHs.jpg)](https://www.youtube.com/watch?v=mQQFgWbSXyg&list=PLKXasCp8iWpjYKwk0hcdVDVZlpW_NGEYS)


## 2: Fallout
In the [Fallout smart contract](./src/Fallout.sol), our goal is to claim ownership of the contract.

Worth to mention:
1. The contract is written in an older Solidity version (0.6.0). 
2. The contract's constructor sets the owner as the `msg.sender` upon deployment.
3. There is no function to change the owner.

Upon closer inspection, we discover that the "so-called constructor" in the Fallout smart contract is not a constructor. It is just a public payable function with a different name "Fal1out" (with 1 instead of l), and this function will not be automatically triggered upon contract deployment. Due to this, the owner remains set to address zero, and anyone can call this function to update the owner.

All we need to do is call the public `Fal1out()` function and it will update the owner variable with our address. Let's solve it with Foundry.

This is the [solution contract](./script/FalloutSolution.s.sol), to complete the challenge we will execute the following command from our terminal:
`forge script script/FalloutSolution.s.sol —-broadcast`

Make sure to update the instance address to your instance.

In the script we:
1. Import the original `Fallout.sol` Smart Contract.
2. Import foundry `Script.sol` so we can use vm commands and `console.sol` so we can print staff
3. Create an instance of the Fallout smart contract (make sure to deploy the instance and get your instance address from the ethernaut page)
4. Use `vm.startBroadcast(vm.envUint("PRIVATE_KEY"))` to make sure transactions are broadcasted with our Metamask wallet private key
5. Call the `Fal1out()` function and print the owner before and after to make sure it works.

[Ethernaut Fallout Solution Full Article](https://medium.com/p/13d6f215ac44)

[![Ethernaut Fallout Foundry Solution walkthrough Video](https://i.imgur.com/Q2TrPHs.jpg)](https://www.youtube.com/watch?v=mQQFgWbSXyg&list=PLKXasCp8iWpjYKwk0hcdVDVZlpW_NGEYS)

