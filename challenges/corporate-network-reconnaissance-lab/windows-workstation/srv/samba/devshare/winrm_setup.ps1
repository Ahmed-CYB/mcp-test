# WinRM Configuration Script for Development Environment
# Enable WinRM service
Enable-PSRemoting -Force -SkipNetworkProfileCheck

# Configure WinRM service
Set-WSManInstance -ResourceURI winrm/config/service -ValueSet @{AllowUnencrypted="true"}
Set-WSManInstance -ResourceURI winrm/config/service/auth -ValueSet @{Basic="true"}
Set-WSManInstance -ResourceURI winrm/config/service/auth -ValueSet @{CredSSP="true"}

# Set up listeners
New-WSManInstance -ResourceURI winrm/config/Listener -SelectorSet @{Transport="HTTP";Address="*"} -ValueSet @{Port="5985"}
New-WSManInstance -ResourceURI winrm/config/Listener -SelectorSet @{Transport="HTTPS";Address="*"} -ValueSet @{Port="5986"}

# Configure firewall
New-NetFirewallRule -DisplayName "WinRM HTTP" -Direction Inbound -LocalPort 5985 -Protocol TCP -Action Allow
New-NetFirewallRule -DisplayName "WinRM HTTPS" -Direction Inbound -LocalPort 5986 -Protocol TCP -Action Allow

# Increase MaxMemoryPerShellMB for development
Set-WSManInstance -ResourceURI winrm/config/winrs -ValueSet @{MaxMemoryPerShellMB="1024"}

# Set authentication methods
Set-WSManInstance -ResourceURI winrm/config/service/auth -ValueSet @{Kerberos="true";Negotiate="true";Certificate="false"}

# Trust all hosts (DEV ONLY - DO NOT USE IN PRODUCTION)
Set-Item WSMan:\localhost\Client\TrustedHosts -Value "*" -Force

Write-Host "WinRM Configuration Complete"
Write-Host "HTTP Port: 5985"
Write-Host "HTTPS Port: 5986"
Write-Host "WARNING: Unencrypted communication enabled - FOR DEVELOPMENT ONLY"

# Test WinRM connectivity
Test-WSMan -ComputerName localhost