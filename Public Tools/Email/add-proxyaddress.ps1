

$user = read-host "Username: "
$alias = read-host "Alias: "

Set-ADUser $user -Add @{ProxyAddresses="smtp:$alias"}
Get-ADUser $user -Properties ProxyAddresses | Select-Object Name,ProxyAddresses | Format-List