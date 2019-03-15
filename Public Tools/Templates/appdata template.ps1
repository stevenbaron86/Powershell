
Param(
    [Parameter(Mandatory=$false, Position=0)]
    [string]$Setup
)



$ScriptName = 

$LocalPath = "$env:LOCALAPPDATA\Powershell"
$CredPath = "$env:LOCALAPPDATA\Powershell\$ScriptName"
if (!( Test-Path -Path $LocalPath ) -or ($Setup)) {
    New-Item -ItemType directory -Path $LocalPath -Force
    if (!( Test-Path -Path $CredPath ) -or ($Setup)) {
        New-Item -ItemType directory -Path $CredPath
        $credential = Get-Credential
        $credential.Password | ConvertFrom-SecureString | Out-File "$CredPath\string.txt"
        $credential.UserName | Out-File "$CredPath\user.txt"
    }
}