#!/usr/bin/env python3
import http.server
import socketserver
import urllib.parse as urlparse
import json
import os

FLAG = os.environ.get("CTF_FLAG", "CTF{default_dev_flag}")

USERS = {
    "admin": {
        "password": "SuperSecretAdmin123!",
        "role": "admin"
    },
    "guest": {
        "password": "guest",
        "role": "guest"
    }
}

SESSIONS = {}

class Handler(http.server.SimpleHTTPRequestHandler):
    def _send_json(self, data, status=200):
        body = json.dumps(data).encode()
        self.send_response(status)
        self.send_header("Content-Type", "application/json")
        self.send_header("Content-Length", str(len(body)))
        self.end_headers()
        self.wfile.write(body)

    def do_POST(self):
        length = int(self.headers.get("Content-Length", 0))
        body = self.rfile.read(length).decode("utf-8")
        ctype = self.headers.get("Content-Type", "")

        # Intentionally naive parsing to simulate a vuln surface
        if "application/json" in ctype:
            try:
                data = json.loads(body)
            except Exception:
                data = {}
        else:
            data = dict(urlparse.parse_qsl(body))

        if self.path == "/login":
            username = data.get("username", "")
            password = data.get("password", "")
            user = USERS.get(username)
            if user and user["password"] == password:
                # naive session token: predictable and injectable via headers
                token = f"sess-{username}-{self.client_address[0]}"
                SESSIONS[token] = user
                self._send_json({"ok": True, "token": token})
            else:
                self._send_json({"ok": False, "error": "invalid credentials"}, status=403)
            return

        if self.path == "/admin":
            # Vulnerable auth: trusts X-User header before token check
            forced_user = self.headers.get("X-User")
            if forced_user and forced_user in USERS:
                user = USERS[forced_user]
            else:
                token = self.headers.get("X-Session")
                user = SESSIONS.get(token)

            if not user or user.get("role") != "admin":
                self._send_json({"ok": False, "error": "admin only"}, status=403)
                return

            # Simple command-like parameter with whitelist bypass potential
            action = data.get("action", "info")
            if action == "info":
                self._send_json({"ok": True, "role": user["role"], "hint": "Try abusing headers"})
            elif action == "get_flag":
                self._send_json({"ok": True, "flag": FLAG})
            else:
                self._send_json({"ok": False, "error": "unknown action"}, status=400)
            return

        self._send_json({"ok": False, "error": "unknown endpoint"}, status=404)


if __name__ == "__main__":
    PORT = int(os.environ.get("PORT", "8080"))
    with socketserver.TCPServer(("0.0.0.0", PORT), Handler) as httpd:
        print(f"Serving on port {PORT}")
        httpd.serve_forever()
