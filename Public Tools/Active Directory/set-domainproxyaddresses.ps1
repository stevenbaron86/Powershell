$users = Get-ADUser -Filter *
ForEach ($user in $users) {
    $upn = $user.userprincipalname
    $proxyaddress = @{'ProxyAddresses'="SMTP:$upn"} 
    set-aduser -identity $user.SamAccountName -replace $proxyaddress
} 


$users = Get-ADUser -Filter *
ForEach ($user in $users) {
    $upn = $user.userprincipalname
    $proxyaddress = "SMTP:$upn"
    set-aduser -identity $user.SamAccountName -replace @{proxyaddresses=$proxyaddress}
}