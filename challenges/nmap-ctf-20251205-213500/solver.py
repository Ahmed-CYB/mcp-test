#!/usr/bin/env python3
import subprocess

TARGET = "localhost"
PORTS = "2222,8080,2121,1139,1445,9999"

def run(cmd):
    print(f"[+] Running: {' '.join(cmd)}")
    out = subprocess.check_output(cmd, stderr=subprocess.STDOUT)
    print(out.decode())

if __name__ == "__main__":
    # Basic discovery of mapped ports
    run(["nmap", "-sC", "-sV", "-p", PORTS, TARGET])
