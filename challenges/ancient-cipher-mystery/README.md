# ancient-cipher-mystery

## Description
A mysterious encrypted message has been discovered in an old digital archive. The message appears to use a substitution cipher, but the exact method is unknown. Your task is to decrypt the message and find the hidden flag. The cipher may involve letter substitution, number encoding, or a combination of techniques.

## Scenario
During a digital archaeology expedition, you've discovered an encrypted message left by a former cryptographer. The message contains sensitive information that could reveal the location of important data. Intelligence suggests the cryptographer used a custom substitution cipher that requires careful analysis to break. Time is running short - can you crack the code?

## Difficulty
medium

## Machines
- **crypto-archive** (victim): 172.23.145.23 - ssh
- **attacker** (attacker): 172.23.145.3 - 

## Hints
1. The encrypted message contains readable patterns - look for repeated sequences that might indicate common words
2. Try performing frequency analysis on the encrypted text - the most common letters might give you clues about the cipher type
3. This appears to be a classic substitution cipher - consider Caesar cipher with different shift values to decrypt the message

## Flag Format
CTF{ANCIENT_WISDOM_REVEALED}
