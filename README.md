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

[Checkout The Full Article](https://medium.com/@JohnnyTime/ethernaut-foundry-solutions-2023-how-to-start-challenge-0-solution-3dbe243168c4)

[![Watch The Full Video](https://i.imgur.com/Q8nTceK.jpg)](https://www.youtube.com/watch?v=UWy-CcnulCA&list=PLKXasCp8iWpjYKwk0hcdVDVZlpW_NGEYS)

