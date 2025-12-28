# Advanced Memory Forensics Challenge

## Description
A mysterious incident occurred on a corporate workstation. The memory dump has been extracted for investigation. Analyze the memory dump using Volatility to uncover the hidden secrets.

## Objective
Your task is to find and retrieve the flag hidden within the memory dump.

## Learning Objectives
- Understand how to use Volatility for memory forensics
- Practice analyzing process memory and environment variables

## Setup Instructions
1. Deploy the Docker container using the provided `docker-compose.yml`.
2. Access the Kali Linux instance through the web interface.
3. Use Volatility to analyze the memory dump located at `/root/challenge/memory.dmp`.

## Hints
1. Focus on running processes and their command-line arguments.
2. Check for environment variables set by suspicious processes.
3. Explore memory sections for encrypted data.

## Tools Required
- Volatility 3

## Example Commands
- `vol -f memory.dmp linux.pslist`
- `vol -f memory.dmp linux.bash`
- `vol -f memory.dmp linux.envars`

## Flag
`CTF{adv4nc3d_m3m0ry_f0r3ns1cs}`