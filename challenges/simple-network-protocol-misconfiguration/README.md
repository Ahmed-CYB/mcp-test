# Simple Network Protocol Misconfiguration

## Learning Objectives
- Understand basic network protocols and configurations
- Identify and exploit a misconfigured protocol
- Practice basic network communication techniques

## Challenge Description
You are tasked with discovering a misconfiguration in a custom network protocol. The server listens on port 8080 and responds to specific commands. Due to a misconfiguration, it's possible to extract sensitive information by sending the correct command.

### Instructions
- Use the Kali Linux container to interact with the server at `http://victim:8080`
- Discover the correct command to extract sensitive data

### Setup
- Ensure Docker and Docker Compose are installed
- Start the challenge with `docker-compose up --build`
- Access the Kali Linux GUI and begin the challenge
