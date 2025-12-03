# Dockerfile to set up a vulnerable Windows environment for EternalBlue
# Note: This is a hypothetical setup and will not install actual Windows
# This is a placeholder for your virtualization setup

FROM mcr.microsoft.com/windows/servercore:ltsc2019

# Install necessary packages
RUN powershell -Command \
    Install-WindowsFeature -Name Web-Server

# Simulate vulnerable SMB configuration
RUN powershell -Command \
    Set-ItemProperty -Path 'HKLM:\SYSTEM\CurrentControlSet\Services\LanmanServer\Parameters' -Name 'SMB1' -Type DWORD -Value 1

# Expose SMB port
EXPOSE 445

CMD ["powershell"]