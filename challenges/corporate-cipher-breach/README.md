# corporate-cipher-breach

## Description
A corporate whistleblower has leaked encrypted documents containing evidence of financial fraud. The documents were encrypted using a custom cipher system. Your task is to decrypt the files and recover the evidence to expose the corruption.

## Scenario
You are a cybersecurity investigator who has received encrypted files from an anonymous source claiming to have evidence of corporate fraud at MegaCorp Industries. The whistleblower mentions that the company uses a 'layered security approach' for their sensitive documents. You need to decrypt these files to uncover the evidence and find the flag that proves the fraud.

## Difficulty
medium

## Machines
- **crypto-server** (victim): 172.30.193.157 - ssh, http
- **attacker** (attacker): 172.30.193.3 - 

## Hints
1. The company uses multiple layers of encryption. Check what services are running on different ports.
2. ROT13 is a simple Caesar cipher with a shift of 13. Base64 encoding is not encryption but can hide data.
3. The crypto service on port 8080 can help you decrypt data. Try using curl with POST requests and JSON data.
4. XOR cipher uses the company name 'MEGACORP' as the key. The evidence directory might be protected but accessible if you know the right path.

## Flag Format
CTF{m3g4c0rp_fr4ud_3xp053d_2024}
