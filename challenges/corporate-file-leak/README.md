# corporate-file-leak

## Description
A corporate file server has been misconfigured, allowing unauthorized access to sensitive company documents. Your task is to enumerate the SMB shares, gain access, and retrieve the confidential flag containing leaked customer data.

## Scenario
TechCorp recently migrated their file server to a new Linux-based SMB solution. The system administrator, rushing to meet the deadline, made several configuration mistakes that left sensitive directories exposed. As a penetration tester, you've been hired to assess the security of their file sharing infrastructure and demonstrate the risks of misconfigured SMB services.

## Difficulty
medium

## Machines
- **fileserver** (victim): 172.26.193.198 - samba

## Hints
1. Start by scanning for open SMB ports and enumerating available shares
2. Some shares might allow guest access - check what information is available publicly
3. Look for credentials or hints in accessible files that might help access restricted shares
4. The confidential share requires authentication - use discovered credentials to access it

## Flag Format
CTF{smb_m1sc0nf1g_l34ds_t0_d4t4_l34k}
