import sys
import os

# Ensure project root and src/ are in sys.path
ROOT_DIR = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
if ROOT_DIR not in sys.path:
    sys.path.insert(0, ROOT_DIR)

SRC_DIR = os.path.join(ROOT_DIR, "src")
if SRC_DIR not in sys.path:
    sys.path.insert(0, SRC_DIR)

from src.server import app

@app.middleware("http")
async def vercel_path_normalizer(request, call_next):
    # If Vercel passed x-matched-path, normalize scope path
    x_matched = request.headers.get("x-matched-path")
    if x_matched and x_matched != request.url.path:
        request.scope["path"] = x_matched
    response = await call_next(request)
    return response
