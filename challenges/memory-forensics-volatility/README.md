# Memory Forensics Challenge

## Objective
Analyze the provided memory dump using Volatility to extract the hidden flag.

## Steps
1. Start the Docker containers using `docker-compose up`.
2. Access the Kali Linux attacker machine via the provided VNC interface.
3. Download the memory dump from the victim container: `curl http://172.23.0.10:8080/memory.raw -o memory.raw`
4. Use Volatility on the Kali machine to analyze the memory and find the flag.

## Tools
- Volatility Framework

## Learning Objectives
- Understand how to use Volatility for memory forensics.
- Identify and extract data hidden in memory dumps.

## Hints
1. Consider what common processes may contain useful information.
2. Use Volatility to list processes and examine their memory space.
3. Look for strings in memory that might contain the flag.
