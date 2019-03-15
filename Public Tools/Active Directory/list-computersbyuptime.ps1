Start-Transcript -path c:\users\stevenb\desktop\log.txt 

$object = New-Object -TypeName PSObject
$computers = get-adcomputer -filter * | where-Object {$_.name -like "officevm*" -or $_.name -like "W7NO*"} 
foreach($computer in $computers){
    $name = $computer.Name
        try{$uptime = (get-date) - (gcim Win32_OperatingSystem -computer $computer.name -ErrorAction SilentlyContinue).LastBootUpTime | select-object -expandproperty days
            if($uptime -ge 40)
                {write-host Computer $computer.name has an uptime of $uptime days} 
            else{}}
        catch{$uptime = "OFF"}
   

} 


Stop-Transcript
