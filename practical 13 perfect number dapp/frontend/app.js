const contractAddress = "0x0eA0a5024FEb3558928F74e34caACd4cdab6532B";

const contractABI = [
    {
        "inputs": [
            { "name": "n", "type": "uint256" }
        ],
        "name": "isPerfect",
        "outputs": [
            { "name": "", "type": "bool" }
        ],
        "stateMutability": "pure",
        "type": "function"
    }
];

async function checkPerfect() {
    await window.ethereum.request({ method: "eth_requestAccounts" });

    const web3 = new Web3(window.ethereum);
    const contract = new web3.eth.Contract(contractABI, contractAddress);

    const num = document.getElementById("num").value;

    const result = await contract.methods.isPerfect(num).call();

    if (result) {
        document.getElementById("result").innerText = num + " is a Perfect Number!";
    } else {
        document.getElementById("result").innerText = num + " is NOT a Perfect Number.";
    }
}