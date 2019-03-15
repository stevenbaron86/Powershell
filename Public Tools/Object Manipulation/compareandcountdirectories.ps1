$path1 = 
$path2 = 


$ref = gci $path1 |? {$_.LastAccessTime -ge (Get-Date).AddDays(-30) -and $_.psiscontainer -eq "true"}
$dif = gci $path2 |? {$_.LastAccessTime -ge (Get-Date).AddDays(-30) -and $_.psiscontainer -eq "true"}

try{$testcount = Compare-Object -ReferenceObject $ref -DifferenceObject $dif |? {$_.SideIndicator -eq "<="} | Measure-Object | Select-Object -expandproperty count
    write-host Moved $testcount new files
    }
catch{write-host Something went wrong here...}
