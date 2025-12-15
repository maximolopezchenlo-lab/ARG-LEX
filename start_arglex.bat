@echo off
TITLE ARG-LEX - Command Center
COLOR 0F

echo ==================================================
echo            ARG-LEX COMMAND CENTER
echo ==================================================
echo.

:: Check for Ollama
tasklist /FI "IMAGENAME eq ollama_app.exe" 2>NUL | find /I /N "ollama_app.exe">NUL
if "%ERRORLEVEL%"=="0" (
    echo [STATUS] Brain Ollama is ONLINE.
) else (
    echo [WARNING] Brain Ollama is NOT RUNNING.
    echo           Please start Ollama manually for full functionality.
)

echo.
echo [1/2] Initializing Neural Backend...
start "ARG-LEX Backend" cmd /k "cd backend && venv\Scripts\activate && start_windows.bat"

echo.
echo [2/2] Initializing Visual Interface...
start "ARG-LEX Interface" cmd /k "npm run dev"

echo.
echo System Operational.
echo Access the interface at: http://localhost:5173
echo.
