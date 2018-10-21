# Install AWS Systems Manager Agent
# Used to install the AWS Systems Manager Agent on Windows instances
# Devin St. Clair 2018

# Get list of all computers in the domain
$windowsInstances = (Get-ADComputer -Filter * | Select-Object -ExpandProperty Name)

# Iterate through the list of machines to copy the installer and install
foreach ($windowsInstance in $windowsInstances) {
    Copy-item -Path C:\Windows\Temp\AmazonSSMAgentSetup.exe -Destination \\awseuc1gx1dc02\c$\windows\temp\
    $InstallString = "C:\Windows\Temp\AmazonSSMAgentSetup.exe /q"
    ([WMICLASS]"\\$windowsInstance\ROOT\CIMV2:Win32_Process").Create($InstallString)
    
    #Output the install result to your Local C Drive
    Out-File -FilePath C:\SSMAgent-Installed.txt -Append -InputObject "$windowsInstance"
}

