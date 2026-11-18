const contractAddress = "0xe1041D34D638d54eeEDdBF36fCeFd29F35aB6d81";

const abi = [
    { "inputs": [], "name": "candidate1Votes", "outputs": [{ "name": "", "type": "uint256" }], "stateMutability": "view", "type": "function" },
    { "inputs": [], "name": "candidate2Votes", "outputs": [{ "name": "", "type": "uint256" }], "stateMutability": "view", "type": "function" },
    { "inputs": [], "name": "voteCandidate1", "outputs": [], "stateMutability": "nonpayable", "type": "function" },
    { "inputs": [], "name": "voteCandidate2", "outputs": [], "stateMutability": "nonpayable", "type": "function" }
];

let contract;
let account;

async function connectWallet() {
    const accounts = await window.ethereum.request({ method: "eth_requestAccounts" });
    account = accounts[0];

    const web3 = new Web3(window.ethereum);
    contract = new web3.eth.Contract(abi, contractAddress);

    document.getElementById("status").innerText = "Connected: " + account;
    updateVotes();
}

async function updateVotes() {
    document.getElementById("votes1").innerText = await contract.methods.candidate1Votes().call();
    document.getElementById("votes2").innerText = await contract.methods.candidate2Votes().call();
}

async function vote1() {
    await contract.methods.voteCandidate1().send({ from: account });
    updateVotes();
    document.getElementById("status").innerText = "Vote cast for Candidate 1!";
}

async function vote2() {
    await contract.methods.voteCandidate2().send({ from: account });
    updateVotes();
    document.getElementById("status").innerText = "Vote cast for Candidate 2!";
}

connectWallet();