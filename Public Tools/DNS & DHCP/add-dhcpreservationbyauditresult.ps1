

foreach($result in $results){
    if(($result.ping -like "true") -and ($result.hostname -ne "no DNS") -and ($result.DHCPreservation -eq "no DHCP")){
   
   
   
    $hostname = $result.hostname
    $IP = $result.ipaddress
    try{$macaddress = (Get-WmiObject win32_networkadapterconfiguration -ComputerName $hostname -ErrorAction Stop | select description, macaddress, ipaddress | where IPaddress -like "$IP").macaddress}
    catch{}
    $macaddress = $macaddress.replace(':','')

    try{Add-DhcpServerv4Reservation -computername dc3 -ScopeId 10.0.0.0 -IPAddress $IP -ClientId $macaddress -name $hostname}
    catch{write-output $hostname "doesnt like your automated DHCP Reservation"}


    }}





