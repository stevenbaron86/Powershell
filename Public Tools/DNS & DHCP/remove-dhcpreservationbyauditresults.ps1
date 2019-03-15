foreach($result in $results){
    if(($result.ping -like "false") -and ($result.DHCPreservation -ne "no DHCP")){
    $result
    #Remove-DhcpServerv4Reservation -computername dc3 -ipaddress $result.IPAddress -whatif
    }
}