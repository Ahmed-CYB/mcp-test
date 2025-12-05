# Nmap Multi‑Service Practice CTF

This machine provides a small lab where you can practice Nmap enumeration against several common network services (SSH, HTTP, FTP, SMB, and a custom TCP port).

## Services Exposed

Ports you can discover and experiment with:
- 22/tcp – OpenSSH
- 80/tcp – Nginx HTTP server
- 21/tcp – vsftpd (anonymous FTP enabled)
- 139, 445/tcp – Samba SMB share (`public`)
- 9999/tcp – Custom TCP banner service

## Build and Run

```bash
docker build -t nmap-practice-ctf ./challenges/nmap-ctf-20251205-213500

docker run --rm -it -p 2222:22 -p 8080:80 -p 2121:21 -p 1139:139 -p 1445:445 -p 9999:9999 nmap-practice-ctf
```

From your host, target the container IP or `localhost` with the mapped ports.

## Example Nmap Exercises

- Basic scan:
  - `nmap -sC -sV localhost -p 2222,8080,2121,1139,1445,9999`
- Service/version detection:
  - `nmap -sV -p- localhost`
- Script scans (FTP/SMB/HTTP):
  - `nmap --script ftp-anon -p 2121 localhost`
  - `nmap --script smb-enum-shares -p 1445 localhost`
  - `nmap --script http-title -p 8080 localhost`
- OS / TCP stack fingerprinting (inside a larger lab network if you attach one).

Use this machine purely for legal, local testing of your own Nmap skills.
