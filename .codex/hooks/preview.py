#!/usr/bin/env python3
"""Start or reuse a loopback-only preview with Python's standard library."""

import hashlib
import subprocess
import sys
import time
from functools import partial
from http.server import SimpleHTTPRequestHandler, ThreadingHTTPServer
from pathlib import Path
from urllib.error import URLError
from urllib.parse import unquote, urlsplit
from urllib.request import ProxyHandler, build_opener

ROOT = Path(__file__).resolve().parents[2]
IDENTITY = hashlib.sha256(str(ROOT).encode()).hexdigest().encode()
HEALTH_PATH = "/__cincy_preview_health"
PORTS = range(8000, 8010)
OPENER = build_opener(ProxyHandler({}))


class PreviewHandler(SimpleHTTPRequestHandler):
    def do_GET(self):
        if urlsplit(self.path).path == HEALTH_PATH:
            self.send_response(200)
            self.end_headers()
            self.wfile.write(IDENTITY)
            return
        super().do_GET()

    def send_head(self):
        path = unquote(urlsplit(self.path).path)
        target = Path(self.translate_path(path)).resolve()
        allowed = {"index.html", "about.html", "contact.html", "style.css", "script.js"}
        if path == "/":
            target = ROOT / "index.html"
        if not target.is_relative_to(ROOT) or not (
            target.name in allowed and target.parent == ROOT
            or target.is_relative_to(ROOT / "images")
        ) or any(part.startswith(".") for part in target.relative_to(ROOT).parts):
            self.send_error(404)
            return None
        return super().send_head()

    def list_directory(self, path):
        self.send_error(404)
        return None

    def end_headers(self):
        self.send_header("Cache-Control", "no-store")
        super().end_headers()

    def log_message(self, format, *args):
        pass


def ready(port):
    try:
        with OPENER.open(f"http://127.0.0.1:{port}{HEALTH_PATH}", timeout=0.2) as response:
            return response.read(len(IDENTITY) + 1) == IDENTITY
    except (URLError, OSError):
        return False


def ensure_preview():
    for port in PORTS:
        if ready(port):
            return port
    for port in PORTS:
        process = subprocess.Popen(
            [sys.executable, str(Path(__file__).resolve()), "--serve", str(port)],
            cwd=ROOT,
            stdin=subprocess.DEVNULL,
            stdout=subprocess.DEVNULL,
            stderr=subprocess.DEVNULL,
            start_new_session=True,
        )
        for _ in range(20):
            if ready(port):
                return port
            if process.poll() is not None:
                break
            time.sleep(0.1)
        if process.poll() is None:
            process.terminate()
    raise RuntimeError("No preview port is available between 8000 and 8009.")


if __name__ == "__main__":
    if len(sys.argv) == 3 and sys.argv[1] == "--serve":
        server = ThreadingHTTPServer(
            ("127.0.0.1", int(sys.argv[2])), partial(PreviewHandler, directory=str(ROOT))
        )
        server.serve_forever()
    else:
        try:
            port = ensure_preview()
            print(f"Local site preview: http://127.0.0.1:{port}/")
            print("Open this URL in the browser. Refresh after edits; the files are served directly.")
        except (OSError, RuntimeError) as error:
            print(f"Local preview could not start: {error}. Explain the failure to RJ in plain language and describe how you will fix it.")
            sys.exit(1)
