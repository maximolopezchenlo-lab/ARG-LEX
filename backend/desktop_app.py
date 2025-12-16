import webview
import threading
import time
import sys
import os
import subprocess
import socket
import requests

# Configuration
PORT = 8080
HOST = "localhost"
URL = f"http://{HOST}:{PORT}"
TITLE = "ARG-LEX Command Center"

def is_port_in_use(port):
    with socket.socket(socket.AF_INET, socket.SOCK_STREAM) as s:
        return s.connect_ex(('localhost', port)) == 0

def check_server_ready():
    start_time = time.time()
    while time.time() - start_time < 30:  # Wait up to 30 seconds
        try:
            response = requests.get(f"{URL}/health", timeout=1)
            if response.status_code == 200:
                print("Server is ready!")
                return True
        except requests.ConnectionError:
            pass
        time.sleep(0.5)
    return False

def start_backend():
    # Path to python executable in venv
    venv_python = os.path.join(os.path.dirname(__file__), "venv", "Scripts", "python.exe")
    if not os.path.exists(venv_python):
        # Fallback for dev environment path differences
        venv_python = os.path.join(os.path.dirname(__file__), "..", "venv", "Scripts", "python.exe")

    cmd = [
        venv_python,
        "-m", "uvicorn", 
        "open_webui.main:app", 
        "--host", "0.0.0.0", 
        "--port", str(PORT)
    ]
    
    # Hide console window
    startupinfo = subprocess.STARTUPINFO()
    startupinfo.dwFlags |= subprocess.STARTF_USESHOWWINDOW
    
    process = subprocess.Popen(
        cmd,
        cwd=os.path.dirname(__file__),
        startupinfo=startupinfo
    )
    return process

def check_ollama():
    try:
        # Check if Ollama is running
        subprocess.run(
            ["ollama", "list"], 
            check=True, 
            stdout=subprocess.DEVNULL, 
            stderr=subprocess.DEVNULL,
            creationflags=subprocess.CREATE_NO_WINDOW
        )
    except:
        # If not, start it (assuming standard path)
        ollama_path = os.path.expanduser("~\\AppData\\Local\\Programs\\Ollama\\ollama.exe")
        if os.path.exists(ollama_path):
            subprocess.Popen(
                [ollama_path, "serve"],
                creationflags=subprocess.CREATE_NO_WINDOW
            )

def main():
    print("Starting ARG-LEX...")
    
    # 1. Ensure Ollama is running
    threading.Thread(target=check_ollama, daemon=True).start()
    
    # 2. Start Backend (if not already running)
    backend_process = None
    if not is_port_in_use(PORT):
        print("Starting backend server...")
        backend_process = start_backend()
        
        # Wait for server to be ready before showing window
        # This prevents the "Connection Refused" error page
        if not check_server_ready():
            webview.create_window("Error", html="<h1>Error: Could not start ARG-LEX Server</h1>")
            webview.start()
            return

    # 3. Create Native Window
    window = webview.create_window(
        TITLE, 
        URL,
        width=1280,
        height=800,
        resizable=True,
        min_size=(800, 600),
        background_color='#050505',
        text_select=True
    )

    # 4. Start App
    webview.start(debug=False)

    # 5. Cleanup on Exit
    print("Closing ARG-LEX...")
    if backend_process:
        backend_process.terminate()
        backend_process.wait()
        # Force kill if needed
        subprocess.run(["taskkill", "/F", "/PID", str(backend_process.pid)], 
                       creationflags=subprocess.CREATE_NO_WINDOW)

if __name__ == '__main__':
    main()
