# ancient-cipher-scrolls

## Description
An ancient scroll has been discovered containing encrypted messages using a custom substitution cipher. The archaeologist's notes mention a pattern in the cipher key. Can you decrypt the hidden message to find the treasure location?

## Scenario
You are a cryptographer working with an archaeological team. They've found ancient scrolls with encrypted text using a custom substitution cipher. The lead archaeologist left notes about discovering a pattern in the cipher key before mysteriously disappearing. Decrypt the message to uncover the location of the hidden treasure.

## Difficulty
medium

## Machines
- **cipher-archive** (victim): 172.21.145.181 - ssh
- **attacker** (attacker): 172.21.145.3 - 

## Hints
1. The archaeologist's notes mention finding a pattern in the cipher. Check their research files.
2. This appears to be a combination cipher - try analyzing the frequency of letters and look for common English patterns.
3. The cipher uses a Caesar shift combined with specific letter swaps. The notes contain the exact mapping pattern.
4. Look for the decrypt.py script in the archaeologist's home directory - it might contain the decryption algorithm.

## Flag Format
CTF{TREASURE_AT_ANCIENT_TEMPLE_COORDINATES_34_7821_118_2437}
