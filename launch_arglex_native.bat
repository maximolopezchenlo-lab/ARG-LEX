@echo off
cd /d "%~dp0backend"
start "" ".\venv\Scripts\pythonw.exe" "desktop_app.py"
exit
