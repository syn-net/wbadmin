@echo off
REM setlocal
REM wbadmin.bat:jeff
REM
REM Windows Seven (7) Backup script file
REM
REM	The GUI for running a full backup fails on me. This script uses the same
REM	API as the GUI.
REM
REM TODO(jeff): Verify that our disk partitions appear OK from a Linux rescue CD as per the documentation for this sort
REM of error seems to indicate to me that this may be the origin of the GUI error message.

REM TODO(jeff): Convert this script to PowerShell (ps1)

wbadmin stop job -quiet

echo "Commencing a full system backup using Windows Backup services..."
echo
REM We shall always depend on a disk drive assigned with the letter `X` to schedule a full backup, including all critical
REM partitions of said system.
REM (echo C && echo C)| wbadmin.exe start backup -backupTarget:X: -include:C:,C:\HP_RECOVERY,C:\SYSTEM -quiet
REM (echo C && echo & echo.)|wbadmin.exe start backup -backupTarget:X: -include:C:,C:\HP_RECOVERY,C:\SYSTEM -quiet
wbadmin.exe start backup -backupTarget:X: -include:C:,C:\HP_RECOVERY,C:\SYSTEM -quiet

REM Dismount the UMS drive of the ClickFree disk
cmd /c C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe "(new-object -COM Shell.Application).NameSpace(17).ParseName('X:').InvokeVerb('Eject')"
REM Dismount the VCD drive of the ClickFree disk
cmd /c C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe "(new-object -COM Shell.Application).NameSpace(17).ParseName('G:').InvokeVerb('Eject')"

REM format.com /FS:NTFS /Q X:
