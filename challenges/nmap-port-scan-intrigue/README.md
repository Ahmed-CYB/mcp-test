# Nmap Port Scan Intrigue

## Learning Objectives
- Understand network scanning with Nmap
- Identify open ports and hidden services
- Gain insights into network security

## Challenge Scenario
A mysterious server has appeared on the network of a small tech company. As a security consultant, you are tasked with identifying open ports and potential vulnerabilities using Nmap to ensure there are no risks associated with this unexpected presence.

## Instructions
1. Use Nmap from the Kali Linux container to scan the victim server.
2. Identify any open ports and explore them to uncover hidden secrets.
3. The flag is located on a non-standard route on the web application running on the victim server.

Access the victim server at `http://victim:8080` from the Kali container.

## Hints
1. Start with a basic Nmap scan to find open ports: `nmap -sS 172.20.0.10`
2. Look for non-standard ports with services running on them.
3. Try accessing any discovered routes in your browser.