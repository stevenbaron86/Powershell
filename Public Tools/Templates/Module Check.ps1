$Modules = @("AzureAD", "MSOnline", "MicrosoftTeams")
foreach ($Module in $Modules) {
    if (!(Get-Module -ListAvailable -Name $Module)) {
        throw "Required module $Module not installed"
    } 
}
