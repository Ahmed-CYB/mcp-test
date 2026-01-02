#!/bin/bash
# Flag retrieval script for authorized personnel only
# Access logged and monitored

echo "CTF{snmp_r3ad_wr1t3_c0mmun1ty_3xp0s3d}"
logger "SNMP flag access from $(who am i | awk '{print $1}') at $(date)"