@echo off
@REM ---------- EJECUTAR COMO ADMINISTRADOR ---------------
color 02

title Microsoft Office 2016 Activator&cls&echo.&echo ****************************************************************************&echo Microsoft Office 2016 Activator!&echo.&echo.****************************************************************************&echo.&echo #This project is using KMS server.&echo.&echo #Supported products:&echo - Microsoft Office Standard 2016&echo - Microsoft Office Professional Plus 2016&echo.&(if exist "%ProgramFiles%\Microsoft Office\Office16\ospp.vbs" cd /d "%ProgramFiles%\Microsoft Office\Office16")&(if exist "%ProgramFiles(x86)%\Microsoft Office\Office16\ospp.vbs" cd /d "%ProgramFiles(x86)%\Microsoft Office\Office16")&(for /f %%x in ('dir /b ..\root\Licenses16\proplusvl_kms*.xrm-ms') do cscript ospp.vbs /inslic:"..\root\Licenses16\%%x" >nul)&(for /f %%x in ('dir /b ..\root\Licenses16\proplusvl_mak*.xrm-ms') do cscript ospp.vbs /inslic:"..\root\Licenses16\%%x" >nul)&echo.&echo ****************************************************************************&echo Activating your Microsoft Office...&echo.&cscript //nologo ospp.vbs /unpkey:WFG99 >nul&cscript //nologo ospp.vbs /unpkey:DRTFM >nul&cscript //nologo ospp.vbs /unpkey:BTDRB >nul&cscript //nologo ospp.vbs /unpkey:CPQVG >nul&cscript //nologo ospp.vbs /inpkey:XQNVK-8JYDB-WJ9W3-YJ8YR-WFG99 >nul&set i=1
:server
if %i%==1 set KMS_Sev=kms7.MSGuides.com
if %i%==2 set KMS_Sev=kms8.MSGuides.com
if %i%==3 set KMS_Sev=kms9.MSGuides.com
if %i%==4 goto notsupported
cscript //nologo ospp.vbs /sethst:%KMS_Sev% >nul&echo ****************************************************************************&echo.
cscript //nologo ospp.vbs /act | find /i "successful" && (echo.&echo ****************************************************************************&echo.&echo ****************************************************************************&echo.&choice /n /c YN /m "Quieres ver mis proyectos en Github? [y/n]?" & if errorlevel 2 exit) || (echo The connection to my KMS server failed! Trying to connect to another one... & echo Please wait... & echo. & echo. & set /a i+=1 & goto server)
explorer "https://github.com/Yextep"&goto halt
:notsupported
echo.&echo ***************************************************************************=&echo Sorry! Your version is not supported.&echo Please try installing the latest version!
:halt
pause
