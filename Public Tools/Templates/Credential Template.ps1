$credential = Get-Credential
New-Item -Path .\data -ItemType directory
$credential.Password | ConvertFrom-SecureString | Out-File ".\data\string.txt"
$credential.UserName | Out-File ".\data\user.txt"