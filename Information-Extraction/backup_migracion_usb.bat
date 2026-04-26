@echo off
setlocal EnableExtensions EnableDelayedExpansion

title Backup completo de datos a USB
color 0A

set "SCRIPT_DIR=%~dp0"
set "DEST_DRIVE=%~d0"
set "SYSTEM_DRIVE=%SystemDrive%"
if not defined SYSTEM_DRIVE set "SYSTEM_DRIVE=C:"

set "USERS_ROOT=%SYSTEM_DRIVE%\Users"
set "DEST_ROOT=%SCRIPT_DIR%Data_PC\%COMPUTERNAME%_%USERNAME%"
set "LOG_DIR=%DEST_ROOT%\_logs"
set "LOG_FILE=%LOG_DIR%\backup.log"
set "EXTRA_FILE=%SCRIPT_DIR%backup_extra_paths.txt"
set "FAIL=0"
set "IS_ADMIN=0"

rem Si el destino esta en otra unidad, no se escanea esa unidad para evitar copiar la USB dentro del backup.
set "SKIP_DESTINATION_DRIVE=1"

where robocopy >nul 2>nul
if errorlevel 1 (
    echo ERROR: robocopy no esta disponible en este equipo.
    echo Este script requiere Windows Vista/7/8/10/11 o Windows Server moderno.
    goto :FinishError
)

net session >nul 2>nul
if not errorlevel 1 set "IS_ADMIN=1"

if not exist "%LOG_DIR%" mkdir "%LOG_DIR%" >nul 2>nul
if errorlevel 1 (
    echo ERROR: No se pudo crear el destino:
    echo "%LOG_DIR%"
    goto :FinishError
)

(
    echo ============================================================
    echo Inicio: %DATE% %TIME%
    echo Equipo: %COMPUTERNAME%
    echo Usuario que ejecuta: %USERNAME%
    echo Raiz de perfiles: %USERS_ROOT%
    echo Destino: %DEST_ROOT%
    echo Administrador: %IS_ADMIN%
    echo ============================================================
)>>"%LOG_FILE%"

echo.
echo Backup completo de datos
echo Raiz de perfiles: "%USERS_ROOT%"
echo Destino: "%DEST_ROOT%"
echo Log: "%LOG_FILE%"
echo.

if "%IS_ADMIN%"=="0" (
    echo AVISO: No parece estar ejecutandose como administrador.
    echo        Para copiar otros perfiles completos, ejecuta este .bat como administrador.
    echo.
    echo AVISO: No se ejecuto como administrador.>>"%LOG_FILE%"
)

call :CopyAllProfiles
call :CopyTopLevelDataFolders
call :CopyExtraPaths

(
    echo Fin: %DATE% %TIME%
    echo Resultado: %FAIL%
    echo.
)>>"%LOG_FILE%"

echo.
if "%FAIL%"=="0" (
    echo Backup terminado. Revisa el log si quieres confirmar detalles.
    goto :FinishOk
) else (
    echo Backup terminado con errores. Revisa:
    echo "%LOG_FILE%"
    goto :FinishError
)

:CopyAllProfiles
echo.
echo Copiando perfiles locales...

if not exist "%USERS_ROOT%" (
    echo AVISO: No existe "%USERS_ROOT%".
    echo AVISO: No existe "%USERS_ROOT%".>>"%LOG_FILE%"
    if defined USERPROFILE call :CopyDir "%USERPROFILE%" "Users\%USERNAME%"
    goto :eof
)

for /d %%U in ("%USERS_ROOT%\*") do (
    set "PROFILE_NAME=%%~nxU"
    set "SKIP_PROFILE=0"

    if /I "!PROFILE_NAME!"=="All Users" set "SKIP_PROFILE=1"
    if /I "!PROFILE_NAME!"=="Default" set "SKIP_PROFILE=1"
    if /I "!PROFILE_NAME!"=="Default User" set "SKIP_PROFILE=1"

    if "!SKIP_PROFILE!"=="0" (
        call :CopyDir "%%~fU" "Users\%%~nxU"
    ) else (
        echo Omitiendo perfil de sistema "%%~fU"
        echo Omitiendo perfil de sistema "%%~fU">>"%LOG_FILE%"
    )
)
goto :eof

:CopyTopLevelDataFolders
echo.
echo Buscando carpetas de datos fuera de perfiles...

set "FOUND_FIXED_DRIVES=0"
for /f "skip=1 tokens=1" %%D in ('wmic logicaldisk where "drivetype=3" get deviceid 2^>nul') do (
    if not "%%D"=="" (
        set "FOUND_FIXED_DRIVES=1"
        call :ScanDrive "%%D"
    )
)

if "!FOUND_FIXED_DRIVES!"=="0" (
    echo AVISO: No se pudo usar WMIC para detectar discos fijos; usando C: a Z: como respaldo.
    echo AVISO: WMIC no disponible; usando C: a Z:.>>"%LOG_FILE%"
    for %%D in (C D E F G H I J K L M N O P Q R S T U V W X Y Z) do (
        if exist "%%D:\" call :ScanDrive "%%D:"
    )
)
goto :eof

:ScanDrive
set "DRIVE=%~1"
if not defined DRIVE goto :eof
if not exist "%DRIVE%\" goto :eof

if "%SKIP_DESTINATION_DRIVE%"=="1" (
    if /I "%DRIVE%"=="%DEST_DRIVE%" (
        if /I not "%DRIVE%"=="%SYSTEM_DRIVE%" (
            echo Omitiendo unidad de destino "%DRIVE%\"
            echo Omitiendo unidad de destino "%DRIVE%\">>"%LOG_FILE%"
            goto :eof
        )
    )
)

echo Revisando "%DRIVE%\"
for /d %%F in ("%DRIVE%\*") do call :MaybeCopyTopFolder "%%~fF"
goto :eof

:MaybeCopyTopFolder
set "TOP=%~1"
set "TOP_NAME=%~nx1"
set "SKIP_TOP=0"

if /I "!TOP!"=="%USERS_ROOT%" set "SKIP_TOP=1"
if /I "!TOP_NAME!"=="$Recycle.Bin" set "SKIP_TOP=1"
if /I "!TOP_NAME!"=="$WINDOWS.~BT" set "SKIP_TOP=1"
if /I "!TOP_NAME!"=="$WINDOWS.~WS" set "SKIP_TOP=1"
if /I "!TOP_NAME!"=="Config.Msi" set "SKIP_TOP=1"
if /I "!TOP_NAME!"=="Documents and Settings" set "SKIP_TOP=1"
if /I "!TOP_NAME!"=="ESD" set "SKIP_TOP=1"
if /I "!TOP_NAME!"=="Intel" set "SKIP_TOP=1"
if /I "!TOP_NAME!"=="MSOCache" set "SKIP_TOP=1"
if /I "!TOP_NAME!"=="NVIDIA" set "SKIP_TOP=1"
if /I "!TOP_NAME!"=="PerfLogs" set "SKIP_TOP=1"
if /I "!TOP_NAME!"=="Program Files" set "SKIP_TOP=1"
if /I "!TOP_NAME!"=="Program Files (x86)" set "SKIP_TOP=1"
if /I "!TOP_NAME!"=="ProgramData" set "SKIP_TOP=1"
if /I "!TOP_NAME!"=="Recovery" set "SKIP_TOP=1"
if /I "!TOP_NAME!"=="System Volume Information" set "SKIP_TOP=1"
if /I "!TOP_NAME!"=="Windows" set "SKIP_TOP=1"
if /I "!TOP_NAME!"=="Windows.old" set "SKIP_TOP=1"
if /I "!TOP_NAME!"=="Windows10Upgrade" set "SKIP_TOP=1"

if "!SKIP_TOP!"=="1" (
    echo Omitiendo carpeta de sistema "!TOP!"
    echo Omitiendo carpeta de sistema "!TOP!">>"%LOG_FILE%"
    goto :eof
)

set "LABEL=!TOP!"
set "LABEL=!LABEL::=!"
set "LABEL=!LABEL:\=_!"
set "LABEL=!LABEL:/=_!"
call :CopyDir "!TOP!" "OtherFolders\!LABEL!"
goto :eof

:CopyExtraPaths
if exist "%EXTRA_FILE%" (
    echo.
    echo Revisando rutas adicionales en "%EXTRA_FILE%"...
    for /f "usebackq delims=" %%P in ("%EXTRA_FILE%") do (
        set "EXTRA_PATH=%%P"
        if defined EXTRA_PATH (
            if not "!EXTRA_PATH:~0,1!"=="#" call :CopyExtra "!EXTRA_PATH!"
        )
    )
) else (
    echo.
    echo No existe "%EXTRA_FILE%"; no se copiaron rutas adicionales.
)
goto :eof

:CopyExtra
set "SRC=%~1"
if not defined SRC goto :eof
if not exist "%SRC%" (
    echo AVISO: No existe la ruta adicional "%SRC%"
    echo AVISO: No existe la ruta adicional "%SRC%">>"%LOG_FILE%"
    goto :eof
)

set "LABEL=%SRC%"
set "LABEL=!LABEL::=!"
set "LABEL=!LABEL:\=_!"
set "LABEL=!LABEL:/=_!"
call :CopyDir "%SRC%" "Extra\!LABEL!"
goto :eof

:CopyDir
set "SRC=%~1"
set "LABEL=%~2"

if not exist "%SRC%" (
    echo AVISO: No existe "%SRC%"
    echo AVISO: No existe "%SRC%">>"%LOG_FILE%"
    goto :eof
)

echo.
echo Copiando "%SRC%"
echo      a "%DEST_ROOT%\%LABEL%"

robocopy "%SRC%" "%DEST_ROOT%\%LABEL%" /E /ZB /XJ /FFT /R:2 /W:2 /MT:8 /COPY:DAT /DCOPY:DAT /NP /TEE /LOG+:"%LOG_FILE%" ^
    /XD "%DEST_ROOT%" ^
    /XF "NTUSER.DAT" "ntuser.dat.LOG1" "ntuser.dat.LOG2" "UsrClass.dat" "UsrClass.dat.LOG1" "UsrClass.dat.LOG2"

set "RC=%ERRORLEVEL%"
if %RC% GEQ 8 (
    set "FAIL=1"
    echo ERROR: robocopy devolvio codigo %RC% para "%SRC%"
    echo ERROR: robocopy devolvio codigo %RC% para "%SRC%">>"%LOG_FILE%"
) else (
    echo OK: "%SRC%" terminado con codigo %RC%
)
goto :eof

:FinishOk
if /I not "%~1"=="--no-pause" pause
exit /b 0

:FinishError
if /I not "%~1"=="--no-pause" pause
exit /b 1
