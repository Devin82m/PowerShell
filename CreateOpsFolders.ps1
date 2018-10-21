#This script can be used to create all the standard directories that the Ops department uses for scripts and other tools
#It will create the directories, then copy the scripts, tools, and keys into the directories. Devin St. Clair 8-26-2016

$creds = (Get-Credential -Message "Please Enter Cloud Credentials")
$servers = Get-Content "C:\Ops\Scripts\Source Files\computers.txt"
$logfilename = (Get-Date -Format yyyyMMdd) + " OpsDirectories.txt"

try {
    foreach ($server in $servers) {
        Invoke-Command -ComputerName $server -Credential $creds -ScriptBlock {
            $Paths = "C:\Ops\Scripts", "C:\Ops\Upgrades", "C:\Ops\Tools", "C:\Ops\Keys", "C:\Ops\Scripts\Source Files"
            foreach ($path in $paths) {
                try {
                    if ((Test-Path -Path $Path) -eq $False){
                    New-Item -Path $Path -Type Directory
                    }
                }
                Catch {
                }
            }
        }
    }
}
Catch {
    Out-File C:\Ops\Scripts\Logs\$logfilename
    Write-Host "Log file created. The log file is located in C:\Ops\Scripts\Logs look for the date"
}