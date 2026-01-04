# corporate-cipher-breach

## Description
A corporate whistleblower has leaked encrypted documents from MegaCorp's internal servers. Intelligence suggests they used a custom encryption scheme combining classical and modern techniques. Your mission is to decrypt the confidential data and extract the sensitive information hidden within.

## Scenario
You are a cybersecurity analyst investigating a data breach at MegaCorp Industries. The attacker left behind several encrypted files on a compromised server. Initial analysis reveals the use of multiple encryption layers including base64 encoding, Caesar cipher, and XOR encryption. The server contains encrypted messages, cipher keys, and configuration files that will help you decrypt the final payload containing corporate secrets.

## Difficulty
medium

## Machines
- **crypto-server** (victim): 172.30.193.104 - ssh
- **attacker** (attacker): 172.30.193.3 - 

## Hints
1. The server contains multiple encrypted messages - check all directories under /home/analyst/
2. Look for clues about the decryption order and methods in the hints directory
3. Each encryption layer uses a different technique: encoding, classical cipher, and modern encryption
4. The tools directory contains a Python script that might help with decryption
5. The keys directory contains the values needed for decryption algorithms

## Flag Format
CTF{m4st3r_0f_mult1_l4y3r_crypt0}
