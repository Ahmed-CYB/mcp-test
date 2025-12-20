# FTP Access Misconfiguration Challenge

## Learning Objectives
- Understand FTP server configuration
- Identify and exploit permission misconfigurations

## Scenario
Participants will investigate an FTP server with misconfigured permissions. Explore the server to discover sensitive files that shouldn't be publicly accessible.

## Accessing the Challenge
- Start the Docker containers using the provided docker-compose.yml
- Use the Kali Linux environment to connect to the FTP server running on `victim` container
- Look for misconfigurations that allow access to the `flag.txt` file

### Hint
- Anonymous access is enabled, but there's a catch. Try to navigate through the directories for sensitive files.