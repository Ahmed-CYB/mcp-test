# network-discovery-nmap

## Description
A beginner-friendly network security challenge focused on using Nmap for service discovery and enumeration. Participants will learn basic network reconnaissance techniques to identify running services and find hidden information.

## Scenario
You are a security consultant hired to perform a basic network assessment of a company's internal server. The server is running multiple services, and your task is to identify what services are running and locate sensitive information that might be exposed. Use Nmap to discover the services and then interact with them to find the flag.

## Difficulty
easy

## Machines
- **target-server** (victim): 172.27.145.166 - ftp, ssh
- **attacker** (attacker): 172.27.145.3 - 

## Hints
1. Start by scanning the target to see what services are running
2. Look for services that might allow anonymous access
3. Check if any discovered services have publicly accessible directories

## Flag Format
CTF{nmap_d1sc0v3ry_m4st3r}
