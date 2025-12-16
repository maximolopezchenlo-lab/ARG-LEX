@echo off
TITLE Detener ARG-LEX
COLOR 0C
echo.
echo ================================================================
echo   DETENIENDO ARG-LEX
echo ================================================================
echo.
echo Cerrando procesos de fondo...

:: Kill Backend (Python Uvicorn)
taskkill /IM python.exe /F >nul 2>&1
echo [OK] Backend detenido

:: Kill Frontend (Node Vite)
taskkill /IM node.exe /F >nul 2>&1
echo [OK] Frontend detenido

:: Kill Ollama (Optional - uncomment if you want to stop the AI engine too)
:: taskkill /IM ollama.exe /F >nul 2>&1
:: echo [OK] Ollama detenido

echo.
echo ================================================================
echo   ARG-LEX se ha cerrado correctamente.
echo ================================================================
timeout /t 3
exit
