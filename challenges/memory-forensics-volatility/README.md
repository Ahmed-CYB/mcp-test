# Memory Forensics Challenge

## Learning Objectives
- Understand the basics of memory forensics
- Use Volatility to analyze memory dumps
- Extract sensitive information from a memory image

## Challenge Description
A compromised server's memory dump is available for analysis. Your task is to investigate the memory using Volatility and uncover the hidden flag.

### Connect to the Attacker Machine
You can use the provided attacker machine with a full suite of forensic tools.

### Access the Memory Dump
Download the memory dump from the victim container:
```
curl http://172.28.0.10:8080/memory.raw -o memory.raw
```

### Analyze the Memory Dump
Use Volatility on the attacker machine to analyze the memory and extract the flag.

## Hints
1. Start by listing the processes in the memory dump.
2. Look for unusual processes or hidden data structures.
3. The flag is stored within a process related to suspicious activity.

## Flag
The flag format is CTF{memory_analysis_with_volatility}