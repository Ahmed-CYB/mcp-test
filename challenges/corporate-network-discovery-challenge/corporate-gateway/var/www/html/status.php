<?php
header('Content-Type: text/plain');
echo "Gateway Network Status Report\n";
echo "============================\n\n";
echo "Timestamp: " . date('Y-m-d H:i:s') . "\n";
echo "Gateway IP: 192.168.100.10\n";
echo "Services: FTP(20), SSH(2222), HTTP(8080)\n\n";
echo "Network Segments:\n";
echo "- Gateway: 192.168.100.0/24\n";
echo "- DMZ: 10.10.1.0/24\n";
echo "- Internal: 172.16.50.0/24\n\n";
echo "Active Connections: " . rand(5, 25) . "\n";
echo "CPU Usage: " . rand(15, 45) . "%\n";
echo "Memory Usage: " . rand(30, 70) . "%\n\n";
echo "Last Security Scan: 2024-01-20 09:15:30\n";
echo "Status: All systems operational\n";
?>