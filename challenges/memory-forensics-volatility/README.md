# Memory Forensics Challenge: Volatility

## Scenario
A company's server was compromised, and a memory dump was captured before the attacker could erase their traces. As a digital forensic analyst, your task is to analyze the memory image using Volatility to uncover the hidden flag.

## Objectives
- Use Volatility to analyze the memory dump.
- Identify suspicious processes or artifacts within the memory image.
- Extract the hidden flag.

## Instructions
1. Start the Docker environment using the provided docker-compose.yml file.
2. Access the Kali Linux container at http://172.25.0.100:6901 using a VNC client (password: password).
3. Use Volatility commands to investigate the memory-dump.img file located in the /memory-dump directory.

## Flag
The flag is hidden within a suspicious process in the memory dump. Extract the flag to complete the challenge.

## Tools
- [Volatility](https://www.volatilityfoundation.org/): An advanced memory forensics framework.

## Hints
1. Focus on process enumeration to find anomalies.
2. Explore hidden processes using Volatility plugins.