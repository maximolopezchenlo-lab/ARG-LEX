$WshShell = New-Object -comObject WScript.Shell
$DesktopPath = [Environment]::GetFolderPath("Desktop")
$Shortcut = $WshShell.CreateShortcut("$DesktopPath\ARG-LEX.lnk")
$Shortcut.TargetPath = "$PSScriptRoot\launch_arglex_native.bat"
$Shortcut.WorkingDirectory = "$PSScriptRoot"
$Shortcut.Description = "ARG-LEX"
$Shortcut.IconLocation = "$PSScriptRoot\static\logo.ico,0"
$Shortcut.Save()

$StopShortcut = $WshShell.CreateShortcut("$DesktopPath\Detener ARG-LEX.lnk")
$StopShortcut.TargetPath = "$PSScriptRoot\stop_arglex.bat"
$StopShortcut.WorkingDirectory = "$PSScriptRoot"
$StopShortcut.Description = "Detener"
$StopShortcut.IconLocation = "shell32.dll,28" 
$StopShortcut.Save()

$StartMenuPath = [Environment]::GetFolderPath("StartMenu")
$StartMenuShortcut = $WshShell.CreateShortcut("$StartMenuPath\Programs\ARG-LEX.lnk")
$StartMenuShortcut.TargetPath = "$PSScriptRoot\launch_arglex_native.bat"
$StartMenuShortcut.WorkingDirectory = "$PSScriptRoot"
$StartMenuShortcut.Description = "ARG-LEX"
$StartMenuShortcut.IconLocation = "$PSScriptRoot\static\logo.ico,0"
$StartMenuShortcut.Save()

Write-Host "Shortcuts created successfully."
