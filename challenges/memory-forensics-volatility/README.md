# Memory Forensics Challenge

## Objective
Analyze the provided memory dump using Volatility to uncover a hidden flag.

## Steps
1. Launch the challenge using Docker Compose.
2. Connect to the attacker VM through the provided Kali Linux interface.
3. Use Volatility to examine the memory dump hosted on the victim machine.
4. Identify and extract the hidden flag from the memory analysis.

## Hints
- Check for suspicious processes that might contain the flag.
- Use Volatility plugins like `pslist` and `memdump` to aid your analysis.

## Learning Objectives
- Understand how to use Volatility for memory forensics.
- Learn to identify suspicious processes and extract valuable data.
