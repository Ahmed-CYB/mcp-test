import ftplib

HOST = '127.0.0.1'
PORT = 21

# This solver assumes the container port 21 is mapped to localhost:2121 externally.
HOST = '127.0.0.1'
EXTERNAL_PORT = 2121

if __name__ == '__main__':
    ftp = ftplib.FTP()
    ftp.connect(HOST, EXTERNAL_PORT, timeout=10)
    ftp.login('anonymous', 'anonymous@example.com')

    files = []
    ftp.retrlines('LIST', files.append)
    print('[*] Directory listing:')
    for line in files:
        print(line)

    content = []
    def handle(line):
        content.append(line)

    try:
        ftp.retrlines('RETR flag.txt', callback=handle)
        print('\n[+] Retrieved flag:')
        print('\n'.join(content))
    except Exception as e:
        print('[-] Failed to retrieve flag:', e)

    ftp.quit()
