#!/bin/bash
# Corporate Public Access Terminal v2.1
# Restricted shell for public kiosk access

echo "========================================"
echo "  IoT Device Management Console v2.1   "
echo "     Public Access Terminal Mode       "
echo "========================================"
echo
echo "Available commands:"
echo "  help     - Show this help"
echo "  status   - Show device status"
echo "  logs     - View system logs (last 10)"
echo "  info     - Device information"
echo "  config   - View configuration (limited)"
echo "  exit     - Exit terminal"
echo

while true; do
    echo -n "iot-console> "
    read -r cmd args
    
    case "$cmd" in
        "help")
            echo "Available commands: help, status, logs, info, config, exit"
            ;;
        "status")
            echo "Device Status: Online"
            echo "Uptime: $(uptime -p)"
            echo "Memory: $(free -h | grep Mem | awk '{print $3"/"$2}')"
            ;;
        "logs")
            if [ -n "$args" ]; then
                # Vulnerability: No input sanitization for log file path
                logfile="/var/log/$args"
                if [ -f "$logfile" ]; then
                    echo "=== Last 10 lines of $logfile ==="
                    tail -10 "$logfile" 2>/dev/null || echo "Cannot read log file"
                else
                    echo "Log file not found: $logfile"
                fi
            else
                echo "Usage: logs <filename>"
                echo "Available logs: syslog, auth.log, device.log"
            fi
            ;;
        "info")
            echo "Device Model: EmbeddedIoT-X200"
            echo "Firmware: v3.2.1-corporate"
            echo "MAC Address: 00:1B:44:11:3A:B7"
            echo "IP Address: $(hostname -I | cut -d' ' -f1)"
            ;;
        "config")
            if [ -n "$args" ]; then
                # Vulnerability: Directory traversal in config viewing
                configfile="/etc/iot/$args"
                if [ -f "$configfile" ]; then
                    echo "=== Configuration: $args ==="
                    cat "$configfile" 2>/dev/null || echo "Cannot read config file"
                else
                    echo "Config file not found: $configfile"
                fi
            else
                echo "Usage: config <filename>"
                echo "Available configs: network.conf, device.conf, security.conf"
            fi
            ;;
        "exit")
            echo "Goodbye!"
            exit 0
            ;;
        "")
            # Empty command, do nothing
            ;;
        *)
            echo "Unknown command: $cmd"
            echo "Type 'help' for available commands"
            ;;
    esac
done