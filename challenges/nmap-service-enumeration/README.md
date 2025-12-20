# Nmap Service Enumeration Challenge

## Learning Objectives
- Understand how to use Nmap for service enumeration
- Learn to identify vulnerable or unnecessary services running on a server
- Practice analyzing Nmap scan results to gather information

## Instructions
1. Deploy the CTF using the provided `docker-compose.yml` file.
2. Access the Kali Linux (attacker) container through a web browser using the VNC link.
3. Use Nmap to scan the IP address `172.25.0.10` to enumerate the services running on the victim container.
4. Analyze the Nmap results to identify the service running on port 80 that might contain the flag.
5. Access the service to retrieve the flag.

## Deployment
Run the following command to deploy the challenge:
```
docker-compose up --build
```

Once deployed, access the Kali Linux UI at `http://localhost:<Kali_Port>` to start your investigation.
