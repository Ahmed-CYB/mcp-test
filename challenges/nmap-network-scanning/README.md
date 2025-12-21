# Nmap Network Scanning Challenge

## Learning Objectives
- Understand the basics of network scanning with Nmap
- Identify open ports and running services
- Explore network security implications

## Scenario
In this challenge, you will practice using Nmap to scan a network and identify open ports. Your goal is to find the hidden flag by uncovering network services and configurations.

## Instructions
1. Start the CTF environment using Docker Compose.
2. Access the Kali Linux attacker interface via a web browser.
3. Use Nmap to scan the victim container.
4. Identify open ports and explore the services running on them.
5. Discover the flag located on the web server.

### Access Info
- Victim IP: `http://172.25.0.10`
- Kali Linux access: Web interface on port 6901 with VNC password `password`

### Hints
- Try using various Nmap scan options to identify open ports.
- Look for common service ports like HTTP (80) and SSH (22).
- The flag is located within the web service.

#### Example Nmap Command
```bash
nmap 172.25.0.10
```
