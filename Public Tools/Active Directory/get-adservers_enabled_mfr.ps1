$comp = get-adcomputer -Filter {OperatingSystem -like "*Server*" -and Enabled -eq "true"}
$results = ForEach ($c in $comp) {get-wmiobject -class Win32_Computersystem -ComputerName $c.Name | Select-Object -Property Manufacturer, Name}
