$date = (get-date) - (new-timespan -days 60) 
$users = get-aduser -filter 'enabled -eq "false" -and whenchanged -le $date' -properties lastlogondate,whenchanged
$users | format-table Name,lastlogondate,whenchanged
foreach($user in $users){
    remove-aduser -identity $user.DistinguishedName #-WhatIf
}