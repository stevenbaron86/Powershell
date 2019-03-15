$searchbase = "OU=Office Computers,DC=ccreekdom,DC=canyoncreek,DC=com"

$computers = get-adcomputer -filter 'enabled -eq "true"' -searchbase $searchbase

$results = foreach($comp in $computers){
    if (Test-Connection -computername $comp.Name -count 1 -quiet)
        {
            $ic = Invoke-Command -cn $comp.name -ScriptBlock {Get-ItemProperty HKLM:\Software\WOW6432node\Microsoft\Windows\CurrentVersion\Uninstall\* | ? {$_.DisplayName -like "Microsoft Visio*"} | select DisplayName -first 1 } -ErrorAction SilentlyContinue 
                    if ($ic.DisplayName -ne $null)
                        {
                        New-Object -typename psobject -property `
                            @{
                                Displayname = $ic.displayname
                                Username =  gwmi win32_computersystem -comp $ic.PSComputerName | Select-Object -ExpandProperty Username
                                PSComputerName = $comp.name
                            }
                        }
                    else{}
        }
    else {}
    }

$Results | ft
