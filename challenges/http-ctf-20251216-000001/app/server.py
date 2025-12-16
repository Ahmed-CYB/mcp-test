#!/usr/bin/env python3
import http.server
import json
import os
import socketserver
from urllib.parse import urlparse, parse_qs

FLAG = os.environ.get("CTF_FLAG", "CTF{dummy_flag}")

USERS = {
    "admin": {"role": "admin", "password": "SuperSecret!"},
    "user": {"role": "user", "password": "password123"},
}

API_KEYS = {
    "internal-scanner": "INT-SCAN-KEY-123",
}

class RequestHandler(http.server.BaseHTTPRequestHandler):
    server_version = "VulnHTTP/1.2"

    def _send_json(self, status, data):
        body = json.dumps(data).encode()
        self.send_response(status)
        self.send_header("Content-Type", "application/json")
        self.send_header("Content-Length", str(len(body)))
        self.end_headers()
        self.wfile.write(body)

    def _send_text(self, status, body):
        body_b = body.encode()
        self.send_response(status)
        self.send_header("Content-Type", "text/plain; charset=utf-8")
        self.send_header("Content-Length", str(len(body_b)))
        self.end_headers()
        self.wfile.write(body_b)

    # Very naive template rendering with SSTI-like behavior
    def _render_template(self, template, context):
        # Insecure: evaluates expressions inside {{ }} using eval
        import re

        def repl(match):
            expr = match.group(1).strip()
            try:
                # Expose context plus builtins like __import__
                safe_ctx = {"ctx": context}
                return str(eval(expr, {"__builtins__": __builtins__}, safe_ctx))
            except Exception as e:
                return f"{{error:{e}}}"

        return re.sub(r"\{\{(.*?)\}\}", repl, template)

    def _get_client_role(self):
        # Layer 1: header-based impersonation (existing flaw)
        forced_user = self.headers.get("X-Forwarded-User")
        if forced_user and forced_user in USERS:
            return USERS[forced_user]["role"], forced_user

        # Layer 2: pretend API gateway trust on X-Internal-Scanner header
        scanner_name = self.headers.get("X-Internal-Scanner")
        api_key = self.headers.get("X-Scanner-Key")
        if scanner_name in API_KEYS and api_key == API_KEYS[scanner_name]:
            # Internal scanner is granted admin role for automation
            return "admin", f"scanner:{scanner_name}"

        return "guest", None

    def do_GET(self):
        parsed = urlparse(self.path)
        path = parsed.path
        qs = parse_qs(parsed.query)

        if path == "/":
            tpl = (
                "Welcome to VulnHTTP!\n\n"
                "Endpoints:\n"
                "  - /login (POST)\n"
                "  - /profile\n"
                "  - /admin (GET, header-based auth)\n"
                "  - /admin/render?template=... (SSTI)\n"
                "  - /debug/config ("""internal""" API)\n"
            )
            self._send_text(200, tpl)
            return

        if path == "/profile":
            role, user = self._get_client_role()
            data = {"user": user or "guest", "role": role}
            self._send_json(200, data)
            return

        if path == "/admin":
            role, user = self._get_client_role()
            if role != "admin":
                self._send_json(403, {"error": "admin only"})
                return
            self._send_json(200, {"message": "Welcome admin", "user": user})
            return

        if path == "/admin/flag":
            role, user = self._get_client_role()
            if role != "admin":
                self._send_json(403, {"error": "admin only"})
                return
            # Additional check: must be accessed via internal scanner header or specific UA
            ua = self.headers.get("User-Agent", "")
            if not (ua.startswith("VulnScanner/") or (user and user.startswith("scanner:"))):
                self._send_json(403, {"error": "admin must use internal scanner"})
                return
            self._send_json(200, {"flag": FLAG})
            return

        if path == "/admin/render":
            role, user = self._get_client_role()
            if role != "admin":
                self._send_json(403, {"error": "admin only"})
                return
            template = qs.get("template", ["Hello {{ ctx['user'] }}"])[0]
            rendered = self._render_template(template, {"user": user, "role": role})
            self._send_text(200, rendered)
            return

        if path == "/debug/config":
            # Fake internal config endpoint intended only for internal scanner
            role, user = self._get_client_role()
            if not (user and user.startswith("scanner:")):
                self._send_json(403, {"error": "internal scanners only"})
                return
            data = {
                "scanners": list(API_KEYS.keys()),
                "note": "internal debug endpoint",
            }
            self._send_json(200, data)
            return

        self._send_json(404, {"error": "not found"})

    def do_POST(self):
        parsed = urlparse(self.path)
        path = parsed.path

        if path == "/login":
            length = int(self.headers.get("Content-Length", 0))
            body = self.rfile.read(length) if length else b""
            try:
                data = json.loads(body or b"{}")
            except Exception:
                data = {}

            username = data.get("username")
            password = data.get("password")
            user_obj = USERS.get(username)
            if not user_obj or user_obj["password"] != password:
                self._send_json(401, {"error": "invalid credentials"})
                return

            # Return pseudo token that is actually derived from username only (weak)
            token = f"token-{username}-static"
            self._send_json(200, {"token": token, "role": user_obj["role"]})
            return

        self._send_json(404, {"error": "not found"})


def run(host="0.0.0.0", port=8080):
    with socketserver.TCPServer((host, port), RequestHandler) as httpd:
        httpd.allow_reuse_address = True
        print(f"Serving on {host}:{port}")
        httpd.serve_forever()


if __name__ == "__main__":
    run()
