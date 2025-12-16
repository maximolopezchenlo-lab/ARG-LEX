@echo off
TITLE ARG-LEX Launcher
COLOR 0A
echo.
echo ================================================================
echo   ARG-LEX - Sistema de Inteligencia Legal Argentina
echo ================================================================
echo.
echo [1/3] Verificando Ollama...
C:\Users\VICTUS\AppData\Local\Programs\Ollama\ollama.exe list >nul 2>&1
if %errorlevel% neq 0 (
    echo [ERROR] Ollama no esta corriendo. Iniciando...
    start "" "C:\Users\VICTUS\AppData\Local\Programs\Ollama\ollama.exe" serve
    timeout /t 3 /nobreak >nul
)
echo [OK] Ollama operacional

echo.
echo [2/3] Iniciando Sistema Unificado (Backend + Frontend)...
start "ARG-LEX Server" cmd /k "cd /d "%~dp0backend" && .\venv\Scripts\python.exe -m uvicorn open_webui.main:app --host 0.0.0.0 --port 8080"
timeout /t 10 /nobreak >nul
echo [OK] Servidor iniciado en puerto 8080

echo.
echo [3/3] Abriendo navegador...
timeout /t 5 /nobreak >nul
start http://localhost:8080
echo [OK] ARG-LEX esta listo

echo.
echo ================================================================
echo   ARG-LEX se esta ejecutando
echo   URL: http://localhost:8080 (Sistema Integrado)
echo   
echo   Presiona cualquier tecla para cerrar este launcher
echo   (El servidor seguira corriendo en segundo plano)
echo ================================================================
pause >nul
exit
