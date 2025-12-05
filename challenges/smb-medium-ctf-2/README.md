# SMB Medium Difficulty CTF Challenge (Variant 2)

## Description
This is a medium difficulty SMB challenge variant. A Samba server is set up with two shares: a public share for hints and a private share containing the flag that requires credentials.

## Setup
To run this challenge locally (Docker):

1. Build the image:
   docker build -t smb-medium-ctf-2 .

2. Run the container:
   docker run -d -p 445:445 smb-medium-ctf-2

3. Connect to the public share (no credentials required):
   smbclient //localhost/Public -U guest

4. Connect to the private share (credentials required):
   smbclient //localhost/CTF -U ctfuser
   (password: letmein)

## Flag
The flag is located at /srv/smb_ctf/flag.txt inside the container.

Flag example: SuperSecretFlag{Medium_Difficulty_SMB_CTF_New_V2}

## Notes
- The public share contains a README and hint files.
- The private share contains the hidden flag file.

If you want to customize this challenge further (different passwords, more hints, etc.), tell me your requirements and I can adjust content accordingly.
