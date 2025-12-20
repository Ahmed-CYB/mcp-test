# Nmap Network Discovery Challenge

## Learning Objectives
- Understand network discovery using Nmap
- Identify open ports and hidden services
- Capture the flag using discovered information

## Challenge Setup
This challenge consists of a vulnerable web service running inside a Docker container. The goal is to use Nmap to discover open ports and endpoints.

## Accessing the Challenge
- Start the Docker containers using `docker-compose up`.
- Access the attacker environment through Kali Linux provided in the setup.
- Use Nmap to scan the network and find the open ports on the victim service.

## Hints
- Start by scanning the network for live hosts.
- Identify open ports using Nmap's default scan.
- Look for unusual ports and services that might host the flag.

## Solution
1. Use Nmap to scan the network: `nmap -sP 10.10.10.0/24`
2. Identify the victim's IP and scan for open ports: `nmap -p- 10.10.10.10`
3. Look for the unusual open port hosting the /hidden endpoint to get the flag.