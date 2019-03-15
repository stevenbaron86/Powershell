$credential = Get-Credential
$credential.Password | ConvertFrom-SecureString | Out-File .\password.txt