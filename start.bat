@echo off
REM =============================================================================
REM ChainSentinel: 1-Click Universal Production Launcher (Windows)
REM Team PingXero | IBM Z Datathon 2026
REM =============================================================================
setlocal enabledelayedexpansion
title ChainSentinel - IBM Z Disruption Intelligence

echo ================================================================================
echo    ChainSentinel ^| IBM Z Supply Chain Disruption Intelligence
echo    Team PingXero ^| IBM Z Datathon 2026
echo ================================================================================

cd /d "%~dp0"

REM 1. Check Python
where python >nul 2>&1
if %errorlevel% neq 0 (
    echo [ERROR] Python 3 was not found in PATH. Please install Python 3.10+
    pause
    exit /b 1
)

REM 2. Check Virtual Environment
if not exist ".venv" (
    echo [*] Creating virtual environment (.venv)...
    python -m venv .venv
)

call .venv\Scripts\activate.bat

echo [*] Verifying dependencies...
pip install -q -r requirements.txt

echo [*] Running automated tests...
python tests\test_prediction.py
python tests\test_api.py
echo [OK] All tests passed!

echo.
echo ================================================================================
echo    ChainSentinel is Ready!
echo ================================================================================
echo    * Local Dashboard:  http://localhost:8000
echo    * API Documentation: http://localhost:8000/docs
echo ================================================================================
echo.

start http://localhost:8000

python src\server.py
pause
