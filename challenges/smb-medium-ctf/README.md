# SMB Medium Difficulty CTF Challenge

## Description
This challenge involves exploiting a misconfiguration in an SMB server to retrieve a flag stored on the server.

## Objective
Gain access to the SMB share to read the file containing the flag.

## Setup Instructions
1. Build the Docker image:
   ```
   docker build -t smb-challenge .
   ```
2. Run the Docker container:
   ```
   docker run -d -p 139:139 -p 445:445 smb-challenge
   ```

## Goal
Find and retrieve the content of the file named `flag.txt` in the SMB share.

## Difficulty
Medium

## Hints
- Check the SMB version and configuration for potential misconfigurations.