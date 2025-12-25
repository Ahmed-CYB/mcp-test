# Misconfigured SSH Access

## Description
A small corporate server has a misconfigured SSH service that allows unauthorized access. Your task is to find a way to inject your SSH key to gain access to the server.

## Learning Objectives
- Understand how SSH key authentication works
- Learn how to exploit SSH configuration weaknesses

## Deployment
Run the `docker-compose.yml` file to start the challenge. The victim server will be accessible at `172.25.0.10` on the internal network.

## Hints
1. Investigate how SSH key authentication can be exploited.
2. Check for any exposed vulnerabilities in the SSH configuration.
3. Consider how you might inject an SSH key into the system.
