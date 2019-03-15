if (Test-Connection -computername officepc168 -count 1 -quiet){write-host ok}
else {Write-Host no}