@echo off
TITLE ARG-LEX - System Setup
COLOR 0A

echo ==================================================
echo      ARG-LEX CONFIGURATION SYSTEM (SETUP)
echo ==================================================
echo.

:: 1. Backend Setup
echo [1/2] Setting up Neural Backend (Python)...
cd backend
if not exist "venv" (
    echo    - Creating Virtual Environment venv...
    python -m venv venv
) else (
    echo    - Virtual Environment found.
)

echo    - Activating venv...
call venv\Scripts\activate

echo    - Installing dependencies (this may take a while)...
pip install -r requirements.txt

echo.
echo [2/2] Setup Complete!
echo.
echo You can now use 'start_arglex.bat' to launch the system.
