cls
@echo off

Title Wifi PAssword Finder
NETSH WLAN SHOW PROFILE
pause>nul 

set /p Var1="Enter NetwOrk SSid"
NETSH WLAN SHOW PROFILE %Var1% Key=clear
pause>nul