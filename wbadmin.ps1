# wbadmin.ps1:jeff
#
# Windows Seven (7) Backup script file
#	The GUI for running a full backup fails on me. This script uses the same
#	API as the GUI.
#
# TODO(jeff): Verify that our disk partitions appear OK from a Linux rescue CD as per the documentation for this sort
# of error seems to indicate to me that this may be the origin of the GUI error message.
#
# TODO(jeff): Convert this script to PowerShell (ps1)

echo Commencing a full system backup using Windows Backup services..."
echo

# We shall always depend on a disk drive assigned with the letter `X` to schedule a full backup, including all critical
# partitions of said system.
#wbadmin start backup -backupTarget:X: -include:C:,C:\HP_RECOVERY,C:\SYSTEM -quiet

# Script cleanup phase!
#
# Dismount the VCD drive of the ClickFree disk
# Dismount the UMS drive of the ClickFree disk

"(new-object -COM Shell.Application).NameSpace(17).ParseName('G:').InvokeVerb('Eject')"
"(new-object -COM Shell.Application).NameSpace(17).ParseName('X:').InvokeVerb('Eject')"
