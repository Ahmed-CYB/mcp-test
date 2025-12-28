#!/bin/bash
service ssh start
export FLAG_PART1='CTF{advanced_' && sleep 5
python3 -c "import os; os.environ['FLAG_PART2'] = 'memory_'" && sleep 5
python3 -c "import os; os.environ['FLAG_PART3'] = 'analysis_2024}'" && sleep 5
/bin/bash -c 'while true; do sleep 3600; done'