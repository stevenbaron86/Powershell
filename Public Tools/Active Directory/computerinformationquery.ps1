

$computers = get-adcomputer -filter {name -like 'officenb*'}


$results = foreach($computer in $computers){
    if(Test-Connection -computername $computer.name -count 1 -quiet){
        $object = New-Object -typename psobject -property `
                @{
                    Computername = $computer.name
                    Username = (gwmi -ClassName CIM_ComputerSystem -computername $computer.name).username
                    SerialNumber = (gwmi -ClassName win32_bios -computername $computer.name).serialnumber
                    OSVersion = (gwmi -ClassName Win32_OperatingSystem -computername $computer.name).version
                }
        $object
    }
    else{}
}

$results