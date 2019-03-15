$pcs = get-adcomputer -filter 'enabled -eq "true"'

$loop = foreach($pc in $pcs){
            if (Test-Connection -computername $pc.name -count 1 -quiet){
                gwmi win32_computersystem -comp $pc.name -ErrorAction silentlycontinue | select Username,name 
            } 
        }
$loop | sort name | ft -AutoSize

