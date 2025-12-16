Set WshShell = CreateObject("WScript.Shell")
strPath = WshShell.CurrentDirectory

' 1. Check/Start Ollama (Hidden)
WshShell.Run "cmd /c ollama list >nul 2>&1 || start /min """" ""C:\Users\VICTUS\AppData\Local\Programs\Ollama\ollama.exe"" serve", 0, False

' 2. Start Backend (Hidden - serves BOTH Frontend and API)
' Launches uvicorn on port 8080. This now serves the build/ directory as static files.
WshShell.Run "cmd /c cd backend && .\venv\Scripts\python.exe -m uvicorn open_webui.main:app --host 0.0.0.0 --port 8080", 0, False

' 3. Wait for server startup (15 seconds)
' backend takes a bit to load massive AI libraries + static files
WScript.Sleep 15000

' 4. Open Browser (Port 8080)
' Direct access to backend serving the frontend
WshShell.Run "http://localhost:8080"
