# Memory Analysis Challenge

## Description
A suspicious memory dump has been found, and you need to analyze it using the Volatility tool to find the hidden flag.

## Learning Objectives
- Understand the basics of memory forensics
- Learn to use the Volatility tool for analyzing memory dumps
- Extract useful information from a memory dump

## Instructions
1. Start the Docker containers with `docker-compose up`.
2. Access the `forensic-tool` container.
3. Use Volatility to analyze `memory.dmp`.
4. Locate the flag hidden within the memory dump.

## Tools
- Volatility

## Hints
- Try listing processes and examine known suspicious ones.
- Analyze network connections for hidden data.
- Search for strings in memory that may include the flag.

## Flag
The flag is in the format `CTF{memory_dump_analysis_2024}`.
