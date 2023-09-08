cls
color 0a 
:admin
    IF "%PROCESSOR_ARCHITECTURE%" EQU "amd64" (
>nul 2>&1 "%SYSTEMROOT%\SysWOW64\cacls.exe" "%SYSTEMROOT%\SysWOW64\config\system" 
) ELSE (
>nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system" 
) 
 
if '%errorlevel%' NEQ '0' (
    goto UACPrompt 
) else (goto gotAdmin) 

:UACPrompt 
    echo Set UAC = CreateObject^("Shell.Application"^) > "%temp%\getadmin.vbs" 
    set params=%* 
    echo UAC.ShellExecute "cmd.exe", "/c ""%~s0"" %params:"=""%", "", "runas", 1 >> "%temp%\getadmin.vbs" 

    "%temp%\getadmin.vbs" 
    del "%temp%\getadmin.vbs" 
    exit /B 

:gotAdmin 
    pushd "%CD%" 
    CD /D "%~dp0" 


:Con_Pass
powershell -ExecutionPolicy ByPass -File Con_Pass.ps1 >nul
timeout 1 >nul
cls 
pause >nul
