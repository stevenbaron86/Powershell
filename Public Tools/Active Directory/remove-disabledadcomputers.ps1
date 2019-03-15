$date = (get-date) - (new-timespan -days 60) 
$computers = get-adcomputer -filter 'enabled -eq "false" -and whenchanged -le $date' -properties lastlogondate,whenchanged
$computers | sort lastlogondate | format-table Name,lastlogondate,whenchanged
foreach($computer in $computers){
    Remove-ADObject -identity $computer.DistinguishedName -Recursive
}