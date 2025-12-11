from http.server import HTTPServer, BaseHTTPRequestHandler

class Handler(BaseHTTPRequestHandler):
    def do_GET(self):
        self.send_response(200)
        self.send_header('Content-type', 'text/html')
        self.end_headers()
        self.wfile.write(b"HTTP CTF Challenge placeholder")

if __name__ == "__main__":
    HTTPServer(('0.0.0.0', 8080), Handler).serve_forever()
