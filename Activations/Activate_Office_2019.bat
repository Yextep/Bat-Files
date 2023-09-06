@echo off
color 02
@REM ---------- EJECUTAR COMO ADMINISTRADOR ---------------
title KMS Activator for Microsoft Office 2019 &cls&echo ************************************************* &Activador office2019&echo ************************************************* &echo.&echo Supported products:&echo Microsoft Office Standard 2019&echo Microsoft Office Professional 2019&echo.&echo Microsoft Office 2019 activation...
(if exist "%ProgramFiles%\Microsoft Office\Office16\ospp.vbs" cd /d "%ProgramFiles%\Microsoft Office\Office16")&(if exist "%ProgramFiles(x86)%\Microsoft Office\Office16\ospp.vbs" cd /d "%ProgramFiles(x86)%\Microsoft Office\Office16")&(for /f %%x in ('dir /b ..\root\Licenses16\proplusvl_kms*.xrm-ms') do cscript ospp.vbs /inslic:"..\root\Licenses16\%%x" >nul)&(for /f %%x in ('dir /b ..\root\Licenses16\proplus2019vl*.xrm-ms') do cscript ospp.vbs /inslic:"..\root\Licenses16\%%x" >nul)
cscript //nologo ospp.vbs /unpkey:6MWKP >nul&
cscript //nologo ospp.vbs /inpkey:NMMKJ-6RK4F-KMJVX-8D9MJ-6MWKP >nul&set i=1
:server
if %i%==1 set KMS_Sev=kms.digiboy.ir
if %i%==2 set KMS_Sev=kms8.MSGuides.com
if %i%==3 set KMS_Sev=kms.chinancce.com
if %i%==4 set KMS_Sev=fourdeltaone.net:1688
if %i%==5 set KMS_Sev=147.134.1.42
if %i%==6 set KMS_Sev=98.212.2.163
if %i%==7 set KMS_Sev=kms.crackmywpa.com
if %i%==8 set KMS_Sev=win81.no-ip.org
if %i%==9 set KMS_Sev=whwebsolution.no-ip.org
if %i%==10 set KMS_Sev=cckms.nccu.edu.tw
if %i%==11 set KMS_Sev=lsu-kms.lsu.edu
if %i%==12 set KMS_Sev=kms.isu.edu.tw
if %i%==13 set KMS_Sev=uitsckms.uit.tufts.edu
if %i%==14 set KMS_Sev=58.173.212.51
if %i%==15 set KMS_Sev=vhk.3322.org
if %i%==16 set KMS_Sev=140.133.45.107
if %i%==17 set KMS_Sev=noair.strangled.net:1688
if %i%==18 goto notsupported

cscript //nologo ospp.vbs /sethst:%KMS_Sev% >nul&echo ************************************************* &echo.
cscript //nologo ospp.vbs /act | find /i "successful" && (echo.&echo ************************************************* &echo.&choice /n /c YN /m "Do you want to restart your PC now [Y,N]?" & if errorlevel 2 exit) || (echo The connection to the server failed! Trying to connect to another one... & echo Please wait... & echo. & echo. & set /a i+=1 & goto server)
shutdown.exe /r /t 00
:notsupported
echo.&echo ************************************************* &echo Incorrect version of MS Office &echo Make sure that you use MS Office 2019/365 version.
:halt
pause >nul