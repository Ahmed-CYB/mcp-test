# SMB Vulnerability Challenge: The Time-Traveler's Code

Welcome, Intrepid Explorer!

You have been selected as a new recruit at the Digital Archaeological Society, a secretive organization tasked with uncovering and protecting the lost digital artifacts of human history. Your first task is to travel back in time digitally and explore the archives of the legendary Atticus Corporation. Within these ancient networks lie secrets that could reshape our understanding of technological evolution.

## Objective

By gaining access to the venerable SMB shares of bygone eras, discover the hidden flags that shed light on the mysterious upgrading processes, once tightly guarded by the corporation's engineers. Solve puzzles, decode forgotten algorithms, and traverse through digital epochs to secure the illustrious Time-Traveler's Code.

### Rules:

1. **No Spoilers!** Share your discoveries, but not the solutions.
2. **Digital Artifacts Protection:** Ensure the integrity of digital records.
3. **Teamwork Encouraged:** Collaborate, communicate, and conquer.

### Setup Instructions

1. Clone this repository.
2. Build the Docker environment:
   
   ```bash
   docker build -t smb-vuln-ctf .
   docker run -d -p 445:445 smb-vuln-ctf
   ```

3. Connect to the SMB service using your favorite SMB client tools and start your journey.

### Hints

- [Introducing a famous cryptanalyst], you've got mail.
- Not every path leads to enlightenment; some are merely decoys.

Good luck, Time Traveler. The past awaits your discovery.