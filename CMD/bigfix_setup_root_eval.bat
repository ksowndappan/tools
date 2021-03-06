
REM work in progress
REM Setup a non-production BigFix Eval Server with SQL Developer Edition.

REM http://software.bigfix.com/download/bes/95/BigFix-BES-9.5.9.62.exe
REM http://download.microsoft.com/download/2/5/0/2508F7B4-6DDE-4C3E-B1FA-E1EB66F2F79F/SQLServer2016-SSEI-Dev.exe

SET BASEFOLDER=C:\tmp

REM Make folder if not existing:  https://stackoverflow.com/questions/4165387/create-folder-with-batch-but-only-if-it-doesnt-already-exist
if not exist "%BASEFOLDER%" mkdir %BASEFOLDER%

REM Open folder:
start "" %BASEFOLDER%


REM https://github.com/jgstew/bigfix-content/blob/master/fixlet/Install%20SQL%20Server%20Management%20Studio%2016.5.1%20-%20Windows.bes
REM Download SQL Server Management Studio:
start "" powershell -command "& { (New-Object Net.WebClient).DownloadFile('https://download.microsoft.com/download/0/5/B/05B2AF8F-906F-4C57-A58E-5780F64F9D62/SSMS-Setup-ENU.exe', '%BASEFOLDER%\SSMS-Setup-ENU.exe') }" -ExecutionPolicy Bypass


REM Download BigFix Root Server:
start "" powershell -command "& { (New-Object Net.WebClient).DownloadFile('http://software.bigfix.com/download/bes/95/BigFix-BES-9.5.9.62.exe', '%BASEFOLDER%\BigFix-BES.exe') }" -ExecutionPolicy Bypass


REM Download SQLServer Developer Edition:
powershell -command "& { (New-Object Net.WebClient).DownloadFile('http://download.microsoft.com/download/2/5/0/2508F7B4-6DDE-4C3E-B1FA-E1EB66F2F79F/SQLServer2016-SSEI-Dev.exe', '%BASEFOLDER%\SQLServer-SSEI-Dev.exe') }" -ExecutionPolicy Bypass
REM Install SQLServer Developer Edition:
REM https://docs.microsoft.com/en-us/sql/database-engine/install-windows/install-sql-server-from-the-command-prompt?view=sql-server-2017
REM Download Commnad:
%BASEFOLDER%\SQLServer-SSEI-Dev.exe /MEDIAPATH="%BASEFOLDER%" /ACTION=Download /LANGUAGE=en-US /MEDIATYPE=CAB /QUIET

REM Install Command: (interactive)
%BASEFOLDER%\SQLServer-SSEI-Dev.exe /ACTION=Install /MEDIAPATH=C:\tmp /IACCEPTSQLSERVERLICENSETERMS /LANGUAGE=en-US

REM https://download.microsoft.com/download/0/5/B/05B2AF8F-906F-4C57-A58E-5780F64F9D62/SSMS-Setup-ENU.exe
REM Install SQL Server Management Studio:
%BASEFOLDER%\SSMS-Setup-ENU.exe /install /quiet /norestart

REM for some reason, this didn't create a start menu shortcut it seems for SQL Server Management Studio


REM press any key to continue....
pause
