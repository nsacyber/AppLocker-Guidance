REM *******************
REM This script looks up the computer's domain and then registers the "Create AppLocker Popup" task 
REM to trigger when an AppLocker event is created and display a popup to the user notifying them that 
REM AppLocker has triggered and to notify an administrator.
REM
REM This script can be pushed out as a computer startup script to create the “Create AppLocker Popup” 
REM task on each computer to trigger when an AppLocker event is created and display a popup to the 
REM user notifying them that AppLocker has triggered and to notify an administrator.  This file should 
REM be placed in the \\<domain>\SYSVOL\<domain>\Scripts file share along with the 
REM "AppLocker Popup Alert Task.xml" file in order to create the task successfully.
REM *******************

REM Get domain name
FOR /F "tokens=1* delims=REG_SZ " %%A IN ('REG QUERY HKLM\System\CurrentControlSet\Services\Tcpip\Parameters /v Domain') DO (
  SET COMPUTERDOMAIN=%%B
)
schtasks.exe /query /tn "AppLocker Popup Alert"
IF ERRORLEVEL 1 schtasks.exe /create /tn "AppLocker Popup Alert" /xml "\\%COMPUTERDOMAIN%\sysvol\%COMPUTERDOMAIN%\scripts\AppLocker Popup Alert Task.xml"
