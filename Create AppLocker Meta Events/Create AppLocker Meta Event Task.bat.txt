REM *******************
REM This script looks up the computer's domain and then registers the "Create AppLocker Meta Event" task 
REM to trigger when an AppLocker event is created and run a script to create the new AppLocker meta event 
REM with additional calling process and user information.
REM 
REM This script can be pushed out as a computer startup script to create the "Create AppLocker Meta Event" 
REM task on each computer to trigger when an AppLocker event is created and run a script to create a new 
REM AppLocker meta event with additional calling process and user information.  This file should be placed 
REM in the \\<domain>\SYSVOL\<domain>\Scripts file share along with the "Create AppLocker Meta 
REM Event.ps1.txt" powershell script file and the "Create AppLocker Meta Event Task.xml" file in order to 
REM create the task successfully.
REM *******************

REM Get domain name
FOR /F "tokens=1* delims=REG_SZ " %%A IN ('REG QUERY HKLM\System\CurrentControlSet\Services\Tcpip\Parameters /v Domain') DO (
  SET COMPUTERDOMAIN=%%B
)

schtasks.exe /query /tn "Create AppLocker Meta Event"
IF ERRORLEVEL 1 (
  mkdir C:\Windows\Scripts
  copy /y "\\%COMPUTERDOMAIN%\sysvol\%COMPUTERDOMAIN%\scripts\Create AppLocker Meta Event.ps1" C:\Windows\Scripts
  schtasks.exe /create /tn "Create AppLocker Meta Event" /xml "\\%COMPUTERDOMAIN%\sysvol\%COMPUTERDOMAIN%\scripts\Create AppLocker Meta Event Task.xml"
)
