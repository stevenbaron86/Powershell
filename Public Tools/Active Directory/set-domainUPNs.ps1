#Import the ActiveDirectory Module 
Import-Module ActiveDirectory

#Insert the old UPN Suffix here 
$oldSuffix = 

#Insert the new UPN Suffix here  
$newSuffix = 

#Replace with the OU you want to change suffixes for 
$ou = 

#Replace with the name of one of your AD server's
$server = 

#Now the script to replace the user accounts
Get-ADUser -SearchBase $ou -filter * | ForEach-Object { 
$newUpn = $_.UserPrincipalName.Replace($oldSuffix,$newSuffix) 
$_ | Set-ADUser -server $server -UserPrincipalName $newUpn 
}