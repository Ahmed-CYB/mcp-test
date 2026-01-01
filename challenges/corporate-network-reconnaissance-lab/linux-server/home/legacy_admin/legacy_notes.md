# Legacy System Migration Notes

## SSH Configuration Issues
- **CRITICAL**: Still using SSH Protocol 1 for compatibility with old systems
- **SECURITY RISK**: Weak encryption ciphers enabled
- **TODO**: Migrate to Protocol 2 after Q1 2024

## Known Vulnerabilities
1. SSH running on non-standard port 25 (SMTP port)
2. Protocol 1 susceptible to man-in-the-middle attacks
3. Weak key exchange algorithms in use

## Credentials
- finance user: password is company founding year + 'Finance'
- audit user: follows standard pattern 'audit' + current year

## Migration Timeline
- Phase 1: Document current state (COMPLETED)
- Phase 2: Test Protocol 2 compatibility (IN PROGRESS)
- Phase 3: Full migration (SCHEDULED Q1 2024)

**Remember**: This system handles sensitive financial data!

System Admin: legacy_admin@corpfinance.local