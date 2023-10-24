@echo off
SetLocal
set VBSFile=%temp%\invisible.vbs
(
echo Set objShell = CreateObject("WScript.Shell"^)
echo objShell.Run "backup.bat", 0, False
)>%VBSFile%
cscript //nologo %VBSFile%
EndLocal
