<?php
// Database configuration
$db_host = 'localhost';
$db_user = 'webapp';
$db_pass = 'devpass123';
$db_name = 'corporate_db';

// FTP configuration
$ftp_server = '192.168.1.100';
$ftp_user = 'anonymous';
$ftp_pass = '';

// Telnet credentials for network devices
$telnet_devices = array(
    '192.168.1.10' => array('user' => 'admin', 'pass' => 'admin'),
    '192.168.1.20' => array('user' => 'cisco', 'pass' => 'cisco'),
    '192.168.1.30' => array('user' => 'root', 'pass' => 'toor')
);

// SSH backup server
$backup_server = '192.168.1.50';
$backup_user = 'backup';
$backup_key = '/home/dev/.ssh/id_rsa';

// Network topology - internal use only
$network_map = array(
    'development-webserver' => '192.168.1.100',
    'corporate-fileserver' => '192.168.1.101',
    'backup-storage' => '192.168.1.102'
);

// Flag piece 1 of 3
$flag_part1 = 'Q1RGe25ldHdvcmtfcmVjb25f';
?>