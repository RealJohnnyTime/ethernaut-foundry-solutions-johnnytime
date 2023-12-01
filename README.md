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

### 0 - How to Start + Challenge 0 Solution
Welcome to the best Ethernaut CTF Solutions Repository, with Foundry!

#### What is Ethernaut?
[Ethernaut](https://ethernaut.openzeppelin.com/), brought to us by [OpenZeppelin](https://www.openzeppelin.com/), is a Capture The Flag (CTF) style challenge focused on smart contract hacking and auditing. It consists of 29 levels, each progressively more complex, offering an excellent platform to master these skills.

#### Prerequisites & Setting up the Environment
Before we dive into Ethernaut challenges, we need to set up our environment. [Metamask](https://metamask.io/), a popular Ethereum wallet, is essential. Here’s how you can configure Metamask for the Goerli/Sepolia testnet (Ethernaut challenges exists on both testnet chains and it's up to you to choose):

1. Download and install the Metamask browser extension if you haven’t already.
2. Connecting to Goerli/Sepolia: In your Metamask wallet, select the Goerli/Sepolia testnet from the network options. This is where we’ll perform our Ethernaut challenges.
3. Get Goerli/Sepolia ETH: Use [this website](https://goerli-faucet.pk910.de/) to get some Goerli Testnet ETH to your Metamask wallet, or use [this website](https://sepolia-faucet.pk910.de/) to get testnet ETH in the Sepolia network. 
4. Check the [JohnnyTime YouTube channel](https://www.youtube.com/@JohnnyTime) for more tutorials and updates, and check the [full Ethernaut Foundry Solutions playlist](https://www.youtube.com/watch?v=UWy-CcnulCA&list=PLKXasCp8iWpjYKwk0hcdVDVZlpW_NGEYS).
5. Want to make out of Smart Contract Hacking into a career? Check out the [full Smart Contract Hacking Course](https://smartcontractshacking.com/).

#### Tips for Success
Succeeding in Ethernaut challenges requires strategic thinking and keen observation. Here are tips to boost your success:

- **Careful Reading:** Thoroughly understand exercise instructions, objectives, and hints.
- **Smart Contract Analysis:** Dive into smart contract code, identifying potential security issues.
- **Special Comments:** Use comments to mark vulnerabilities or exploit ideas within contracts, you can use the [Solidity Visual Developer VSCode Plugin](https://marketplace.visualstudio.com/items?itemName=tintinweb.solidity-visual-auditor), check out the full [video tutorial](https://www.youtube.com/watch?v=Bpt2Yn9AlIU).
- **Test File Exploration:** Explore test files to understand the system state and transaction sequence.
- **Persistence and Experimentation:** Overcome challenges with experimentation and perseverance.
- **Take Breaks:** Refresh your mind by taking breaks during complex challenges.
- **Watch Walkthroughs:** Seek guidance from [walkthrough videos](https://www.youtube.com/watch?v=UWy-CcnulCA&list=PLKXasCp8iWpjYKwk0hcdVDVZlpW_NGEYS) for new perspectives.

#### Comprehensive Course Option
In case you feel like you lack some fundamentals in smart contract hacking, you can take a comprehensive and structured approach that will help you kickstart your smart contract auditing career. You can enroll in [The Smart Contract Hacking Course](https://smartcontractshacking.com/) - which includes more than 30 chapters and 52 exercises. The course offers community interaction and an official Smart Contract Hacker Certificate upon completion.

#### Challenge 0 Solution
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


### 1: Fallback Solution
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


### 2: Fallout Solution
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

[![Ethernaut Fallout Foundry Solution Walkthrough Video](https://i.imgur.com/WGEz5Re.jpg)](https://www.youtube.com/watch?v=hbLuyGCSCkQ&list=PLKXasCp8iWpjYKwk0hcdVDVZlpW_NGEYS)

### 3: CoinFlip Solution
In the [Coinflip smart contract](./src/CoinFlip.sol), our goal is to win the game 10 times in a row!

#### So how does the CoinFlip game work?
1. To "generate" a random number, the contract uses the hash of the previous block, which is not truly random but serves as a pseudo-random source.
2. When you play, you make a guess (heads or tails) by calling the flip function with your choice (boolean).
3. The function then calculates a number based on the block's hash and compares it to your guess.
4. If your guess matches the calculated number, you win, and your consecutive win count increases. If not, you lose, and your win count resets.
5. The game continues until you win 10 times in a row.

#### Let's exploit it!
Generating numbers based on constant values and block information is a big no-no!
We can create our own smart contract that will play the game, it will execute the same code, generate the same number, and play the game with 100% success, we created exactly that in the [solution file](./script/CoinFlipSolution.s.sol).

This script consists of two contracts: `Player` and `CoinFlipSolution`. The Player contract automatically plays the CoinFlip game by calculating a pseudo-random guess and calling the flip function on the specified CoinFlip contract. The `CoinFlipSolution` script orchestrates the process, broadcasting the transactions and displaying the current `consecutiveWins` count.

Now that the exploit script is ready, we can execute from our terminal the following command:
```bash
forge script script/CoinFlipSolution.s.sol --broadcast
```

** Make sure to update the instance address to your instance.

** **Note:** You will have to run the script 10 times in order to pass the challenge 😅

[Ethernaut CoinFlip Solution Full Article](https://medium.com/p/b8c0725f474b)

[![Ethernaut CoinFlip Foundry Solution Walkthrough Video](https://i.imgur.com/E8REYc1.jpg)](https://www.youtube.com/watch?v=02uda3XpQfg&list=PLKXasCp8iWpjYKwk0hcdVDVZlpW_NGEYS)

### 4: Telephone Solution

In the [Telephone smart contract](./src/Telephone.sol), our goal is to claim ownership of the Telephone contract!

The Telephone Smart Contract:
1. Has an `owner`` variable, initially set to the address that deploys the contract (not us 😢).
2. The `changeOwner` function lets you update the owner's address, but only if the original sender (`tx.origin`) of the transaction is not the same as the current sender (`msg.sender`), which means - a smart contract.

To solve the challenge we first need to understand the difference between `tx.origin` and `msg.sender` and how we can make sure they are different.

#### The difference between msg.sender to tx.origin
![msg.sender vs tx.origin](https://i.imgur.com/BjDKoow.png)

`tx.origin` is the original sender of a transaction, which is always an EOA (Externally Owned Account) and can never be a smart contract. It represents the external Ethereum account that initiated the transaction. It remains the same throughout the entire transaction chain, even if a contract calls another contract.

`msg.sender` is the sender of the current transaction within a contract. It can change when one contract interacts with another, as it reflects the address of the contract that initiated the most recent call.

To make `tx.origin` and `msg.sender` different, you can create a contract that acts as an intermediary. When this contract calls another contract, `msg.sender` in the called contract will be the intermediary contract's address, while `tx.origin` remains the original sender's address.

To solve this challenge with Foundry, we've created the script solution [TelephoneSolution.s.sol](./script/TelephoneSolution.s.sol).

The Script is working as follows:
1. Generates and deploy a new contract called `IntermediaryContract`.
2. Provides this new contract with both the original `Telephone` smart contract instance and our player's Ethereum address.
3. `IntermediaryContract` invokes the `changeOwner` function and pass our player EOA account as the parameter. 
4. Since it's a contract making this call and not an externally owned account (EOA), `msg.sender` and `tx.origin` will differ.
5. The `require` statement will be satisfied, enabling the owner to be changed to our player's account.

** Make sure to update the instance address to your instance.

We can execute from our terminal the following command:
```bash
forge script script/TelephoneSolution.s.sol --broadcast
```

Then we can go to the Ethernaut website and submit the challenge :)

[Ethernaut Telephone Solution Full Article](https://medium.com/p/f2e06f229f27)

[![Ethernaut Telephone Foundry Solution Walkthrough Video](https://i.imgur.com/9kn66aO.jpg)](https://www.youtube.com/watch?v=Av7NwWb2t2M&list=PLKXasCp8iWpjYKwk0hcdVDVZlpW_NGEYS)

---

### 5: Token Solution
