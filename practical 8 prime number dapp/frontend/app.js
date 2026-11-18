const contractAddress = "0x6c9d6d83D2C34e281376CDA059b5b16d2bDCaB8c";

const contractABI = [
    {
        "inputs": [
            { "name": "n", "type": "uint256" }
        ],
        "name": "isPrime",
        "outputs": [
            { "name": "", "type": "bool" }
        ],
        "stateMutability": "pure",
        "type": "function"
    }
];

async function checkPrime() {
    await window.ethereum.request({ method: "eth_requestAccounts" });

    const web3 = new Web3(window.ethereum);
    const contract = new web3.eth.Contract(contractABI, contractAddress);

    const num = document.getElementById("num").value;

    const result = await contract.methods.isPrime(num).call();

    if (result) {
        document.getElementById("result").innerText = num + " is a Prime Number.";
    } else {
        document.getElementById("result").innerText = num + " is not a Prime Number.";
    }
}