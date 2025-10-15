# 🧾 Blockchain Diary

A simple **on-chain diary** built entirely in **Solidity** — no imports, no constructors.  
Users can timestamp and store diary entries directly on the blockchain, ensuring **permanence, transparency, and authenticity**.

---

## 🌍 Overview

**Blockchain Diary** enables users to record diary entries on-chain, permanently tied to their Ethereum wallet address.  
Each entry automatically receives a blockchain timestamp (`block.timestamp`) and remains **immutable** once stored.

The contract is designed to be:
- **Minimalistic:** no external dependencies or complex logic  
- **Transparent:** anyone can verify entries on-chain  
- **Immutable:** no editing or deletion for historical integrity  

---

## ⚙️ Features

✅ 100% Solidity — no imports, no constructors  
✅ Timestamped entries for each Ethereum address  
✅ Gas-optimized logging using events  
✅ Option to emit lightweight notes without storage  
✅ View entries, total count, or specific user ranges  
✅ Tamper-proof and verifiable on-chain history  

---

## 🧠 Smart Contract Details

- **Name:** `BlockchainDiary`  
- **Compiler Version:** `^0.8.19`  
- **License:** MIT  
- **Deployed Address:** `0x4230E95d23Ce7adb4d692f1c3c56094FED7a89e9`  
- **Network:** Any EVM-compatible blockchain (Ethereum, Polygon, BSC, etc.)

---

## 🚀 Deployment Guide

### 🧩 Using Remix IDE
1. Open [Remix Ethereum IDE](https://remix.ethereum.org/)
2. Create a new file `BlockchainDiary.sol`
3. Paste the contract code
4. Select **Solidity Compiler 0.8.19**
5. Compile the contract
6. Under **Deploy & Run Transactions**, choose:
   - **Remix VM (local testing)**, or  
   - **Injected Provider (MetaMask)** for live networks
7. Click **Deploy**
8. Copy and save the **Contract Address**

---

## 💡 Usage

### ➕ Add a Diary Entry
Users can store text (plain, encrypted, or IPFS CID).  
Each entry is recorded with:
- `msg.sender` → your Ethereum address  
- `block.timestamp` → exact time of submission  

Example use cases:
- Daily journaling on-chain  
- Immutable proof of statements or creative ideas  
- Timestamped academic notes or digital art entries  

---

### 🔍 Retrieve Data
- **`entriesCount(address)`** → Get total number of entries for a user  
- **`getEntry(address, index)`** → Fetch specific entry and timestamp  
- **`getMyLastEntry()`** → Get your most recent diary entry  
- **`getEntriesRange(address, start, end)`** → Fetch multiple entries  
- **`entryContentHash(address, index)`** → Verify entry integrity with `keccak256` hash  
- **`addEventNote(string note)`** → Emit quick note event without storing data  

---

## 🪄 Example Use Cases

- Personal blockchain diary or journal  
- Permanent storage of quotes, achievements, or thoughts  
- Timestamped proof of authorship or digital creation  
- Transparent logging for research or documentation  
- Off-chain integration using event logs and hashes  

---

## ⚠️ Important Notes

- All on-chain data is **public**. Avoid posting private or sensitive content directly.  
- For privacy, store **encrypted text or IPFS hashes** instead of raw text.  
- String storage increases gas cost — prefer shorter entries or note events.  
- Entries cannot be modified or deleted once created.  

---

## 🧑‍💻 Project Information

| Field | Details |
|-------|----------|
| **Project Name** | Blockchain Diary |
| **Author** | Ustaad Ustaad |
| **Contract ID** | `0x4230E95d23Ce7adb4d692f1c3c56094FED7a89e9` |
| **Language** | Solidity |
| **Compiler** | 0.8.19 |
| **Network** | Any EVM-compatible blockchain |
| **License** | MIT |

---

## 📬 License

This project is licensed under the **MIT License**.  
You are free to use, modify, and distribute the code with proper credit to the author.

---

> 🪙 *"Your thoughts, forever on the blockchain."*
