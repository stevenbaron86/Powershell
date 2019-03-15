
Param(
    [Parameter(Mandatory=$true, Position=0)]
    [string]$upn
)

#find all teams in O365
$teams = Get-UnifiedGroup | Where-Object {$_.welcomemessageenabled -eq $false}

#loop through each team for a matching UPN
foreach($team in $teams){
    $t = Get-UnifiedGroupLinks -id $team.Name -LinkType members
    if($t.primarysmtpaddress -eq $upn){
      remove-teamuser -groupid $team.ExternalDirectoryObjectId.tostring() -user $upn
      write-host "member removed from" $team.alias
    }
}
