#must already be connected with connect-microsoftteams

Param(
    [Parameter(Mandatory=$true, Position=0)]
    [string]$target
)

#find all teams in O365
$teams = Get-UnifiedGroup | Where-Object {$_.welcomemessageenabled -eq $false}

#loop through each team for a matching UPN
foreach($team in $teams){
    $t = Get-UnifiedGroupLinks -id $team.Name -LinkType members
    if($t.primarysmtpaddress -eq $target){
        write-host $team.alias
    }
}

