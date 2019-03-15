
#$Range = read-host "subnet? x.x.x"

$range = "10.0.255"

$Results = 1..255 | foreach{

    $IP = $range + "." + $_

    $Ping = 
        try{Test-Connection $IP -count 1 -quiet}
        catch{Write-Output "No Ping"}

    $hostname = 
        try{[System.Net.DNS]::GetHostbyAddress($IP).hostname}
        catch{write-output "no DNS"}
    $DHCP = 
        try{(Get-DhcpServerv4Reservation -computername dc3 -IPAddress $IP -erroraction stop).Name}
        catch{Write-Output "No DHCP"}

    $object = New-Object -typename psobject -property `
        @{
            
            IPAddress = $IP
            Ping = $Ping
            Hostname = $hostname
            DHCPReservation = $DHCP

        }
    $object
}
$results | ft IPaddress,ping,hostname,dhcpreservation

