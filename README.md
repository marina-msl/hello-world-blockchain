# hello-world-blockchain
My first project interacting with smart contracts.
Here are my note about the course [Blockchain e Solidity: Criando Smart Contracts e Tokens](https://cursos.alura.com.br/course/solidity-criando-smart-contracts-tokens) .

### How to understand what problem Blockchain can solve:
<p>The instructor explained the digitalization of our lives. Everything now happens in
the digital space and there is a concern about how easy things can be copied.
This is the key point of tokenization. With blockchain technology, it is possible to verify and control
the real ownership of that a document, artwork, money etc. 
<pl>Basically, tokens are, digital assets that are created and managed using smart contracts on existing blockchains
like Ethereum, Solana, Polygon. 

The blockchain ecosystm is a bit different from the tradicional digital world, so naturally , its programming language and tools are also different.
Blockchain is often referred to as web3. This name comes from the factthat everything is decentralized, whith node running arround the world.

### Tools development:
[Hardhat](https://hardhat.org/)
   
[Foundry](https://getfoundry.sh/) -> using Solidity

### Libs (ecosystem JS):
<p>Web3.js
<p>Ethers.js

In the course it was used Foundry with Solidity programming language and Ethers.js.

### Creating a token
[Here's the code's creation token](https://github.com/marina-msl/hello-world-blockchain/blob/master/src/hello-world.sol)

For programmers (at least in Java), it is similar, it has the varibles declarations, the functions (methods) and constructor.

**<p>How to deploy the contract to the blockchain?**
<p>Foundry is responsible for compile and deploy the contract.
   
**<p>Command:**
<p>forge create --rpc https://rpc.ankr.com/polygon_amoy --private-key 63dc2a12c5f0125a1f9c06e0e591b5c113993c59228bfc2111967d5df3651ce1 src/MeuPrimeiroToken.sol:MeuToken --constructor-args 10000000

<p>rcp -> the provider to connect to the blockchain
<p>private key -> password from your wallet (msg.sender, private key prof who are the sender)

**<p>Command's return:**
<p>The hash transaction is a receipt for the transaction.
<p>The transaction's hash can be found in the blockchain explorer, and with it you can found the transaction and its information.
<p>For the exemple on this course, the transaction could be found on the https://amoy.polygonscan.com/.






