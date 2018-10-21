#This script can be used to gather a list of all the languages used in a particular environment by customer Libraries. 
#Devin St. Clair 8-28-2016

$environment = Read-Host -Prompt 'Enter the environment. (ex NA1, GX0)'
$groups = Get-Content "C:\Users\dstclair\Documents\NA2Languages.csv"

foreach ($group in $groups){
    try{
        Write-Host "------ $group ------"
        $group | Out-File -Append -FilePath "C:\Users\dstclair\Documents\Languages.csv" | out-string -width 4096 
        Get-ADGroupMember $group | select name, distinguishedname | Format-Table -Wrap | Out-File -Append -FilePath "C:\Users\dstclair\Documents\Languages.csv" | out-string -width 4096 
        }
    catch {
        Write-Warning "**** Error for $group ****"
        }
}




#(Get-ADObject -Filter {ObjectClass -eq "group"} -SearchBase "OU=NA2,OU=Clients,DC=cloud,DC=author-it,DC=com").name
 
#Get-ADGroupMember language.french | Where-Object {$_.distinguishedName -like "$environment"} | select name