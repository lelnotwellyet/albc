// Paste the contract address from the "truffle migrate" output here.
// It changes every time you deploy.
const address = "0x4d95BD78f8B9fc1DC3aD74732f947eBA80Fe8628";
// ABI = description of the contract's functions. It tells Web3 that
// "add" takes two numbers and returns one number.
const abi = [
  {
    "inputs": [
      { "name": "a", "type": "uint256" },   // first input
      { "name": "b", "type": "uint256" }    // second input
    ],
    "name": "add",                           // function name
    "outputs": [{ "name": "", "type": "uint256" }],  // returns one number
    "stateMutability": "pure",               // pure = no gas, no state
    "type": "function"
  }
];
// Connect directly to Ganache (same URL as the RPC SERVER in Ganache).
const web3 = new Web3("http://127.0.0.1:7545");
// Create a contract object from the ABI and address. Now we can call
// its functions from JavaScript.
const contract = new web3.eth.Contract(abi, address);
// Runs when the Add button is clicked.
async function addNumbers() {
    // Read the two values typed into the input boxes
    const n1 = document.getElementById("num1").value;
    const n2 = document.getElementById("num2").value;
    // Call the contract's add function.
    // .call() = only read the answer: no transaction, no gas.
    // "await" waits for the blockchain to reply.
    const answer = await contract.methods.add(n1, n2).call();
    // Show the answer on the page
    document.getElementById("result").innerText = "Result: " + answer;
}