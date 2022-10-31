#!/usr/bin/env python3

from http.server import SimpleHTTPRequestHandler
from socketserver import TCPServer
import logging
import sys
import socket

try:
    PORT = int(sys.argv[1])
except:
    PORT = 8000

HOST_HOSTNAME = socket.gethostname()

try:
    HOST_IP = socket.gethostbyname(HOST_HOSTNAME)
except:
    HOST_IP = None

class GetHandler(SimpleHTTPRequestHandler):

    def do_GET(self):
        self.headers['X-Host-Hostname'] = HOST_HOSTNAME
        self.headers['X-Host-Ip'] = HOST_IP
        self.headers['X-Host-Port'] = '{}'.format(PORT)
        self.send_response(200, self.headers)
        for h in self.headers:
            self.send_header(h, self.headers[h])
        self.end_headers()

Handler = GetHandler
httpd = TCPServer(('', PORT), Handler)

httpd.serve_forever()
