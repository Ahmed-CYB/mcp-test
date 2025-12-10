#!/usr/bin/env python3
import cgi
import os
import subprocess

print("Content-Type: text/plain\n")

form = cgi.FieldStorage()
cmd = form.getfirst("action", "")

# Intentional vuln: unsanitized argument passed to shell when a specific token is used
secret = os.environ.get("FW_ADMIN_TOKEN", "admin")

if cmd.startswith("backup"):
    target = form.getfirst("target", "logs")
    # vuln: command concat simulating FortiWeb backup routine bug
    shell_cmd = f"tar czf - /opt/fortiweb/{target}"
    # backdoor path when special header is provided (simulating logic bug)
    if os.environ.get("HTTP_X_FW_DEBUG", "0") == secret:
        extra = form.getfirst("debug_cmd", "")
        if extra:
            shell_cmd = shell_cmd + " && " + extra
    proc = subprocess.Popen(shell_cmd, shell=True, stdout=subprocess.PIPE, stderr=subprocess.PIPE)
    out, err = proc.communicate(timeout=5)
    print(out.decode(errors="ignore"))
else:
    print("No action executed")
