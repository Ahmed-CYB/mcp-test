TechCorp NFS Public Share
========================

This share contains publicly accessible development resources.

IMPORTANT SECURITY NOTICE:
- This NFS server is configured with weak security settings
- Multiple shares are available with varying access controls
- Encrypted shares use deprecated AES-128 encryption
- Administrative access may be possible through credential discovery

For technical support, contact the infrastructure team.

Known Issues:
1. Guest access enabled on SMB development share
2. SSH access available on multiple ports (22, 2222)
3. Backup credentials may be stored insecurely
4. NFS encryption keys stored alongside encrypted data

Developers: Check the SMB development share for configuration files and credentials.

Network Layout:
- SMB Service: Port 445 (NetBIOS on 139)
- SSH Service: Ports 22, 2222
- NFS Service: Port 2049 (custom port 24 for legacy compatibility)

Last Updated: 2024-01-15