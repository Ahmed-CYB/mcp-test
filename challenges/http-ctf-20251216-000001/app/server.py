from http.server import HTTPServer, SimpleHTTPRequestHandler
import os

class CTFHandler(SimpleHTTPRequestHandler):
    def do_GET(self):
        if self.path == '/':
            return super().do_GET()
        return super().do_GET()

if __name__ == '__main__':
    port = int(os.environ.get('PORT', 8080))
    server_address = ('', port)
    httpd = HTTPServer(server_address, CTFHandler)
    print(f'Serving on port {port}')
    httpd.serve_forever()
