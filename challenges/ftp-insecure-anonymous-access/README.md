# FTP Insecure Anonymous Access

## Scenario
A small company has set up an FTP server for internal file sharing. They mistakenly allowed anonymous access without realizing the security implications. Your task is to discover and exploit this misconfiguration to retrieve the hidden flag.

## Learning Objectives
- Understand FTP server configurations
- Learn about the implications of anonymous FTP access
- Practice basic FTP commands to interact with servers

## Access Instructions
1. Start the challenge using `docker-compose up -d`.
2. Access the Kali Linux attacker environment via a web browser at `http://localhost:6901` with password `password`.
3. Use the Kali terminal to connect to the FTP server located at `ftp://victim:21` and find the flag.

## Hints
1. Consider the default settings of FTP servers.
2. Try connecting to the FTP server using `anonymous` as the username.
3. Look for text files in the directory.
