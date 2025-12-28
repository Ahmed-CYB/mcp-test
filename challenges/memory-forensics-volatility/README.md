# Memory Forensics with Volatility

## Challenge Overview
A company's server has been compromised, and you have been given a memory dump to analyze. Your job is to find the traces left by the attacker and extract the secret flag hidden within the memory.

## Objectives
- Analyze the memory dump using Volatility
- Identify suspicious processes or activities
- Extract the hidden flag from the memory

## Getting Started
1. Run the docker-compose setup with `docker-compose up`.
2. Access Volatility via the container running on private network IP.
3. Use Volatility to analyze the memory dump located in `/data/memory_dump.vmem`.

## Learning Objectives
- Understand the basics of memory forensics
- Use Volatility to identify and analyze suspicious activities
- Practice extracting information from a memory dump

## Hints
1. Start by listing the processes running at the time of the dump.
2. Check for any unusual or hidden processes.
3. Look for any strings that might indicate a flag hidden in memory.
