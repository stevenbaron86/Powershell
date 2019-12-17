$users = gci $fileshare -Exclude $exclude
foreach ($user in $users) {
    icacls $user.FullName /grant ($domainusers + ':(OI)(CI)(RX)') | Out-Null
    $private = $user.fullname + "\private"
    icacls $private /inheritance:d
    icacls.exe $private /remove $domainusers
}