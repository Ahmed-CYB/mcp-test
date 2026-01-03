# ancient-cipher-vault

## Description
A security researcher discovered an old encrypted message system used by a defunct organization. The system uses multiple layers of encoding and encryption. Your task is to decode the secret message and retrieve the flag from the hidden vault.

## Scenario
During a digital archaeology expedition, you've uncovered remnants of an old communication system. The organization used a multi-layered approach to protect their secrets - combining classical ciphers with modern encoding techniques. Intelligence suggests they hid important information in a file called 'vault.enc' that can be accessed via their old FTP server once you decrypt the access credentials.

## Difficulty
medium

## Machines
- **cipher-server** (victim): 172.24.193.17 - ftp
- **attacker** (attacker): 172.24.193.3 - 

## Hints
1. The organization left some files accessible to anonymous users. Start by exploring what's publicly available.
2. They used multiple encoding layers - some files might need base64 decoding and classical cipher techniques.
3. The vault access seems to be encrypted with AES. Look for patterns in the organization's naming conventions for the key.
4. ROT13 is a simple substitution cipher where each letter is replaced by the letter 13 positions ahead in the alphabet.

## Flag Format
CTF{d3crypt3d_th3_4nc13nt_v4ult}
