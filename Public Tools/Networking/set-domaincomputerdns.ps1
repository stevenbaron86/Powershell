<#Gets all enabled computers in domain and registers them to DNS. Not recommended...#>

$servers= get-adcomputer -filter 'enabled -eq "true"'
icm -ComputerName $servers {ipconfig /registerdns}

