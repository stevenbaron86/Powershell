<#
.SYNOPSIS
  Connects to all O365/Azure environments.
.DESCRIPTION
  Contains mechanism for checking all required modules are present, saving of credentials locally in 
  appdata using DPAPI, then connecting to Exchange Online, Compliance and Security, Azure AD,  and Teams
.PARAMETER <Setup>
    Optional switch to re-run first time setup of credentials saving section
.PARAMETER <Credentials>
    Optional switch to prompt for credentials
.NOTES
  Version:        1.0
  Author:         Steven Baron
  Email:          stevenbaron86@gmail.com
  Creation Date:  2/27/2018
  
.EXAMPLE
  Connect-Exchange -Setup
    Runs setup again in case default credentials need changing
  Connect-Exchange -Credentials
    Prompts for credentials instead of checking for stored
#>

function Connect-Exchange {

[cmdletbinding()]
Param(
    [Parameter(Mandatory=$false, Position=0)]
    [switch]$Setup,
    [Parameter(Mandatory=$false, Position=0)]
    [switch]$Credentials
)

#Check for required modules
$Modules = @("AzureAD", "MSOnline", "MicrosoftTeams")
foreach ($Module in $Modules) {
    if (!(Get-Module -ListAvailable -Name $Module)) {
        throw "Required module $Module not installed"
    } 
}

#Default stored credential setup block, skipped if credentials parameter specified
if(!($Credentials)){
    $ScriptName = "Connect-Exchange"
    $LocalPath = "$env:LOCALAPPDATA\Powershell"
    $CredPath = "$env:LOCALAPPDATA\Powershell\$ScriptName"
    if (!( Test-Path -Path $LocalPath ) -or ($Setup)) {
        New-Item -ItemType directory -Path $LocalPath -Force | Out-Null
        if (!( Test-Path -Path $CredPath ) -or ($Setup)) {
            New-Item -ItemType directory -Path $CredPath -Force | Out-Null
            $credential = Get-Credential
            $credential.Password | ConvertFrom-SecureString | Out-File "$CredPath\string.txt"
            $credential.UserName | Out-File "$CredPath\user.txt"
        }
    }
}

#Gets stored credentials or prompts, stores to $usercredential
if($Credentials){
    $UserCredential = Get-Credential
}
else{
    $User = Get-Content "$CredPath\user.txt"
    $Pass = Get-Content "$CredPath\string.txt" | ConvertTo-SecureString
    $UserCredential = New-Object -typename System.Management.Automation.PSCredential -argumentlist $User, $Pass
}

# Connects to AzureAD, Exchange Online, and MS Teams.
Connect-MsolService -Credential $UserCredential
Connect-MicrosoftTeams -credential $UserCredential
$Session1 = New-PSSession -ConfigurationName Microsoft.Exchange -ConnectionUri https://outlook.office365.com/powershell-liveid/ -Credential $UserCredential -Authentication Basic -AllowRedirection
$Session2 = New-PSSession -ConfigurationName Microsoft.Exchange -ConnectionUri https://ps.compliance.protection.outlook.com/powershell-liveid/ -Credential $UserCredential -Authentication basic -allowredirection
Import-PSSession $Session1 -AllowClobber
Import-PSSession $Session2 -AllowClobber

}