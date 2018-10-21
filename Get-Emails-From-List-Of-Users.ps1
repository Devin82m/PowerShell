$names = Get-Content C:\scripts\emails.txt
foreach ($name in $names) {
    $sam = (Get-ADUser -fi * | ? name -like "*$name*").samaccountname
    (Get-ADUser $sam -Properties emailaddress).emailaddress
}