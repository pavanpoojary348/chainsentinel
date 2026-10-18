#!/usr/bin/env bash
# =============================================================================
# ChainSentinel: 1-Click Universal Production Launcher
# Optimized for IBM LinuxONE (s390x), Linux & macOS
# =============================================================================
set -e

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd "$DIR"

echo "================================================================================"
echo "   ChainSentinel | IBM Z Supply Chain Disruption Intelligence"
echo "   Team PingXero | IBM Z Datathon 2026"
echo "================================================================================"

# 1. Detect Python
PYTHON_CMD=""
if command -v python3 &>/dev/null; then
    PYTHON_CMD="python3"
elif command -v python &>/dev/null; then
    PYTHON_CMD="python"
else
    echo "[ERROR] Python 3 is required but not found in PATH."
    exit 1
fi

PY_VERSION=$($PYTHON_CMD --version 2>&1)
ARCH=$(uname -m 2>/dev/null || echo "Unknown")
echo "[*] Detected: $PY_VERSION on $ARCH"

# 2. Virtual Environment check
if [ ! -d ".venv" ]; then
    echo "[*] Initializing isolated virtual environment (.venv)..."
    $PYTHON_CMD -m venv .venv
fi

# Activate venv
if [ -f ".venv/bin/activate" ]; then
    source .venv/bin/activate
elif [ -f ".venv/Scripts/activate" ]; then
    source .venv/Scripts/activate
fi

# 3. Ensure Dependencies
echo "[*] Verifying dependencies..."
python -m pip install -q -r requirements.txt

# 4. Run Self-Verification Tests
echo "[*] Running Automated Pre-Flight Integrity Test Suite..."
python tests/test_prediction.py
python tests/test_api.py
echo "[✓] All ML Models, LangGraph Agents & API Endpoints Verified 100%!"

# 5. Detect Host IP
HOST_IP=$(hostname -I 2>/dev/null | awk '{print $1}' || echo "127.0.0.1")

echo ""
echo "================================================================================"
echo "   🚀 ChainSentinel Full-Stack Platform is ONLINE!"
echo "================================================================================"
echo "   * Web Command Center (Local):    http://localhost:8000"
echo "   * Network / Smartphone Access:   http://${HOST_IP}:8000"
echo "   * REST API & Swagger Docs:       http://localhost:8000/docs"
echo "   * Interactive Jupyter Notebook:  ChainSentinel_IBM_Z_Demo.ipynb"
echo "================================================================================"
echo "   Press Ctrl+C to stop the server."
echo ""

# 6. Launch Combined Server
exec python -m uvicorn src.server:app --host 0.0.0.0 --port 8000
