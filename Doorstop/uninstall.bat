@echo off
for /f "skip=2 tokens=2*" %%a in ('reg query "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\Steam App 2484110" /v InstallLocation') do set INSTALLDIR=%%~b
if %INSTALLDIR:~-5% neq FF7EC (
    set /p INSTALLDIR=Unable to find FF7EC install directory, please input it: 
)
:uninstall
if exist "%INSTALLDIR%/FF7EC.exe" (
    echo Uninstalling from "%INSTALLDIR%"
    del /q "%INSTALLDIR%\doorstop_config.ini"
    del /q "%INSTALLDIR%\winhttp.dll"
    echo Done!
) else (
    set /p INSTALLDIR=Unabled to find "FF7EC.exe" in "%INSTALLDIR%", please input a different install directory: 
    goto uninstall
)

pause