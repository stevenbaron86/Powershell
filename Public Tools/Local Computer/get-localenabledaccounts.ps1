$serverlist =
$outfile =

$servers = Get-Content 
    $data = foreach($server in $servers){
        Get-WmiObject -ComputerName $server -Class Win32_UserAccount -Filter  "LocalAccount='True' and Disabled='False'"
        }
    $data | fl Caption | out-file 