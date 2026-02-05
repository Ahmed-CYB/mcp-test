# quantum-cipher-breach

## Description
A quantum research facility's encrypted communication system has been compromised. Multiple layers of encryption protect sensitive quantum research data. You must break through advanced cryptographic defenses including custom cipher implementations, hash collisions, and steganographic techniques to recover the classified quantum algorithm.

## Scenario
Dr. Sarah Chen, a quantum cryptographer at SecureQuantum Labs, has discovered that their classified quantum computing research has been exfiltrated. The attacker used sophisticated cryptographic techniques to hide the stolen data across multiple encrypted files. As a digital forensics expert, you must decrypt the layered protection to recover the quantum algorithm before it falls into the wrong hands. The challenge involves breaking a custom Vigenère variant, exploiting MD5 hash collisions, extracting hidden data from images, and solving a complex mathematical cipher.

## Difficulty
hard

## Machines
- **attacker** (attacker): 172.21.145.3 - ssh
- **crypto-server** (victim): 172.21.145.64 - ssh, http
## Victim credentials (brute force)
- **Username to use**: `debian`
- **Wordlist on attacker machine**: `/usr/share/wordlists/rockyou.txt` (ensure it exists; on Kali it may be `rockyou.txt.gz` — decompress with `gunzip -k /usr/share/wordlists/rockyou.txt.gz` if needed).
Find the password using the wordlist above (e.g. with Hydra or Medusa).

## Hints
1. The quantum research involves multiple encryption layers - start by analyzing the mathematical patterns in the first cipher.
2. MD5 hash collisions from 2004 research papers might be useful for the second stage. Look for known collision pairs.
3. The image contains hidden data - steganography tools and the right passphrase will reveal the next clue.
4. The final stage requires understanding ROT47 cipher combined with hexadecimal encoding to reveal the quantum algorithm.

## Flag Format
CTF{...}

