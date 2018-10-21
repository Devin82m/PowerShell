#This is used to backup the computer of a former employee to Box.com. It will download and install Box Sync, 
#but you will need to enter your credentials once it starts. The script will wait to continue during this 
#process. The credential are in the password vault under "TermUserBackup". Devin St. Clair 8-29-2016

$url = "https://e3.boxcdn.net/box-installers/sync/Sync+4+External/BoxSyncSetup.exe"
$output = "C:\temp"

#Download, Install, and Start Box Sync
wget https://e3.boxcdn.net/box-installers/sync/Sync+4+External/BoxSyncSetup.exe -OutFile "C:\temp\BoxSyncSetup.exe" 
Set-Location -Path "C:\temp"
Start-Process -FilePath "BoxSyncSetup.exe" -Wait -Passthru
Start-Process -FilePath 'C:\Program Files\Box\Box Sync\BoxSync.exe'

#This will remove all the permissions from the user's files and directories

#This will create a folder in Box Sync named after the user

#This will copy the files and directories