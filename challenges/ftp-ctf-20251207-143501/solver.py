#!/usr/bin/env python3
import ftplib
import sys

HOST = '127.0.0.1'
PORT = 21

# This solver demonstrates automated interaction with the vulnerable FTP service.
# It intentionally avoids revealing the real challenge flag value.

def main():
    try:
        ftp = ftplib.FTP()
        ftp.connect(HOST, PORT, timeout=10)
        print("[+] Connected to FTP")

        # Anonymous login as starting point; adjust as needed during solving
        try:
            ftp.login('anonymous', 'anonymous@ctf.local')
            print("[+] Logged in as anonymous")
        except Exception as e:
            print("[-] Anonymous login failed, trying known user...")
            ftp.login('ftpuser', 'ftpuser123')
            print("[+] Logged in as ftpuser")

        print("[+] Listing root directory:")
        ftp.retrlines('LIST')

        # Example navigation and file retrieval logic; players will adapt this
        try:
            ftp.cwd('private')
            print("[+] Changed directory to /private (if accessible)")
            files = ftp.nlst()
            print("[+] Files in /private:", files)
            if files:
                sample = files[0]
                print(f"[+] Attempting to download {sample} for demonstration")
                with open('downloaded_sample.bin', 'wb') as f:
                    ftp.retrbinary(f'RETR {sample}', f.write)
                print("[+] Sample file downloaded as downloaded_sample.bin")
        except Exception as e:
            print("[!] Could not access /private directly, as expected in a secure setup.")

        ftp.quit()
    except Exception as e:
        print(f"[!] Solver encountered an error: {e}")
        sys.exit(1)


if __name__ == '__main__':
    main()
