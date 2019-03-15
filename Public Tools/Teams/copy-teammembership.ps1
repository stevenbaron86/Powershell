#must be UPNs recognized by o365. must be connected to connect-microsoftteams

Param(
    [Parameter(Mandatory=$true, Position=0)]
    [string]$source
,
    [Parameter(Mandatory=$true, Position=1)]
    [string]$target
)

$teams = Get-UnifiedGroup | Where-Object {$_.welcomemessageenabled -eq $false}

#loop through each team for a matching UPN
foreach($team in $teams){
    $t = Get-UnifiedGroupLinks -id $team.Name -LinkType members
    if($t.primarysmtpaddress -eq $source){
        add-teamuser -groupid $team.ExternalDirectoryObjectId.tostring() -user $target
        write-host "Member added to team" $team.alias
    }
}