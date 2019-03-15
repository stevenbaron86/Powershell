@echo  off
dir \\allulu\shared >nul 2>nul
if errorlevel 1 goto nonet

if "%salesuser%"=="" goto end

REM Found net.
SET DEST="\\ccreekdom\dfs\SalesBackup\%salesuser%\_robocopy"
SET LOG="%DEST%\robocopy.log"
SET SALESPROFILE="C:\users\%SALESUSER%"
md %DEST%
md %DEST%\Documents
md %DEST%\Pictures
md %DEST%\Videos
md %DEST%\Desktop
echo Documents...
robocopy "%salesprofile%\Documents" "%DEST%\Documents" /E  /DCOPY:T /COPY:DAT /R:1 /W:1 /V /NP /LOG:%LOG%
echo Pictures...
robocopy "%salesprofile%\Pictures" "%DEST%\Pictures" /E  /DCOPY:T /COPY:DAT /R:1 /W:1 /V /NP /LOG+:%LOG%
echo Videos...
robocopy "%salesprofile%\Videos" "%DEST%\Videos" /E  /DCOPY:T /COPY:DAT /R:1 /W:1 /V /NP /LOG+:%LOG%
echo Desktop...
robocopy "%salesprofile%\Desktop" "%DEST%\Desktop" /E /DCOPY:T /COPY:DAT /R:1 /W:1 /V /NP /LOG+:%LOG%
echo done.
goto end

:nonet
echo No network >>%LOG%
date /T >>%LOG%
time /T >>%LOG%
:end