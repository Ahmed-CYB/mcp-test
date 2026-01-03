# ancient-cipher-vault

## Description
An ancient cryptographic vault has been discovered containing sensitive intelligence data. The vault uses a multi-layered encryption system that combines classical ciphers with modern encoding techniques. Your mission is to decrypt the secret message and retrieve the hidden flag.

## Scenario
During a digital archaeology expedition, researchers uncovered an encrypted file system belonging to a defunct intelligence agency. The system appears to use a combination of historical ciphers and encoding methods. Intelligence suggests the final secret is protected by a Vigenère cipher with a key hidden in plain sight. Can you break through all the layers and recover the classified information?

## Difficulty
medium

## Machines
- **crypto-vault** (victim): 172.23.208.70 - ssh, http
- **attacker** (attacker): 172.23.208.3 - 

## Hints
1. The vault uses three different encryption layers - start with the most basic encoding method.
2. ROT13 is a special case of the Caesar cipher. The historical documents contain important information.
3. Agent WHISTLER appears most frequently in the records - this might be significant for the final cipher.

## Flag Format
CTF{v1g3n3r3_c1ph3r_m4st3r_2024}
